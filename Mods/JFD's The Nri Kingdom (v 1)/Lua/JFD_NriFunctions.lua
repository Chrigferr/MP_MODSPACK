-- JFD_NriFunctions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_AtPeace
--------------------------------------------------------------------------------------------------------------------------
function JFD_AtPeace(playerID)
	local atPeace = false
	if Teams[Players[playerID]:GetTeam()]:GetAtWarCount(true) == 0 then 
		atPeace = true 
	end

	return atPeace
end
--------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingPietyPrestige
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingPietyPrestige()
	local pietyPrestigeModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	local isUsingPiety = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == pietyPrestigeModID) then
	    isUsingPiety = true
	    break
	  end
	end

	return isUsingPiety
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SetButtonSize
--------------------------------------------------------------------------------------------------------------------------
local WordWrapOffset = 19;
local WordWrapAnimOffset = 3;

function JFD_SetButtonSize(textControl, buttonControl, animControl, buttonHL)

	--print(textControl:GetText());
	local sizeY = textControl:GetSizeY() + WordWrapOffset;
	buttonControl:SetSizeY(sizeY);
	animControl:SetSizeY(sizeY+WordWrapAnimOffset);
	buttonHL:SetSizeY(sizeY+WordWrapAnimOffset);
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
--Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
local activeTeam			= Teams[Game.GetActiveTeam()]
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_NRI"]
local isNriCivActive		= JFD_IsCivilisationActive(civilisationID)
local isNriActivePlayer		= activePlayer:GetCivilizationType() == civilisationID
local isUsingPietyPrestige	= JFD_IsUsingPietyPrestige()
local mathCeil				= math.ceil

if isNriCivActive then
	print("eze Nri Eri is in the game")
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_InitNri
--------------------------------------------------------------------------------------------------------------------------
local policyNriID = GameInfoTypes["POLICY_JFD_NRI"]

function JFD_InitNri()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:GetCivilizationType() == civilisationID and (not player:IsHuman())) then
			if (not player:HasPolicy(policyNriID)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyNriID, true)	
			end
		end
	end 
end

if isNriCivActive then
	Events.LoadScreenClose.Add(JFD_InitPapalStates)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CanWarAgainstPoorNri
--------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]

function JFD_CanWarAgainstPoorNri(teamID, otherTeamID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	local playerID = player:GetID()
	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
	local otherPlayerID = otherPlayer:GetID()
	if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then
		if player:GetCurrentEra() < eraIndustrialID then
			local religionID = player:GetReligionCreatedByPlayer()
			if religionID > 0 then
				if isUsingPietyPrestige then
					if (JFD_HasStateReligion(otherPlayerID) and JFD_GetStateReligion(otherPlayerID) == religionID) then
						return false
					end
				else
					if otherPlayer:HasReligionInMostCities(religionID) then
						return false
					end
				end
			end
		end
	elseif (otherPlayer:IsEverAlive() and otherPlayer:GetCivilizationType() == civilisationID) then
		if otherPlayer:GetCurrentEra() < eraIndustrialID then
			local religionID = otherPlayer:GetReligionCreatedByPlayer()
			if religionID > 0 then
				if isUsingPietyPrestige then
					if (JFD_HasStateReligion(playerID) and JFD_GetStateReligion(playerID) == religionID) then
						return false
					end
				else
					if player:HasReligionInMostCities(religionID) then
						return false
					end
				end
			end
		end
	end
	
	return true
end

if isNriCivActive then
	GameEvents.CanDeclareWar.Add(JFD_CanWarAgainstPoorNri)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_StopCityStatesFromDoWNri
----------------------------------------------------------------------------------------------------------------------------
function JFD_StopCityStatesFromDoWNri(teamID, otherTeamID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
	if (player:IsEverAlive() and player:IsMinorCiv() and otherPlayer:GetCivilizationType() == civilisationID) then
		local religionID = otherPlayer:GetReligionCreatedByPlayer()
		if (otherPlayer:GetCurrentEra() < eraIndustrialID and religionID > 0) then
			if player:GetCapitalCity():GetReligiousMajority() == religionID then
				Teams[otherTeamID]:MakePeace(teamID)
				player:ChangeMinorCivFriendshipWithMajor(otherPlayer:GetID(), 1)
				if activeTeam:IsHasMet(teamID) then
					local shortDescription = Locale.ConvertTextKey("TXT_KEY_JFD_NRI_CITY_STATES_DECLARE_PEACE_NOTIFICATION_SHORT")
					local description = Locale.ConvertTextKey("TXT_KEY_JFD_NRI_CITY_STATES_DECLARE_PEACE_NOTIFICATION", player:GetName(), otherPlayer:GetCivilizationDescription())
					otherPlayer:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, shortDescription, -1, -1)
				end
			end
		end
	end
end
GameEvents.DeclareWar.Add(JFD_StopCityStatesFromDoWNri)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_MburichiBarbNomming
--------------------------------------------------------------------------------------------------------------------------
local direction_types = {
	DirectionTypes.DIRECTION_NORTHEAST,
	DirectionTypes.DIRECTION_NORTHWEST,
	DirectionTypes.DIRECTION_EAST,
	DirectionTypes.DIRECTION_SOUTHEAST,
	DirectionTypes.DIRECTION_SOUTHWEST,
	DirectionTypes.DIRECTION_WEST,}
local playerBarbarianID = 63
local unitMburichiID	= GameInfoTypes["UNIT_JFD_MBURICHI"]
local unitDomainLandID	= GameInfoTypes["DOMAIN_LAND"]

function JFD_MburichiBarbNomming(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == unitMburichiID then
		for loop, direction in ipairs(direction_types) do
			local adjPlot = Map.PlotDirection(unitX, unitY, direction)
			if (adjPlot and adjPlot:IsUnit()) then
				local adjUnit = adjPlot:GetUnit()
				if adjUnit:GetOwner() == playerBarbarianID then
					local faithReward = adjUnit:GetBaseCombatStrength() * 2
					local adjUnitX = adjUnit:GetX()
					local adjUnitY = adjUnit:GetY()
					adjUnit:Kill(true, playerID)
					player:ChangeFaith(faithReward)
					unit:ChangeDamage(34)
					
					local hex = ToHexFromGrid(Vector2(adjUnitX, adjUnitY))
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(adjUnitX, adjUnitY))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_PEACE]", faithReward))
					Events.GameplayFX(hex.x, hex.y, -1)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_MburichiBarbNomming)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_MburichiAIFaith
--------------------------------------------------------------------------------------------------------------------------
function JFD_MburichiAIFaith(playerID, greatPersonID)
	local player = Players[playerID]
	if (not player:IsHuman()) then
		local unit = player:GetUnitByID(greatPersonID)
		if unit:GetUnitType() == unitMburichiID then
			local faithReward = JFD_GetRandom(1,70)
			player:ChangeFaith(faithReward)
		end
	end
end

if (isNriCivActive and (not isNriActivePlayer)) then
	GameEvents.GreatPersonExpended.Add(JFD_MburichiAIFaith)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_MburichiOnPantheon
--------------------------------------------------------------------------------------------------------------------------
function JFD_MburichiOnPantheon(playerID)
	local player = Players[playerID]
	if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then
		player:InitUnit(unitMburichiID, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())
	end
end

if isNriCivActive then
	GameEvents.PantheonFounded.Add(JFD_MburichiOnPantheon)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_BronzeCaster
--------------------------------------------------------------------------------------------------------------------------
local buildingBronzeID	= GameInfoTypes["BUILDING_JFD_BRONZE_CASTER"]
local resourceCopperID	= GameInfoTypes["RESOURCE_COPPER"]
local resourceIronID	= GameInfoTypes["RESOURCE_IRON"]

function JFD_BronzeCaster(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then
		if buildingID == buildingBronzeID then
			local city = player:GetCityByID(cityID)
			local plot = Map.GetPlot(city:GetX(), city:GetY())
			for adjacentPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if adjacentPlot:GetResourceType() == resourceIronID then
					adjacentPlot:SetResourceType(resourceCopperID)
				end
			end
		end
	end
end

if isNriCivActive then
	GameEvents.CityConstructed.Add(JFD_BronzeCaster)
end
--==========================================================================================================================
-- UI FUNCTIONS -- Thanks to Gedemon for the help!
--==========================================================================================================================
-- Globals
-------------------------------------------------
local minorCivID 		 = -1
local minorCivTeamID 	 = -1
local cityStatePopupInfo = nil
local faithGiftLarge 	 = mathCeil(GameDefines["MINOR_GOLD_GIFT_LARGE"] * 80 / 100)
local faithGiftMedium 	 = mathCeil(GameDefines["MINOR_GOLD_GIFT_MEDIUM"] * 80 / 100)
local faithGiftSmall 	 = mathCeil(GameDefines["MINOR_GOLD_GIFT_SMALL"] * 80 / 100)

Controls.JFDShowFaithGiftsButton:SetHide(true)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_HideFaithPurchaseOptions
--------------------------------------------------------------------------------------------------------------------------
function JFD_HideFaithPurchaseOptions()
	Controls.JFDFaithGiftStack:SetHide(true)
end

if (isNriCivActive and isNriActivePlayer) then
	Events.SerialEventGameMessagePopupProcessed.Add(JFD_HideFaithPurchaseOptions)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_InitButton
--------------------------------------------------------------------------------------------------------------------------
function JFD_InitButton()
	if (not ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonStack"):IsHidden()) then
		Controls.JFDShowFaithGiftsButton:ChangeParent(ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonStack"))
		ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonStack"):ReprocessAnchoring()
				
		Controls.JFDFaithGiftStack:ChangeParent(ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonScrollPanel"))
		ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonScrollPanel"):ReprocessAnchoring()
	end
end

if (isNriCivActive and isNriActivePlayer) then
	Events.SerialEventGameMessagePopup.Add(JFD_InitButton)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_OnBack
--------------------------------------------------------------------------------------------------------------------------
function JFD_OnBack()
	Controls.JFDFaithGiftStack:SetHide(true)
	ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonStack"):SetHide(false)
	ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonStack"):ReprocessAnchoring()
end
Controls.JFDFaithGiftBackButton:RegisterCallback(Mouse.eLClick, JFD_OnBack)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_OnCityStateDiploPopup
--------------------------------------------------------------------------------------------------------------------------
local buttonPopupCityStateDiplo = ButtonPopupTypes["BUTTONPOPUP_CITY_STATE_DIPLO"]

function JFD_OnCityStateDiploPopup(popupInfo)
	if popupInfo.Type ~= buttonPopupCityStateDiplo then
		return
	end
	
	cityStatePopupInfo = popupInfo
	local playerID = popupInfo.Data1
    local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	
	minorCivID = playerID
    minorCivTeamID = playerTeamID
	
	local forcePeace = false
	
	JFD_UpdateDeclareWarButon()
	JFD_UpdateFaithGiftsButton()
end

if (isNriCivActive and isNriActivePlayer) then
	Events.SerialEventGameMessagePopup.Add(JFD_OnCityStateDiploPopup)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_OnGameDirty
--------------------------------------------------------------------------------------------------------------------------
function JFD_OnGameDirty()
	if (ContextPtr:LookUpControl("/InGame/CityStateDiploPopup"):IsHidden()) then
		return
	end	
	JFD_UpdateFaithGiftsButton()
end

if (isNriCivActive and isNriActivePlayer) then
	Events.SerialEventGameDataDirty.Add(JFD_OnGameDirty)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_OnPurchaseInfluenceSmall
--------------------------------------------------------------------------------------------------------------------------
function JFD_OnPurchaseInfluenceSmall()
	local player = Players[minorCivID]
	local smallInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, faithGiftSmall)
	activePlayer:ChangeFaith(-faithGiftSmall)
	player:ChangeMinorCivFriendshipWithMajor(activePlayerID, smallInfluenceReward)
	JFD_OnBack()
end

if (isNriCivActive and isNriActivePlayer) then
	Controls.JFDFaithGift1Button:RegisterCallback(Mouse.eLClick, JFD_OnPurchaseInfluenceSmall)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_OnPurchaseInfluenceMedium
--------------------------------------------------------------------------------------------------------------------------
function JFD_OnPurchaseInfluenceMedium()
	local player = Players[minorCivID]
	local mediumInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, faithGiftMedium)
	activePlayer:ChangeFaith(-faithGiftMedium)
	player:ChangeMinorCivFriendshipWithMajor(activePlayerID, mediumInfluenceReward)
	JFD_OnBack()
end

if (isNriCivActive and isNriActivePlayer) then
	Controls.JFDFaithGift2Button:RegisterCallback(Mouse.eLClick, JFD_OnPurchaseInfluenceMedium)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_OnPurchaseInfluenceLarge
--------------------------------------------------------------------------------------------------------------------------
function JFD_OnPurchaseInfluenceLarge()
	local player = Players[minorCivID]
	local largeInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, faithGiftLarge)
	activePlayer:ChangeFaith(-faithGiftLarge)
	player:ChangeMinorCivFriendshipWithMajor(activePlayerID, largeInfluenceReward)
	JFD_OnBack()
end

if (isNriCivActive and isNriActivePlayer) then
	Controls.JFDFaithGift3Button:RegisterCallback(Mouse.eLClick, JFD_OnPurchaseInfluenceLarge)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ShowFaithPurchaseOptions
--------------------------------------------------------------------------------------------------------------------------
function JFD_ShowFaithPurchaseOptions()
	Controls.JFDFaithGiftStack:SetHide(false);
	ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonStack"):SetHide(true);
	JFD_UpdateFaithGiftsStack();
end

if (isNriCivActive and isNriActivePlayer) then
	Controls.JFDShowFaithGiftsButton:RegisterCallback(Mouse.eLClick, JFD_ShowFaithPurchaseOptions)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateFaithGiftsButton
--------------------------------------------------------------------------------------------------------------------------
function JFD_UpdateFaithGiftsButton()
	local minor = Players[minorCivID]
	local religionID = activePlayer:GetReligionCreatedByPlayer()
	local minorCapital = minor:GetCapitalCity()
	local isFaithGiftingDisabled = true
	if minorCapital then
		local minorCapitalReligionID = minorCapital:GetReligiousMajority()
		if (JFD_AtPeace(activePlayerID) and religionID > 0 and minorCapitalReligionID == religionID) then
			isFaithGiftingDisabled = false
		end
		
		if isFaithGiftingDisabled then
			local disabledText = "[COLOR_FADING_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_SHOW_FAITH_GIFTS_BUTTON") .. "[ENDCOLOR]"
			Controls.JFDShowFaithGiftsButton:SetText(disabledText)
			Controls.JFDShowFaithGiftsButton:LocalizeAndSetToolTip("TXT_KEY_JFD_SHOW_FAITH_GIFTS_BUTTON_TT_DISABLED")
		else
			Controls.JFDShowFaithGiftsButton:LocalizeAndSetText("TXT_KEY_JFD_SHOW_FAITH_GIFTS_BUTTON")
			Controls.JFDShowFaithGiftsButton:LocalizeAndSetToolTip("TXT_KEY_JFD_SHOW_FAITH_GIFTS_BUTTON_TT")
		end
	end
	Controls.JFDShowFaithGiftsButton:SetDisabled(isFaithGiftingDisabled)
	Controls.JFDShowFaithGiftsButton:SetHide(false)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateDeclareWarButon
--------------------------------------------------------------------------------------------------------------------------
function JFD_UpdateDeclareWarButon(playerID)
	local player = Players[minorCivID]
	local warButton = ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/WarButton")
	local religionID = activePlayer:GetReligionCreatedByPlayer()
	local minorCapital = player:GetCapitalCity()
	local isFaithGiftingDisabled = true
	if minorCapital then
		local minorCapitalReligionID = minorCapital:GetReligiousMajority()
		if (JFD_AtPeace(activePlayerID) and religionID > 0 and minorCapitalReligionID == religionID and activePlayer:GetCurrentEra() < eraIndustrialID) then
			local disabledText = "[COLOR_FADING_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_POP_CSTATE_DECLARE_WAR") .. "[ENDCOLOR]"
			warButton:SetDisabled(true)
			warButton:LocalizeAndSetText(disabledText)
			warButton:LocalizeAndSetToolTip("TXT_KEY_JFD_NRI_WAR_BUTTON_TT_DISABLED")
		else
			warButton:SetDisabled(false)
			warButton:LocalizeAndSetText("TXT_KEY_POP_CSTATE_DECLARE_WAR")
			warButton:LocalizeAndSetToolTip(nil)
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateFaithGiftsStack
--------------------------------------------------------------------------------------------------------------------------
local friendsAmount = GameDefines["FRIENDSHIP_THRESHOLD_FRIENDS"]
local alliesAmount 	= GameDefines["FRIENDSHIP_THRESHOLD_ALLIES"]
   
function JFD_UpdateFaithGiftsStack()
	local player = Players[minorCivID]
	Controls.JFDFaithGift1:SetDisabled(false)
	Controls.JFDFaithGift2:SetDisabled(false)
	Controls.JFDFaithGift3:SetDisabled(false)
	
	local largeInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, faithGiftLarge)
	local largeGiftText	 = Locale.ConvertTextKey("TXT_KEY_JFD_FAITH_GIFT_LARGE", faithGiftLarge, largeInfluenceReward)
	local mediumInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, faithGiftMedium)
	local mediumGiftText = Locale.ConvertTextKey("TXT_KEY_JFD_FAITH_GIFT_MEDIUM", faithGiftMedium, mediumInfluenceReward)
	local smallInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, faithGiftSmall)
	local smallGiftText  = Locale.ConvertTextKey("TXT_KEY_JFD_FAITH_GIFT_SMALL", faithGiftSmall, smallInfluenceReward)
	
	local playerFaith = activePlayer:GetFaith()
	if playerFaith < faithGiftSmall then
		smallGiftText = "[COLOR_WARNING_TEXT]" .. smallGiftText .. "[ENDCOLOR]"
		Controls.JFDFaithGift1:SetDisabled(true)
		Controls.JFDFaithGift1Anim:SetHide(true)
	else	
		Controls.JFDFaithGift1Anim:SetHide(false)
	end
	Controls.JFDFaithGift1:SetText(smallGiftText)
	JFD_SetButtonSize(Controls.JFDFaithGift1, Controls.JFDFaithGift1Button, Controls.JFDFaithGift1Anim, Controls.JFDFaithGift1ButtonHL)
	
	if playerFaith < faithGiftMedium then
		mediumGiftText = "[COLOR_WARNING_TEXT]" .. mediumGiftText .. "[ENDCOLOR]"
		Controls.JFDFaithGift2:SetDisabled(true)
		Controls.JFDFaithGift2Anim:SetHide(true)
	else	
		Controls.JFDFaithGift2Anim:SetHide(false)
	end
	Controls.JFDFaithGift2:SetText(mediumGiftText)
	JFD_SetButtonSize(Controls.JFDFaithGift2, Controls.JFDFaithGift2Button, Controls.JFDFaithGift2Anim, Controls.JFDFaithGift2ButtonHL)
	
	if playerFaith < faithGiftLarge then
		largeGiftText = "[COLOR_WARNING_TEXT]" .. largeGiftText .. "[ENDCOLOR]"
		Controls.JFDFaithGift3:SetDisabled(true)
		Controls.JFDFaithGift3Anim:SetHide(true)
	else	
		Controls.JFDFaithGift3Anim:SetHide(false)
	end
	Controls.JFDFaithGift3:SetText(largeGiftText)
	JFD_SetButtonSize(Controls.JFDFaithGift3, Controls.JFDFaithGift3Button, Controls.JFDFaithGift3Anim, Controls.JFDFaithGift3ButtonHL)
		
	local currentFriendship = player:GetMinorCivFriendshipWithMajor(activePlayerID)
	local faithGiftTT = Locale.ConvertTextKey("TXT_KEY_JFD_FAITH_GIFT_STATUS_TT", friendsAmount, alliesAmount, currentFriendship) .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_FAITH_GIFT_TT")
	Controls.JFDFaithGift1:LocalizeAndSetToolTip(faithGiftTT)
	Controls.JFDFaithGift2:LocalizeAndSetToolTip(faithGiftTT)
	Controls.JFDFaithGift3:LocalizeAndSetToolTip(faithGiftTT)
end
--==========================================================================================================================
--==========================================================================================================================