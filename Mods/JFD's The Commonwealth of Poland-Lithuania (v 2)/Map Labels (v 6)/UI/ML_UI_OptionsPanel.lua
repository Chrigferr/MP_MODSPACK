--[[
*****************************************
*			Map Labels					*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************

ML_Labels:	Creates and displays labels on map

]]--
print(":::MAPLABELS::: ML_UI_OptionsPanel loaded")

--tables
OPTIONSPANELS = { } --populated in InitOptionsPanel() as references functions below
COLOROPTIONS = { }
COLORS={ }

tColorSliderInstances = { }
tDisplayPullDownInstances = { }
tIconSubTypesInstances = { }

--measurements
iOptionsScroll_MaxSize = 500 --also generated dynamically
iOptionsScroll_SliderOffset = 40
iOptionsScroll_DownOffset = -12

--helper functions
function ResetOptionsScroll()
	dprintV("ResetOptionsScroll()")
	for i=1,2,1 do -- for some reason this only works if executed twice??
		Controls.OptionsScroll:CalculateInternalSize()
		Controls.OptionsScroll:ReprocessAnchoring()
--		Controls.OptionsScrollSlider:ReprocessAnchoring()
--		Controls.OptionsScrollUp:ReprocessAnchoring()
--		Controls.OptionsScrollDown:ReprocessAnchoring()
	end
--	iRatio = Controls.OptionsScroll:GetRatio() --down button does not like scroll resize!
--	iSizeY = Controls.OptionsScroll:GetSizeY()
--	iDownOffset = iSizeY/iRatio + iSizeY --calculated this, doesn't work
--	Controls.OptionsScrollDown:SetOffsetY(iDownOffset)
end


--other panel
function RestoreDefaultsContinue()
	dprint("RestoreDefaultsContinue()")
	HideMessage()
	InitTables()
	InitOptionsPanel()
	Init_UI_DLG()
	RedrawLabels()
	dprint("--Default values restored--")
end

function OnRestoreDefaultsClick()
	dprint("OnRestoreDefaultsClick()")
	ShowMessage(DEFAULTS)
end
Controls.Other_RestoreDefaults:RegisterCallback(Mouse.eLClick, OnRestoreDefaultsClick)

--dynamic panel
function OptionsPanel_OpenDLGButtonClick()
	ShowDLGStart()
end
Controls.OptionsPanel_OpenDLGButton:RegisterCallback(Mouse.eLClick, OptionsPanel_OpenDLGButtonClick)


--battle panel
function OnBattleEditBox(_,c)
	if c==Controls.BattleMinUnitsEditBox then
		SetNumOptionFromEditBox("BattleMinUnits",c)
	elseif c==Controls.BattleMaxSizeEditBox then
		SetNumOptionFromEditBox("BattleSpreadPlots",c)
	elseif c==Controls.BattleMaxYearsEditBox then
		SetNumOptionFromEditBox("BattleLengthYears",c)
	end
end

function OnCheckEnableBattle(bIsChecked)
	if bIsChecked then
		Controls.BattleEnabledStack:SetHide(false)
		g.Options.BattleEnabled = 1
	else
		Controls.BattleEnabledStack:SetHide(true)
		g.Options.BattleEnabled = 0
	end
end

function OnCheckEnableRazed(bIsChecked)
	if bIsChecked then
		g.Options.RazedEnabled = 1
	else
		g.Options.RazedEnabled = 0
	end
end

function PopulateBattlePanel()
	dprintV("PopulateBattlePanel()")
	if g.Options.BattleEnabled == 1 then
		Controls.BattleEnabledCheckBox:SetCheck(true)
	else
		Controls.BattleEnabledCheckBox:SetCheck(false)
	end
	Controls.BattleEnabledCheckBox:RegisterCheckHandler(OnCheckEnableBattle)
	
	if g.Options.RazedEnabled == 1 then
		Controls.RazedEnabledCheckBox:SetCheck(true)
	else
		Controls.RazedEnabledCheckBox:SetCheck(false)
	end
	Controls.RazedEnabledCheckBox:RegisterCheckHandler(OnCheckEnableRazed)

	Controls.BattleMinUnitsEditBox:SetText(g.Options.BattleMinUnits)
	Controls.BattleMinUnitsEditBox:RegisterCallback(OnBattleEditBox)

	Controls.BattleMaxSizeEditBox:SetText(g.Options.BattleSpreadPlots)
	Controls.BattleMaxSizeEditBox:RegisterCallback(OnBattleEditBox)

	Controls.BattleMaxYearsEditBox:SetText(g.Options.BattleLengthYears)
	Controls.BattleMaxYearsEditBox:RegisterCallback(OnBattleEditBox)
end


--icons panel
function ResetIconStrings()
	for i,row in pairs(g.SubTypes) do
		row.StringWithIcon = (row.Icon..row.String)
	end
end

function ChangeOptionPanelIcon(iIconID,iSubType) --this is called after selecting a new icon from icon popup
	InsertRecentIcon(iIconID)
	local sIcon = ICONS_TABLE[iIconID]

	g.SubTypes[iSubType].Icon = sIcon	
	tIconSubTypesInstances[iSubType].IconOptionsButtonLabel:SetText(sIcon)

	HideIconPanel()
	ResetIconStrings()
	RedrawLabels()
end

function PopulateIconsList()
	dprintV("PopulateIconsList()")
	tIconSubTypesInstances = { } --reset instances
	Controls.IconRegionsStack:DestroyAllChildren()
	Controls.IconPlayerStack:DestroyAllChildren()
	Controls.IconFeaturesStack:DestroyAllChildren()
	Controls.IconBattlesStack:DestroyAllChildren()

	for iSubType,strow in pairs (g.SubTypes) do
		local sIcon = strow.Icon

		local instance = { }
		if (strow.MainType == "REGION") then
			ContextPtr:BuildInstanceForControl("IconOptionsInstance", instance, Controls.IconRegionsStack)
		elseif (strow.MainType == "PLAYER") then
			ContextPtr:BuildInstanceForControl("IconOptionsInstance", instance, Controls.IconPlayerStack)
		elseif (strow.MainType == "FEATURE") then
			ContextPtr:BuildInstanceForControl("IconOptionsInstance", instance, Controls.IconFeaturesStack)
		elseif (strow.MainType == "BATTLE") then
			ContextPtr:BuildInstanceForControl("IconOptionsInstance", instance, Controls.IconBattlesStack)
		else
			dprint("PopulateIconsList: "..strow.MainType.." not in Icon Options Panel, adding SubType to OTHER list")
			Controls.Icon_Header_Other:SetHide(false)
			Controls.IconOtherStack:SetHide(false)
			ContextPtr:BuildInstanceForControl("IconOptionsInstance", instance, Controls.IconOtherStack)
		end	

		instance.IconOptionsButtonLabel:SetText(sIcon)
		instance.IconOptionsLabel:SetText(strow.String)
		instance.IconOptionsButton:SetVoid1(iSubType)
		instance.IconOptionsButton:SetVoid2(ICON)
		instance.IconOptionsButton:RegisterCallback(Mouse.eLClick, ShowIconPanel)

		tIconSubTypesInstances[iSubType] = instance

	end
end


--appearance panel

function OnColorSliderChanged(iValue,iColorOption,iColor)
	dprintV("OnColorSliderChanged()")
	local sSlider = COLORS[iColor].Name.."Slider"

	if (tColorSliderInstances[iColorOption][sSlider]:IsTrackingLeftMouseButton()) then return;end --wait until mouseup before updating
	
	local iMainType = Controls.AppearancePullDown:GetButton():GetVoid1()
	local iValue = Round(iValue,2)
	dprintV({"New value",iValue})

	g.MainTypes[iMainType][COLOROPTIONS[iColorOption].Name..COLORS[iColor].Suffix] = iValue
	RedrawLabels()
end

function OnTypeColorBoxClick(i)
	dprint("OnTypeColorBoxClick()")
	if (COLOROPTIONS[i].Open == true) then
		COLOROPTIONS[i].Open = false
	else
		COLOROPTIONS[i].Open = true
	end
	PopulateAppearancePanel()
	ResetOptionsScroll()
end

function OnStylePullDownSelected(i)
	dprintV("OnAStylePullDownSelected()")
	local iMainType = Controls.AppearancePullDown:GetButton():GetVoid1()
	g.MainTypes[iMainType].FontStyle = STYLETYPES[i].Type
	Controls.AStylePullDown:GetButton():SetText(STYLETYPES[i].String)
	RedrawLabels()
end

function OnFontPullDownSelected(i)
	dprintV("OnFontPullDownSelected()")
	local iMainType = Controls.AppearancePullDown:GetButton():GetVoid1()
	g.MainTypes[iMainType].Font = FONTTYPES[i].Type
	Controls.AFontPullDown:GetButton():SetText(FONTTYPES[i].String)
	RedrawLabels()
end

function PopulateAppearancePanel()
	dprintV("PopulateAppearancePanel()")

	local iMainType = Controls.AppearancePullDown:GetButton():GetVoid1()
	local mtrow = g.MainTypes[iMainType]

	--font pulldown
	Controls.AFontPullDownStack:DestroyAllChildren()
	for iFont,fontrow in pairs(FONTTYPES) do
		local entry = { }
		Controls.AFontPullDown:BuildEntry("AFontPullDownEntry", entry)
		entry.Button:SetVoid1(iFont)
		entry.Button:SetText(fontrow.String)
	end
	Controls.AFontPullDown:GetButton():SetText(FONTTYPES(mtrow.Font).String)
	Controls.AFontPullDown:CalculateInternals()
	Controls.AFontPullDown:RegisterSelectionCallback(OnFontPullDownSelected)
	
	--style pulldown
	Controls.AStylePullDownStack:DestroyAllChildren()
	for iStyle,stylerow in pairs(STYLETYPES) do
		local entry = { }
		Controls.AStylePullDown:BuildEntry("AStylePullDownEntry", entry)
		entry.Button:SetVoid1(iStyle)
		entry.Button:SetText(stylerow.String)
	end
	Controls.AStylePullDown:GetButton():SetText(STYLETYPES(mtrow.FontStyle).String)
	Controls.AStylePullDown:CalculateInternals()
	Controls.AStylePullDown:RegisterSelectionCallback(OnStylePullDownSelected)
	
	--colors
	Controls.LabelColorStack:DestroyAllChildren()
	tColorSliderInstances = { } --reset instances
	for iColorOption,corow in pairs(COLOROPTIONS) do
		local instance = { }
		ContextPtr:BuildInstanceForControl("LabelColorsInstance", instance, Controls.LabelColorStack)
		instance.TypeColorBoxLabel:SetText("[ICON_PLUS] "..(corow.String:upper()))
		instance.TypeColorBoxButton:SetVoid1(iColorOption)
		instance.TypeColorBoxButton:RegisterCallback( Mouse.eLClick, OnTypeColorBoxClick )
		if (corow.Open == true) then
			instance.TypeColorBoxLabel:SetText("[ICON_MINUS] "..(corow.String:upper()))
			instance.TypeColorControlsBox:SetHide(false)
			for iColor,COLOR in pairs(COLORS) do
				local sSlider = COLOR.Name.."Slider"
				instance[sSlider]:SetVoid1(iColorOption)
				instance[sSlider]:SetVoid2(iColor)
				instance[sSlider]:SetValue(mtrow[corow.Name..COLOR.Suffix])
				instance[sSlider]:RegisterSliderCallback(OnColorSliderChanged)
			end
		else
			instance.TypeColorControlsBox:SetHide(true)
		end
		instance.TypeColorControlsBox:CalculateSize()
		tColorSliderInstances[iColorOption] = instance
	end
	Controls.LabelColorStack:CalculateSize()
	Controls.LabelColorStack:ReprocessAnchoring()
end

function OnAppearancePullDownSelected(i)
	dprintV("OnAppearancePullDownSelected()")
	Controls.AppearancePullDown:GetButton():SetVoid1(i)
	Controls.AppearancePullDown:GetButton():SetText(g.MainTypes[i].StringWithIcon)
	--PopupAppearance_Type = g.MainTypes[i].Type
	PopulateAppearancePanel()
	ResetOptionsScroll()
end

function PopulateAppearancePullDown()
	dprintV("PopulateAppearancePullDown()")
	Controls.AppearancePullDownStack:DestroyAllChildren()
	for i,row in pairs(g.MainTypes) do
		local entry = {}
		Controls.AppearancePullDown:BuildEntry("AppearancePullDownEntry", entry)
		entry.Button:SetVoid1(i)
		entry.Button:SetText(row.StringWithIcon)
	end
	Controls.AppearancePullDown:GetButton():SetVoid1(1)
	Controls.AppearancePullDown:GetButton():SetText(g.MainTypes[1].StringWithIcon)
	Controls.AppearancePullDown:CalculateInternals()
	Controls.AppearancePullDown:RegisterSelectionCallback(OnAppearancePullDownSelected)
end


--display panel
function OnDisplayPullDownSelected(iMainType, iDisplayType)
	dprintV("OnDisplayPullDownSelected()")
	dprintV("MainType: "..iMainType.." DisplayType: "..iDisplayType)
	local displayrow = DISPLAYTYPES[iDisplayType]
	g.MainTypes[iMainType].DisplayType = displayrow.Type
	tDisplayPullDownInstances[iMainType].DisplayPullDown:GetButton():SetText(displayrow.String)
	RedrawLabels()
end

function PopulateDisplayPanel()
	dprintV("PopulateDisplayPanel()")
	Controls.LabelDisplayStack:DestroyAllChildren()
	tDisplayPullDownInstances = { }
	
	for iMainType,mtrow in pairs(g.MainTypes) do
		tDisplayPullDownInstances[iMainType] = { }
		local instance = { }
		ContextPtr:BuildInstanceForControl("LabelDisplayInstance", instance, Controls.LabelDisplayStack)
		instance.DisplayLabel:SetText(mtrow.StringWithIcon)
		instance.DisplayPullDown:SetHide(false)
		for iDisplayType,displayrow in pairs(DISPLAYTYPES) do
			local entry = {}
			instance.DisplayPullDown:BuildEntry("DisplayPullDownEntry", entry)
			entry.Button:SetVoid1(iMainType)
			entry.Button:SetVoid2(iDisplayType)
			entry.Button:SetText(displayrow.String)
		end
		instance.DisplayPullDown:GetButton():SetText(DISPLAYTYPES(mtrow.DisplayType).String)
		instance.DisplayPullDown:CalculateInternals()
		instance.DisplayPullDown:RegisterSelectionCallback(OnDisplayPullDownSelected)
		tDisplayPullDownInstances[iMainType] = instance
	end
	Controls.LabelDisplayStack:CalculateSize()
	Controls.LabelDisplayStack:ReprocessAnchoring()
end


--options panel header
function OnOptionsPullDownSelected(i)
	dprintV("OnOptionsPullDownSelected()")
	Controls.OptionsPullDown:GetButton():SetText(OPTIONSPANELS[i].String)
	OPTIONSPANELS[i].f_Show(true)
end

function PopulateOptionsPullDown()
	Controls.OptionsPullDownStack:DestroyAllChildren()
	for i,oprow in pairs(OPTIONSPANELS) do
		local entry = {}
		Controls.OptionsPullDown:BuildEntry("OptionsPullDownEntry", entry)
		entry.Button:SetVoid1(i)
		entry.Button:SetText(oprow.String)
	end
	Controls.OptionsPullDown:GetButton():SetText(OPTIONSPANELS[1].String)
	Controls.OptionsPullDown:CalculateInternals()
	Controls.OptionsPullDown:RegisterSelectionCallback(OnOptionsPullDownSelected)
end


--hide/show panels
function ShowOptionsDisplay(bShow)
	dprintV("ShowOptionsDisplay()")
	if (bShow==true) then
		HideOptionsContent()
		Controls.OptionsContent_Display:ChangeParent(Controls.OptionsScroll)
		ResetOptionsScroll()
	else
		Controls.OptionsContent_Display:ChangeParent(Controls.OptionsContentContainer)
	end
end

function ShowOptionsAppearance(bShow)
	dprintV("ShowOptionsAppearance()")
	if (bShow==true) then
		HideOptionsContent()
		Controls.OptionsContent_Appearance:ChangeParent(Controls.OptionsScroll)
		ResetOptionsScroll()
	else
		Controls.OptionsContent_Appearance:ChangeParent(Controls.OptionsContentContainer)
	end
end

function ShowOptionsIcons(bShow)
	dprintV("ShowOptionsBattle()")
	if (bShow==true) then
		HideOptionsContent()
		Controls.OptionsContent_Icons:ChangeParent(Controls.OptionsScroll)
		ResetOptionsScroll()
	else
		Controls.OptionsContent_Icons:ChangeParent(Controls.OptionsContentContainer)
	end
end


function ShowOptionsBattle(bShow)
	dprintV("ShowOptionsBattle()")
	if (bShow==true) then
		HideOptionsContent()
		Controls.OptionsContent_Battle:ChangeParent(Controls.OptionsScroll)
		ResetOptionsScroll()
	else
		Controls.OptionsContent_Battle:ChangeParent(Controls.OptionsContentContainer)
	end
end

function ShowOptionsDynamic(bShow)
	dprintV("ShowOptionsDynamic()")
	if (bShow==true) then
		HideOptionsContent()
		Controls.OptionsContentPanel_Dynamic:ChangeParent(Controls.OptionsScroll)
		if g.Options.MapType == "STATIC" then
			Controls.StaticLabel:SetHide(false)
			Controls.OptionsPanel_OpenDLGButton:SetHide(true)
		end
		ResetOptionsScroll()
	else
		Controls.OptionsContentPanel_Dynamic:ChangeParent(Controls.OptionsContentContainer)
	end
end

function ShowOptionsOther(bShow)
	dprintV("ShowOptionsOther()")
	if (bShow==true) then
		HideOptionsContent()
		Controls.OptionsContent_Other:ChangeParent(Controls.OptionsScroll)
		ResetOptionsScroll()
	else
		Controls.OptionsContent_Other:ChangeParent(Controls.OptionsContentContainer)
	end
end

function HideOptionsContent()
	dprintV("HideOptionsContent()")
	ShowOptionsDynamic(false)
	ShowOptionsBattle(false)
	ShowOptionsAppearance(false)
	ShowOptionsDisplay(false)
	ShowOptionsIcons(false)
	ShowOptionsOther(false)
end



--init
function InitOptionsPanel()
	dprint("InitOptionsPanel()")
	OPTIONSPANELS[1] = {String=Locale.ConvertTextKey("TXT_KEY_ML_POPUP_SHOW_LABELS"), f_Show=ShowOptionsDisplay}
	OPTIONSPANELS[2] = {String=Locale.ConvertTextKey("TXT_KEY_ML_POPUP_APPEARANCE"), f_Show=ShowOptionsAppearance}
	OPTIONSPANELS[3] = {String=Locale.ConvertTextKey("TXT_KEY_ML_POPUP_ICONS"), f_Show=ShowOptionsIcons}
	OPTIONSPANELS[4] = {String=Locale.ConvertTextKey("TXT_KEY_ML_POPUP_BATTLE"), f_Show=ShowOptionsBattle}
	OPTIONSPANELS[5] = {String=Locale.ConvertTextKey("TXT_KEY_ML_POPUP_GENERATOR"), f_Show=ShowOptionsDynamic}
	OPTIONSPANELS[6] = {String=Locale.ConvertTextKey("TXT_KEY_ML_POPUP_OTHER"), f_Show=ShowOptionsOther}

	COLOROPTIONS[1] = {String = Locale.ConvertTextKey("TXT_KEY_ML_OPTIONS_FONTCOLOR"), Name = "Font", Open = false}
	COLOROPTIONS[2] = {String = Locale.ConvertTextKey("TXT_KEY_ML_OPTIONS_SHADOWCOLOR"), Name = "Shadow", Open = false}
	COLOROPTIONS[3] = {String = Locale.ConvertTextKey("TXT_KEY_ML_OPTIONS_BACKGROUNDCOLOR"), Name = "Background", Open = false}
	COLOROPTIONS[4] = {String = Locale.ConvertTextKey("TXT_KEY_ML_OPTIONS_BORDERCOLOR"), Name = "Border", Open = false}

	table.insert(COLORS,{Name="Red",Suffix="_R"})
	table.insert(COLORS,{Name="Green",Suffix="_G"})
	table.insert(COLORS,{Name="Blue",Suffix="_B"})
	table.insert(COLORS,{Name="Alpha",Suffix="_A"})

	PopulateOptionsPullDown()
	PopulateDisplayPanel()
	PopulateAppearancePullDown()
	PopulateAppearancePanel() --must come after PopulateAppearancePullDown()
	PopulateIconsList()
	PopulateBattlePanel()

	Controls.Subtitle_Options:SetText("[ICON_GREAT_ENGINEER] "..Locale.ConvertTextKey("TXT_KEY_ML_POPUP_OPTIONS"))
	Controls.Options_Label:SetText("[ICON_GREAT_ENGINEER] "..Locale.ConvertTextKey("TXT_KEY_ML_POPUP_OPTIONS"))

	iOptionsScroll_MaxSize = iGrid_MaxSize - (iGrid_InnerOffsetTopOptions + iGrid_InnerMarginBottom)
	Controls.OptionsScrollGrid:SetSizeY(iOptionsScroll_MaxSize)
	Controls.OptionsScroll:SetSizeY(iOptionsScroll_MaxSize-18)


end