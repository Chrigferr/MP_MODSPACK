--[[
*****************************************
*			Map Labels					*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************

MapLabels:	Creates main thread, loads other ML lua files and other dependencies and 
			creates shared global tables, variables, constants and functions
			Handles game events

]]--
print(":::MAPLABELS::: MapLabels loaded")

----HazelUtils Defines---------
DEBUGSTRING = ">>> "
SAVESTRING = "MLed1c8ceb81d3" --if change this, will not be compatible with previous version save games
SAVEVER = 5
bDebug = true
bDebugV = false
-------------------------------

--global tables
--tables persistent aross save games need to be members of g
--need to be defined prior to loading ML_API files as they use these tables
g = { } 
g.Labels = { }
	--[[ g.Labels
			.MainType = string
			.SubType = string
			.Name = localized name
			.ToolTip = localized string, optional
			.Icon = optional (PLAYER labels only)
			.PlotX = x coord
			.PlotY = y coord
	]]--
g.Options = { }  --[[ g.Options["Type"] = Value ]]--
g.var = { }
g.UnitsKilled = { }
g.CitiesCaptured = { }
g.IconsRecent = { }
g.CivCultures = { }
g.MainTypes = { }
g.SubTypes = { }


--includes
--libraries
include("MenuUtils")
include("InstanceManager")
include("FLuaVector")
include("MapGenerator")
include("ML_LIB_TableSaverLoader")
include("ML_LIB_PlotIterators")
include("ML_LIB_HazelUtils") --must load after above HazelUtils defines and before ML_API files
include("ML_LIB_MapLabelFunctions")
--API
include("ML_API_Labels")
include("ML_API_Modes")
include("ML_API_DLG")
include("ML_API_ModUtils")
--UI
include("ML_UI_DLG")
include("ML_UI_MainPanel")
include("ML_UI_OptionsPanel")
include("ML_UI_Misc")

--defines
LABELDISPLAY_DISABLED = "LABELDISPLAY_DISABLED"
LABELDISPLAY_TEXTONLY = "LABELDISPLAY_TEXTONLY"
LABELDISPLAY_ICONONLY = "LABELDISPLAY_ICONONLY"
LABELDISPLAY_TEXTANDICON = "LABELDISPLAY_TEXTANDICON"

NEEDSITERATION = false
ITERATIONDONE = true

DYNAMIC = 1
ICON = 2
ADD=3
EDIT=4
MOVE=5
DELETE=6
OPTIONS = 7
MAIN = 8
MOVETWO = 9
ERRORMSG = 10
QUICKADD = 11
DEFAULTS = 12

RED="_R"
BLUE="_B"
GREEN="_G"
ALPHA="_Alpha"

MOREICONPLUS = "[ICON_ML_UP]"
MOREICONMINUS = "[ICON_ML_DOWN]"

VALUEALL = 10000
VALUENONE = 0

HUMANID = 0
HUMANTEAMID = 0

modUserData = Modding.OpenUserData(SAVESTRING, SAVEVER)

--variables
bLabelsRegistered = false
bMMRegistered = false
bCityScreen = false
bDLGStart = true
bPopupGridOpen = false





--TableSaverLoader save intercept functions
--NOTE: SaveData(), LoadData(), IsSaveGame() are in HazelUtils

function OnEnterGame()   --Runs when Begin or Continue Your Journey pressed
	print("Player entering game ...")
	ContextPtr:LookUpControl("/InGame/GameMenu/SaveGameButton"):RegisterCallback(Mouse.eLClick, SaveGameIntercept)
	ContextPtr:LookUpControl("/InGame/GameMenu/QuickSaveButton"):RegisterCallback(Mouse.eLClick, QuickSaveIntercept)
	SaveData()	--before the "Initial" autosave; this is extra on a post-turn-0 game load but won't hurt
end
--Events.LoadScreenClose.Add(OnEnterGame)

function SaveGameIntercept()	--overrides Civ5 code when player presses Save Game from Game Menu or Cntr-s
	SaveData()
	UIManager:QueuePopup(ContextPtr:LookUpControl("/InGame/GameMenu/SaveMenu"), PopupPriority.SaveMenu)
end

function QuickSaveIntercept()	--overrides Civ5 code when player presses Quick Save from Game Menu or F11
	SaveData()
	UI.QuickSave()
end

local autoSaveFreq = OptionsManager.GetTurnsBetweenAutosave_Cached()
function OnGameOptionsChanged()
	autoSaveFreq = OptionsManager.GetTurnsBetweenAutosave_Cached()
end
Events.GameOptionsChanged.Add(OnGameOptionsChanged)

function OnAIProcessingEndedForPlayer(iPlayer)
	if iPlayer == 63 then					--runs on barb turn AFTER barb unit moves (very close to the regular autosave)
		if Game.GetGameTurn() % autoSaveFreq == 0 then	--only need to do on autosave turns
			SaveData()
		end
	end
end
Events.AIProcessingEndedForPlayer.Add(OnAIProcessingEndedForPlayer)

--game interceptions
function OnPlayerDoTurn_CheckBattles(iPlayerID)
	iPlayerActive = Game.GetActivePlayer()
	if (iPlayerID == iPlayerActive) then 
		if (Game.GetGameTurnYear() < (g.var.LastYearBattleChecked + g.Options.BattleLengthYears)) then
			dprintV("Not enough turns have passed since last checked new battle labels; current year: "..Game.GetGameTurnYear().."; year needs to be: "..(g.var.LastYearBattleChecked + g.Options.BattleLengthYears))
		elseif g.Options.BattleEnabled == 1 then
			NewBattleLabel()
		end
	end
end
GameEvents.PlayerDoTurn.Add(OnPlayerDoTurn_CheckBattles)

function OnFOWStateChanged(hexPos, iFog)
	--local BlackFog = 0 -- invisible
	local GreyFog  = 1 -- once seen
	local WhiteFog = 2 -- eyes on
	local x, y = ToGridFromHex(hexPos.x,hexPos.y)

	if LabelAtPlot(x,y) and (iFog == GreyFog or iFog == WhiteFog) then
		dprintV("OnFOWStateChanged(): LabelAtPlot=true")
		_, MapLabel, i = LabelAtPlot(x,y,true)
		DrawLabel(i)
		PopulateLabelList()
	end
end
Events.HexFOWStateChanged.Add(OnFOWStateChanged)

function OnMiniMapClick(bIsChecked)
	if (bIsChecked) then
		g.var.ShowLabels = true
		RedrawLabels()
	else
		g.var.ShowLabels = false
		RedrawLabels()
	end
end

function OnMouseOverHex(hexX, hexY)
	if (GetMode() and (GetMode().i==ADD or GetMode().i==MOVETWO or GetMode().i==QUICKADD)) then
		local i, M = GetMode().i, GetMode().M
		local f_Cursor=M.f_Cursor
		dprintV({"OnMouseOverHex()",hexX,hexY})
		local iHex = ToHexFromGrid(Vector2(hexX, hexY))
		local vColorHex = M.vColor
			
		M.bDisabled = false
		for i,row in pairs(g.Labels) do
			if (row.PlotX == hexX and row.PlotY == hexY) then
				M.bDisabled = true
				vColorHex = Vector4(1,0,0,1) --red if disabled
--				f_Cursor=MouseAddModeDisabled
			end
		end
		f_Cursor()
		Events.ClearHexHighlights()
		Events.SerialEventHexHighlight(iHex,true,vColorHex) 
	end

	if (GetMode() and GetMode().i==MOVETWO) then
		local i=MODES[MOVETWO].iLabel	
		local world = GetWorldPos(UI.GetMouseOverHex())
		tLabelInstances[i].Anchor:SetWorldPosition(VecAdd(world, vOffset))
	end

end
Events.SerialEventMouseOverHex.Add(OnMouseOverHex)


function SetActivePlayer(iPlayer, iPrevPlayer)
	if (not bMMRegistered) then --insert Map Labels into MiniMap Options
		local c = ContextPtr:LookUpControl("/InGame/WorldView/MiniMapPanel/MainStack")
		if (c) then
			Controls.MMStack:ChangeParent(c)
			bMMRegistered = true
		end
	end

	if (not bLabelsRegistered) then --move Label Container behind UI elements
		local c = ContextPtr:LookUpControl("/InGame/WorldViewControls")
		if (c) then
			Controls.aaLabelContainer:ChangeParent(c)
			c:SortChildren(	function(a,b) return a:GetID()>b:GetID(); end	)
			bLabelsRegistered = true
		end
	end
end
Events.GameplaySetActivePlayer.Add(SetActivePlayer)


function InputHandler(uiMsg, wParam, lParam)
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_F11 then
			QuickSaveIntercept()		--F11 Quicksave
        		return true
		elseif wParam == Keys.S and UIManager:GetControl() then
			SaveGameIntercept()			--ctrl-s
			return true
		end
	end

	if bCityScreen == false then
		--CTRL-SHIFT-L
		if (uiMsg == KeyEvents.KeyDown and wParam == Keys.L and UIManager:GetControl() and UIManager:GetShift()) then
			dprintV("InputHandler: CTRL-SHIFT-L captured")
			if (Controls.Popup_Grid:IsHidden()) then
				ShowPopup()
			else
				HidePopup()
			end
			return true
		end

		--CTRL-SHIFT-A
		if (uiMsg == KeyEvents.KeyDown and wParam == Keys.A and UIManager:GetControl() and UIManager:GetShift()) then
			dprintV("InputHandler: CTRL-SHIFT-A captured")
			EnterMode(ADD)
			return true
		end

		--CTRL-A
		if (uiMsg == KeyEvents.KeyDown and wParam == Keys.A and UIManager:GetControl()) then
			dprintV("InputHandler: CTRL-A captured")
			EnterMode(QUICKADD)
			return true
		end
	end

	--ESCAPE
	if (wParam == Keys.VK_ESCAPE) then
		if (GetMode()) then 
			ExitMode(GetMode().i)
			return true
		elseif (not Controls.IconContainer:IsHidden()) then
			HideIconPanel()
			return true
		elseif (not Controls.Message:IsHidden()) then
			HideMessage()
			return true
		elseif (not Controls.AddEditContainer:IsHidden()) then
			HideAddEdit()
			return true
		elseif (not Controls.DLG_Start:IsHidden()) then
			HideDLGStart()
			return true
		elseif (not Controls.DLGCulturesContainer:IsHidden()) then
			HideDLGCultures()
			return true
		end
	end

	--MOUSE L CLICK
	if (uiMsg == MouseEvents.LButtonUp) then
		if ((MODES[ADD].b and not MODES[ADD].bDisabled) or
			(MODES[MOVETWO].b and not MODES[MOVETWO].bDisabled) or
			(MODES[QUICKADD].b and not MODES[QUICKADD].bDisabled)) then
			dprintV("InputHandler: Mouse Click detected in ADD, QUICKADD or MOVETWO mode")
			GetMode().M.f_Click()
			return true
		end
	end

	--MOUSE R CLICK
	if (uiMsg == MouseEvents.RButtonUp) then
		if (GetMode()) then 
			dprintV("InputHandler: R Mouse UP detected in label mode")
			ExitMode(GetMode().i)
			return true
		end
	end

	if (uiMsg == MouseEvents.RButtonDown) then 
		dprintV("InputHandler: R Mouse DOWN detected in label mode")
		if (GetMode()) then return true; end --if don't intercept, will cause unit movement
	end

end
ContextPtr:SetInputHandler(InputHandler)

--NOTE: do not hide contextptr at any point as TableSaverLoader save intercepts (above) may not fire if hidden
function Hide() 
	if not Controls.Popup_Grid:IsHidden() then
		Controls.Popup_Grid:SetHide(true)
		bPopupGridOpen = true
	end
	Controls.aaLabelContainer:SetHide(true)
	bCityScreen = true
end
Events.SerialEventEnterCityScreen.Add(Hide)

function Show()
	Controls.aaLabelContainer:SetHide(false)
	if bPopupGridOpen then
		Controls.Popup_Grid:SetHide(false)
	end
	bCityScreen = false
end
Events.SerialEventExitCityScreen.Add(Show)



--init
function init()
	MouseBusy()
	InitTables() --needs to be called before LoadData() so g tables can be overwritten
	InitModes()
	InitLabels()
	InitMainPanel()
	MouseNormal()

	HUMANID, HUMANTEAMID = GetActivePlayer()
	vOffset = {x=g.Options["LabelOffsetX"], y=g.Options["LabelOffsetY"], z=0}

	if (IsSaveGame()) then -- SAVED GAME
		dprint("Setting Up Save Game")
		LoadData() --load data and options from save game
		DrawAllLabels()
		bDLGStart = false
	else -- NEW GAME
		dprint("Setting Up New Game")
		if (g.Options["MapType"] == "STATIC") then
			g.Labels = DBTable{table="ML_Labels_Static", type=ONE_TO_MANY}
		else --MapType == DYNAMIC
			MLLoad() --load global options
			ResetIconStrings()
			local startEra = GameInfo.Eras[PreGame.GetEra()].Type
			local sEra
			if (	startEra == "ERA_INDUSTRIAL" or
					startEra == "ERA_MODERN" or
					startEra == "ERA_POSTMODERN" or
					startEra == "ERA_FUTURE") then
				sEra = "MODERN"
			else
				sEra = "ANCIENT"
			end
			GetCivCultures(sEra)
			bDLGStart = true
			ShowDLGStart()
		end
		
		--send player notification
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, Locale.ConvertTextKey("TXT_KEY_ML_NOTIFY"), Locale.ConvertTextKey("TXT_KEY_ML_NOTIFY_HEADER"))
	end

	--must be called after InitMainPanel() as needs calculated screen/grid size 
	--and after loading save game tables
	Init_UI_Misc()
	InitOptionsPanel() 
	Init_UI_DLG()
	
	LuaEvents.MapLabels_Loaded()
end

Events.LoadScreenClose.Add(init)