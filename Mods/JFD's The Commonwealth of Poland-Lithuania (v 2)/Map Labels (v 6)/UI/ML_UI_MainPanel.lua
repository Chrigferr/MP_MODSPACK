--[[
*****************************************
*			Map Labels					*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************

ML_Labels:	Creates and displays labels on map

]]--
print(":::MAPLABELS::: ML_UI_MainPanel loaded")

--variables
PopupAppearance_Type = "PLAYER"
bExpanded = false
sCultureType = "NEARESTCIV"
sCultureName = "EAST_ASIA"

--tables
tLabelListSorted = { }

--measurements
iGrid_X = 300
iGrid_MaxSize = 500 --will be generated dynamically in PopupInit()
iGrid_MinSize = 165 --static
iGrid_OffsetTop = 185
iGrid_OffsetBottom = 226
iGrid_InnerOffsetTopOptions = 237
iGrid_InnerOffsetTopMain = 276
iGrid_InnerMarginBottom = 10
_,screenY=UIManager:GetScreenSizeVal()
iGrid_DLGOffset = -(screenY-250)

--helper functions
function ResetGrid()
	for i=0,3,1 do --weird, but doesn't look right until do it the 3rd time
		Controls.Popup_Grid:ReprocessAnchoring()
	end
end

function ResetMainScroll()
	dprintV("ResetMainScroll()")
	for i=1,2,1 do -- for some reason this only works if executed twice??
		Controls.LabelListScroll:CalculateInternalSize()
		Controls.LabelListScroll:ReprocessAnchoring()
--		Controls.LabelListScrollSlider:ReprocessAnchoring()
--		Controls.LabelListScrollUp:ReprocessAnchoring()
--		Controls.LabelListScrollDown:ReprocessAnchoring()
	end
end


--label list functions
function OnListItemClick(i)
	dprintV("OnListItemClick()")
	local pPlot = Map.GetPlot(tLabelListSorted[i].PlotX, tLabelListSorted[i].PlotY)
	UI.LookAt(pPlot,0)
end


function PopulateLabelList()
	dprintV("PopulateLabelList()")
	local i = Controls.MainPullDown:GetButton():GetVoid1()

	tLabelListSorted = { } --reset table
	tLabelListSorted = CopyTable(g.Labels,ONE_TO_MANY)
	for j,row in pairs(tLabelListSorted) do
		row.Icon = GetIcon(j)
		row.iLabel = j
	end
	table.sort(tLabelListSorted,SortByName)

	Controls.LabelListStack:DestroyAllChildren()

	for j,row in pairs(tLabelListSorted) do
		local instance = { }
		if (LABELLISTPULLDOWN[i].Type == "ALL" or LABELLISTPULLDOWN[i].Type == row.MainType) then
			if IsLabelVisible(row,true) then
				local sName = row.Icon.." "..Locale.ConvertTextKey(row.Name)
				ContextPtr:BuildInstanceForControl("LabelListInstance", instance, Controls.LabelListStack)
				instance.LabelListItemLabel:SetText(sName)
				instance.LabelListItemButton:SetVoid1(j)
				instance.LabelListItemButton:RegisterCallback( Mouse.eLClick, OnListItemClick )
				instance.LabelListEditButton:SetVoid1(row.iLabel)
				instance.LabelListEditButton:RegisterCallback( Mouse.eLClick, EditModeLabelClick )
				instance.LabelListDeleteButton:SetVoid1(row.iLabel)
				instance.LabelListDeleteButton:RegisterCallback( Mouse.eLClick, DeleteModeLabelClick )
			end
		end
	end
	Controls.LabelListStack:CalculateSize()
	Controls.LabelListStack:ReprocessAnchoring()
end

function OnMainPullDownSelected(i)
	dprintV("OnMainPullDownSelected()")
	Controls.MainPullDown:GetButton():SetText(LABELLISTPULLDOWN[i].StringWithIcon)
	Controls.MainPullDown:GetButton():SetVoid1(i)
	PopulateLabelList()
	ResetMainScroll()
end

function PopulateLabelListPullDown()
	for i,row in pairs(LABELLISTPULLDOWN) do
		local entry = {}
		Controls.MainPullDown:BuildEntry("MainPullDownEntry", entry)
		entry.Button:SetVoid1(i)
		entry.Button:SetText(row.StringWithIcon)
	end
	Controls.MainPullDown:GetButton():SetText(LABELLISTPULLDOWN[1].StringWithIcon)
	Controls.MainPullDown:GetButton():SetVoid1(1)
	Controls.MainPullDown:CalculateInternals()
	Controls.MainPullDown:RegisterSelectionCallback(OnMainPullDownSelected)
end


--hide/show functions
function ShowOptions(bShow)
	dprintV("ShowOptions()")
	if (bShow==true or bShow==1) then
		ShowMain(false)
		Controls.OptionsVStack:ChangeParent(Controls.PopupVStack)
		HideOptionsContent()
		Controls.OptionsPullDown:GetButton():SetText(OPTIONSPANELS[1].String)
		ShowOptionsDisplay(true)
		for i=0,3,1 do
			Controls.Popup_Grid:ReprocessAnchoring()
		end
	else --hide options panel
		Controls.OptionsVStack:ChangeParent(Controls.PopupContentContainer)
	end
end
Controls.Options_Button:RegisterCallback(Mouse.eLClick, ShowOptions)

function MMOpenOptionsClick()
	ShowPopup()
	bExpanded = false
	SetPopupExpanded()
	ShowOptions(true)
end

function ShowMain(bShow)
	dprintV("ShowMain()")
	if (bShow==true or bShow==1) then
		ShowOptions(false)
		Controls.MainVStack:ChangeParent(Controls.PopupVStack)
		OnMainPullDownSelected(1)
	else --hide main panel
		Controls.MainVStack:ChangeParent(Controls.PopupContentContainer)
	end
end
Controls.BackButton:RegisterCallback(Mouse.eLClick, ShowMain)


function SetPopupExpanded()
	dprintV("SetPopupExpanded()")
	if (bExpanded == false) then --if popup compact, make expanded & show main panel
		dprintV("bExpanded == false")
		Controls.Popup_Grid:SetSizeY(iGrid_MaxSize)
		dprintV("Setting grid size: "..iGrid_MaxSize)
		Controls.More_Button:SetText(MOREICONMINUS)
		dprintV("Setting icon to +")
		Controls.Bar_Top:SetHide(false)
		dprintV("Showing top bar")
		ShowMain(true)
		bExpanded = true
		for i=0,3,1 do --weird, but doesn't look right until do it the 3rd time
			Controls.Popup_Grid:ReprocessAnchoring()
		end
	else -- if popup expanded, make compact
		dprintV("bExpanded == true")
		Controls.Popup_Grid:SetSizeY(iGrid_MinSize)
		dprintV("Setting grid size: "..iGrid_MinSize)
		Controls.More_Button:SetText(MOREICONPLUS)
		dprintV("Setting icon to -")
		Controls.Bar_Top:SetHide(true)
		dprintV("Hiding top bar")
		ShowOptions(false)
		ShowMain(false)
		bExpanded = false
		for i=0,3,1 do
			Controls.Popup_Grid:ReprocessAnchoring()
		end
	end
end
Controls.More_Button:RegisterCallback(Mouse.eLClick,SetPopupExpanded)

function ShowPopup()
	dprintV("ShowPopup()")
--[[	if bExpanded == true then
		bExpanded = false
	else
		bExpanded = true
	end
	SetPopupExpanded() --]]
	Controls.Popup_Grid:SetHide(false)
end

function HidePopup()
	dprintV("HidePopup()")
		Controls.Popup_Grid:SetHide(true)
end
Controls.Close_Button:RegisterCallback(Mouse.eLClick, HidePopup)


--init
function InitMainPanel()
	dprint("InitMainPanel()")
	LABELLISTPULLDOWN = {}
	LABELLISTPULLDOWN[1] = {Type="ALL", String=Locale.ConvertTextKey("TXT_KEY_ML_POPUP_ALL_LABELS"), StringWithIcon=Locale.ConvertTextKey("TXT_KEY_ML_POPUP_ALL_LABELS")}
	for _,row in pairs(g.MainTypes) do
		table.insert(LABELLISTPULLDOWN,row)
	end
	PopulateLabelListPullDown()

	
	iGrid_MaxSize = screenY-(iGrid_OffsetTop+iGrid_OffsetBottom)
	iMainScroll_MaxSize = iGrid_MaxSize - (iGrid_InnerOffsetTopMain + iGrid_InnerMarginBottom)
	Controls.MainScrollGrid:SetSizeY(iMainScroll_MaxSize)
	Controls.LabelListScroll:SetSizeY(iMainScroll_MaxSize-18)

	bExpanded = true
	SetPopupExpanded()
end

