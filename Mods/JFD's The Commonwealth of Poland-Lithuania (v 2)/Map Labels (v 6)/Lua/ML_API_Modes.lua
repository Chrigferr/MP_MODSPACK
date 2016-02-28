--[[
*****************************************
*			Map Labels					*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************
]]--
print(":::MAPLABELS::: ML_API_Modes loaded")


--variables
iMoveLabel = -1


--tables
MODES = { } --definitions in InitModes() as reference functions below


--helper functions
function GetMode(f) --if a mode is active, then executes function or return i,M; if no mode active, returns false
	--dprintV("GetMode()")
	for iMode,M in pairs(MODES) do
		if M.b == true then
			dprintV("Mode: "..iMode)
			if (f) then
				f(iMode,M)
				return
			else
				return {i=iMode,M=M}
			end
		end
	end
	return false
end


--Add/Edit Panel
function AddSaveClicked(iLabel)
	dprint("AddSaveClicked()",iLabel)

	local Label = { } 
	local bAdd = true

	if (iLabel ~= -1) then 
		dprint("Edit Label")
		bAdd = false
		Label = g.Labels[iLabel] -- Edit current label
	end

	Label.Name = Controls.AddName_EditBox:GetText()

	if (string.len(Controls.AddTT_EditBox:GetText()) > 0) then --tt
		Label.ToolTip = Controls.AddTT_EditBox:GetText()
	end

	iMainType = Controls.AddMainTypePullDown:GetButton():GetVoid1()
	iSubType = Controls.AddSubTypePullDown:GetButton():GetVoid1()
	Label.MainType = g.MainTypes[iMainType].Type --MainType
	Label.SubType = g.SubTypes[iSubType].Type -- SubType

	sIcon = Controls.AddIconButtonLabel:GetText()
	if sIcon == g.SubTypes[iSubType].Icon then -- Icon
		Label.Icon = nil
	else
		Label.Icon = sIcon
	end

	if bAdd then
		Label.PlotX = MODES[ADD].PlotX
		Label.PlotY = MODES[ADD].PlotY
		table.insert(g.Labels,Label)
		DrawLabel(#g.Labels)
	else
		RedrawLabel(iLabel)
	end

	PopulateLabelList()
	HideAddEdit()
end
Controls.AddSaveButton:RegisterCallback(Mouse.eLClick, AddSaveClicked)


function AddSubTypePullDownSelected(iSubType)
	dprint("AddSubTypePullDownSelected()",iSubType)
	local sIcon = g.SubTypes[iSubType].Icon
	Controls.AddIconButton:SetVoid1(GetIconNum(sIcon))
	Controls.AddIconButtonLabel:SetText(sIcon)

	Controls.AddSubTypePullDown:GetButton():SetText(g.SubTypes[iSubType].StringWithIcon)
	Controls.AddSubTypePullDown:GetButton():SetVoid1(iSubType)
end

function PopulateAddSubTypePullDown(iMainType)
	dprint("PopulateAddSubTypePullDown()",iMainType)
	local iFirstOption = nil
	local sMainType = g.MainTypes[iMainType].Type
	
	--as this function is what AddMainTypePullDown calls when selection changes, need to update its button first
	Controls.AddMainTypePullDown:GetButton():SetText(g.MainTypes[iMainType].StringWithIcon)
	Controls.AddMainTypePullDown:GetButton():SetVoid1(iMainType)

	Controls.AddSubTypePullDownStack:DestroyAllChildren()
	for iSubType,strow in pairs(g.SubTypes) do
		if strow.MainType==sMainType then
			iFirstOption = iFirstOption or iSubType
			local entry = {}
			Controls.AddSubTypePullDown:BuildEntry("AddSubTypePullDownEntry", entry)
			entry.Button:SetVoid1(iSubType)
			entry.Button:SetText(strow.StringWithIcon)
			dprintV({"AddSubTypePullDown, added: "..iSubType,strow.String})
		end
	end
	Controls.AddSubTypePullDown:CalculateInternals()
	Controls.AddSubTypePullDown:RegisterSelectionCallback(AddSubTypePullDownSelected)
	AddSubTypePullDownSelected(iFirstOption)

	if g.MainTypes[iMainType].Type == "PLAYER" then
		Controls.AddSubTypePullDown:SetHide(true)
		Controls.AddIconStack:SetHide(false)
	else
		Controls.AddSubTypePullDown:SetHide(false)
		Controls.AddIconStack:SetHide(true)
	end
end

function ShowAddEdit(iMode, iLabel)
	dprint("ShowAddEdit()",iMode,iLabel)
	local sTitle
	local sIcon

	if (iLabel) then
		Controls.AddSaveButton:SetVoid1(iLabel)
	else
		Controls.AddSaveButton:SetVoid1(-1)
	end

	Controls.AddIconButton:SetVoid2(ADD) 
	Controls.AddIconButton:RegisterCallback(Mouse.eLClick, ShowIconPanel)

	Controls.AddNameInvalid:SetHide(true)


	Controls.AddMainTypePullDownStack:DestroyAllChildren()
	--populate maintype pulldown
	for iMainType,mtrow in pairs(g.MainTypes) do
		local entry = {}
		Controls.AddMainTypePullDown:BuildEntry("AddMainTypePullDownEntry", entry)
		entry.Button:SetVoid1(iMainType)
		entry.Button:SetText(mtrow.StringWithIcon)
	end
	Controls.AddMainTypePullDown:GetButton():SetText(g.MainTypes[1].StringWithIcon)
	Controls.AddMainTypePullDown:GetButton():SetVoid1(1)
	Controls.AddMainTypePullDown:CalculateInternals()
	Controls.AddMainTypePullDown:RegisterSelectionCallback(PopulateAddSubTypePullDown)

	if iMode == ADD then
		Controls.AddName_EditBox:SetText(nil)
		Controls.AddTT_EditBox:SetText(nil)
		Controls.AddEditTitle:LocalizeAndSetText("TXT_KEY_ML_TITLE_ADD")
		PopulateAddSubTypePullDown(Controls.AddMainTypePullDown:GetButton():GetVoid1())
	elseif iMode== EDIT then --fill in boxes with current settings 
		Controls.AddEditTitle:LocalizeAndSetText("TXT_KEY_ML_TITLE_EDIT")
		Controls.AddName_EditBox:SetText(g.Labels[iLabel].Name) --set Name
		Controls.AddTT_EditBox:SetText(g.Labels[iLabel].ToolTip) --set TT

		for iMainType,mtrow in pairs(g.MainTypes) do --set MainType PullDown
			if mtrow.Type == g.Labels[iLabel].MainType then 
				Controls.AddMainTypePullDown:GetButton():SetText(mtrow.StringWithIcon)
				Controls.AddMainTypePullDown:GetButton():SetVoid1(iMainType)
				PopulateAddSubTypePullDown(iMainType)
			end
		end
		

		for iSubType,strow in pairs(g.SubTypes) do --set SubType PullDown
			if strow.Type == g.Labels[iLabel].SubType then 
				Controls.AddSubTypePullDown:GetButton():SetText(strow.StringWithIcon)
				Controls.AddSubTypePullDown:GetButton():SetVoid1(iSubType)
			end
		end

		sIcon = GetIcon(iLabel)
		Controls.AddIconButtonLabel:SetText(sIcon)
		Controls.AddIconButton:SetVoid1(GetIconNum(sIcon))
	end


	Controls.AddEditContainer:SetHide(false)
end

function HideAddEdit()
	Controls.AddEditContainer:SetHide(true)
end
Controls.AddCancelButton:RegisterCallback(Mouse.eLClick, HideAddEdit)


--mode functions
--add mode
function AddModeClick()
	dprint("AddModeClick()",UI.GetMouseOverHex())
	ExitMode(ADD)
	MODES[ADD].PlotX, MODES[ADD].PlotY = UI.GetMouseOverHex()
	ShowAddEdit(ADD)
end

--quickadd mode
function QuickAddIconChosen(iIcon,_)
	dprint("QuickAddIconChosen()")
	MouseBusy()
	HideIconPanel()
	InsertRecentIcon(iIcon)
	local Label = { }
	Label.MainType = "PLAYER"
	Label.SubType = "PLAYER"
	Label.Name = ""
	Label.Icon = ICONS_TABLE[iIcon]
	Label.PlotX = MODES[QUICKADD].PlotX
	Label.PlotY = MODES[QUICKADD].PlotY
	table.insert(g.Labels,Label)
	DrawLabel(#g.Labels)
	PopulateLabelList()
	MouseNormal()
end

function QuickAddModeClick()
	dprint("QuickAddModeClick()",UI.GetMouseOverHex())
	ExitMode(QUICKADD)
	MODES[QUICKADD].PlotX, MODES[QUICKADD].PlotY = UI.GetMouseOverHex()
	ShowIconPanel(-1,QUICKADD)
end

--edit mode
function EditModeLabelClick(i)
	dprint("EditModeLabelClick()")
	ExitMode(EDIT)
	ShowAddEdit(EDIT,i)
end

--move mode
function MoveModeMapClick()
	dprint("MoveModeMapClick()")
	i=MODES[MOVETWO].iLabel
	g.Labels[i].PlotX, g.Labels[i].PlotY = UI.GetMouseOverHex()
	ExitMode(MOVETWO)
	Events.ClearHexHighlights()
	PopulateLabelList()
end

function MoveModeLabelClick(i)
	dprint("MoveModeLabelClick()")
	MODES[MOVETWO].iLabel = i
	iMoveLabel = i
	ExitMode(MOVE)
	EnterMode(MOVETWO)
end

--delete mode
function DeleteModeContinue(iLabel)
	HideMessage()
	g.Labels[iLabel] = nil
	HideLabel(iLabel)
		PopulateLabelList()
--	RedrawLabels()
end

function DeleteModeLabelClick(iLabel)
	dprint("DeleteModeLabelClick()")
	ShowMessage(DELETE, iLabel)
	ExitMode(DELETE)
end


--enter/exit modes
function EnterMode(iMode)
	dprint("EnterMode() Entering mode: "..iMode)
	for i,row in pairs(MODES) do --disable any other active mode
		if row.b == true then
			ExitMode(i)
		end
	end 
	local M = MODES[iMode]
	M.b = true
	M.f_Cursor()
	if iMode ~= ADD and iMode ~= QUICKADD then
--		for i,row in pairs(g.Labels) do --DOESN"T WORK AFTER LABEL ADDED/EDITED, UNTIL REDRAW
--			ShowLabelButton(tLabelInstances[i], i, tLabelInstances[i].MapLabelBox:GetSizeX(), tLabelInstances[i].MapLabelBox:GetSizeY())
--		end
		RedrawLabels()
	else
		OnMouseOverHex(UI.GetMouseOverHex())
	end



	local sTitle = Locale.ConvertTextKey("TXT_KEY_ML_MODE_"..M.String)
	local sInstruct = Locale.ConvertTextKey("TXT_KEY_ML_MODE_INSTRUCTIONS_"..M.String)
	local sCancel = Locale.ConvertTextKey("TXT_KEY_ML_MODE_INSTRUCTIONS_CANCEL")
	Controls.ModeInstructionsHeader:SetText(sTitle)
	Controls.ModeInstructionsText:SetText(sInstruct)
	Controls.ModeInstructionsCancel:SetText(sCancel)
	Controls.ModeInstructionsStack:ReprocessAnchoring()
	Controls.ModeInstructions:SetHide(false)
end

function ExitMode(iMode)
	dprint("ExitMode() Exiting mode: "..iMode)
	local M = MODES[iMode]
	M.b = false
	Controls.ModeInstructions:SetHide(true)
	Events.ClearHexHighlights()
	for i,control in pairs(tLabelInstances) do
		HideLabelButton(control)
	end

	if iMode==MOVETWO then --reset label position
		local i=MODES[MOVETWO].iLabel	
		local world = GetWorldPos(g.Labels[i].PlotX,g.Labels[i].PlotY)
		tLabelInstances[i].Anchor:SetWorldPosition(VecAdd(world, vOffset))
	end
	MouseNormal()
end


--initmodes
function InitModes()
	MODES[ADD] = {b=false, bDisabled=false, f_Cursor=MouseNormal, f_Click=AddModeClick, vColor = Vector4(0,1,0,1), PlotX = 0, PlotY = 0, String="ADD" }
	MODES[QUICKADD] = {b=false, bDisabled=false, f_Cursor=MouseNormal, f_Click=QuickAddModeClick, vColor = Vector4(0,1,0,1), PlotX = 0, PlotY = 0, String="ADD" }
	MODES[EDIT] = {b=false, f_Cursor=MouseNormal, f_Click=EditModeLabelClick, t_Color={x=1,y=1,z=0,w=1}, String="EDIT" }
	MODES[MOVE] = {b=false, f_Cursor=MouseNormal, f_Click=MoveModeLabelClick, t_Color={x=1,y=0.5,z=0,w=1}, String="MOVE" }
	MODES[DELETE] = {b=false, f_Cursor=MouseNormal, f_Click=DeleteModeLabelClick, t_Color={x=1,y=0,z=0,w=1}, String="DELETE"}
	MODES[MOVETWO] = {b=false, bDisabled=false, f_Cursor=MouseNormal, f_Click=MoveModeMapClick, vColor = Vector4(1,0.5,0,1), iLabel = 0, String="MOVETWO"}

	Controls.Add_Button:SetVoid1(ADD)
	Controls.Add_Button:RegisterCallback(Mouse.eLClick, EnterMode)
	Controls.Edit_Button:SetVoid1(EDIT)
	Controls.Edit_Button:RegisterCallback(Mouse.eLClick, EnterMode)
	Controls.Move_Button:SetVoid1(MOVE)
	Controls.Move_Button:RegisterCallback(Mouse.eLClick, EnterMode)
	Controls.Delete_Button:SetVoid1(DELETE)
	Controls.Delete_Button:RegisterCallback(Mouse.eLClick, EnterMode)
end