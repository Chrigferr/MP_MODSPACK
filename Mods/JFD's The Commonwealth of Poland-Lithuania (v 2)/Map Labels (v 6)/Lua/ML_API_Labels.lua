--[[
*****************************************
*			Map Labels					*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************

ML_Labels:	Creates and displays labels on map

]]--


print(":::MAPLABELS::: ML_API_Labels loaded")

--globals
g_LabelManager = InstanceManager:new("MapLabel", "Anchor", Controls.aaLabelContainer)

--tables
tLabelInstances = { }
	--[[ tLabelInstances[i from g.Labels[i] = single label control instance ]]

--variables
g.var.ShowLabels = true

--helper functions
function IsLabelVisible(MapLabel, bShowDisabled)
	dprintV("IsLabelVisible()")
	local bVisible = true
	local pPlot = Map.GetPlot(MapLabel.PlotX,MapLabel.PlotY)

	if (pPlot == nil) then
		dprintV("pPlot is nil, cancelling IsLabelVisible()",ERROR)
		return false
	end
	
	if (g.Options.DrawLabelsInFog == 0 and not pPlot:IsRevealed(HUMANTEAMID)) then
		dprintV("MapLabel is in fog, cancelling")
		return false
	end

	if (bShowDisabled ~= true) then
		if (g.MainTypes(MapLabel.MainType).DisplayType==LABELDISPLAY_DISABLED) then
			dprintV("Label type is disabled: "..MapLabel.MainType)
			return false
		end
	end

	return bVisible
end

function LabelAtPlot(x,y,bReturnAll)
	dprintV("LabelAtPlot()")
	for i,row in pairs(g.Labels) do
		if (row.PlotX == x and row.PlotY == y) then
			if bReturnAll then
				return true, row, i
			else
				return true
			end
		end
	end
	return false
end

function GetLabelText(MapLabel)
	dprintV("GetLabelText()")
	local sText = Locale.ConvertTextKey(MapLabel.Name)
	local sIcon = GetIcon(MapLabel)

	--how to display label
	local sDisplay = g.MainTypes(MapLabel.MainType).DisplayType
	if (sDisplay==LABELDISPLAY_ICONONLY) then
		return sIcon
	elseif (sDisplay==LABELDISPLAY_TEXTONLY) then
		return sText
	else --LABELDISPLAY_TEXTANDICON is default
		if (sIcon) then return (sIcon.." "..sText)
		else return sText
		end
	end
end

function GetLabelToolTip(MapLabel)
	dprintV("GetLabelToolTip()")
	if (g.MainTypes(MapLabel.MainType).DisplayType==LABELDISPLAY_ICONONLY) then
		if (MapLabel.ToolTip) then
			return (MapLabel.Name.."[NEWLINE]"..MapLabel.ToolTip)
		else
			return MapLabel.Name
		end
	else
		if (MapLabel.ToolTip) then
			return MapLabel.ToolTip
		else
			return nil
		end
	end
end


--draw functions
function ShowLabelButton(instance,i,w,h)
	dprintV("ShowLabelButton()")
	local M = GetMode().M

	instance.MapLabelMouseOverBox:SetColor(M.t_Color)
	instance.LabelAnim:SetSizeVal(w,h)
	instance.MapLabelMouseOverBox:SetSizeVal(w,h)

	instance.MapLabelButton:SetSizeVal(w,h)
	instance.MapLabelButton:SetConsumeMouseButton(1)
	instance.MapLabelButton:SetConsumeMouseOver(1)
	instance.MapLabelButton:SetVoid1(i)
	instance.MapLabelButton:RegisterCallback(Mouse.eLClick, M.f_Click)
end

--hiding buttons and labels individually requires more code but prevents have to call
--RedrawLabels() which can take a long time if there are 50+ labels on map
function HideLabelButton(instance) 
	dprintV("HideLabelButton()")
	instance.MapLabelMouseOverBox:SetHide(true)
	instance.MapLabelButton:SetConsumeMouseButton(0)
	instance.MapLabelButton:SetConsumeMouseOver(0)
	instance.MapLabelButton:RegisterCallback(Mouse.eLClick, function() dprintV("Label is hidden");end)
end

function HideLabel(i)
	dprintV("HideLabel()")
	tLabelInstances[i].MapLabelButton:SetHide(1)
end

function RedrawLabel(i)
	dprintV("RedrawLabel()")
	HideLabel(i)
	DrawLabel(i)
end

function DrawLabel(i)    
	dprintV({"DrawLabel():",i})

	local MapLabel = g.Labels[i]
	local world = GetWorldPos(MapLabel.PlotX,MapLabel.PlotY)
	local MainType = g.MainTypes(MapLabel.MainType)
	
	local instance = g_LabelManager:GetInstance()
	if (not instance) then dprint("Instance is nil, cancelling",ERROR); return; end
	dprintV({"Adding "..MapLabel.MainType.." ("..(MapLabel.SubType or nil)..") label at: ",MapLabel.PlotX,MapLabel.PlotY})

	instance.Anchor:SetWorldPosition(VecAdd(world, vOffset))

	--get colors
	local vColorFont = MapLabel.FontColor or GetColor(MainType,"Font")
	local vColorShadow = MapLabel.ShadowColor or GetColor(MainType,"Shadow")
	local vColorBackground = MapLabel.BackgroundColor or GetColor(MainType,"Background")
	local vColorBorder = MapLabel.BorderColor or GetColor(MainType,"Border")

	--set label properties
	local sStyle = CorrectStyle((MainType.FontStyle or "Base"),MainType.Font)
	local sMapLabelName = ("MapLabelName"..sStyle)
	local sName = GetLabelText(MapLabel)
	instance[sMapLabelName]:SetText(sName)
	instance[sMapLabelName]:SetFontByName(MainType.Font)
	instance[sMapLabelName]:SetColor(vColorFont,0)
	instance[sMapLabelName]:SetColor(vColorShadow,1)

	--set box properties
	local iBoxWidth, iBoxHeight = GetBoxSize(instance[sMapLabelName])
	instance.MapLabelBox:SetSizeX(iBoxWidth)
	instance.MapLabelBox:SetSizeY(iBoxHeight)
	instance.MapLabelBox:SetColor(vColorBackground)
	local sMapLabelToolTip = GetLabelToolTip(MapLabel)
	if (sMapLabelToolTip) then
		instance.MapLabelBox:SetToolTipString(GetLabelToolTip(MapLabel))
	end

	--set box border properties
	instance.MapLabelBoxBorder:SetSizeX(iBoxWidth + (g.Options.BoxBorderWidth * 2))
	instance.MapLabelBoxBorder:SetSizeY(iBoxHeight + (g.Options.BoxBorderWidth * 2))
	instance.MapLabelBoxBorder:SetColor(vColorBorder)

	--In Edit/Move/Delete Modes, enable MapLabelButton
	if (GetMode() and (GetMode().i == DELETE or GetMode().i == MOVE or GetMode().i == EDIT)) then
		ShowLabelButton(instance, i, iBoxWidth, iBoxHeight)
	end

	tLabelInstances[i] = instance

	dprintV("Label "..i.." "..MapLabel.Name.." added to map")
	dprintV();dprintV()
end

function DrawAllLabels()
	dprint("DrawAllLabels()")	
	for i, _ in pairs(g.Labels) do
		if (IsLabelVisible(g.Labels[i])) then
			DrawLabel(i)
		end
	end
end


function RedrawLabels()
	dprint("RedrawLabels()")
	MouseBusy()
	tLabelInstances = { }
	Controls.aaLabelContainer:DestroyAllChildren()
	if (g.var.ShowLabels) then
		DrawAllLabels()
	end
	MouseNormal()
end


--init
function InitLabels()
	--insert init commands here
end
