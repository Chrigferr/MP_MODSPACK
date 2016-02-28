--[[
*****************************************
*			Map Labels					*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************

ML_Labels:	Creates and displays labels on map

]]--


print(":::MAPLABELS::: ML_UI_DLG loaded")


--tables
tDLGFeaturesOptions = { }
tDLGFeaturesOptionsInstances = { }

--helper functions
function ResetDLGScroll()
	for i=1,2,1 do 
		Controls.DLG_Scroll:CalculateInternalSize()
		Controls.DLG_Scroll:ReprocessAnchoring()
	end
end



--DLG Choose Civ Cultures
--culture list popup
function CultureListAddButtonClicked(iPlayer,CultureID)
	dprintV("CultureListTextButtonClicked()")
	HideDLGCultures()
	table.insert(g.CivCultures[iPlayer],CULTURES[CultureID]["Type"])
	PopulateDLGCivCulturesPanel()
end

function PopulateDLGCultures(iPlayer)
	dprintV("PopulateDLGCultures()")
	Controls.DLGCulturesListStack:DestroyAllChildren()

	for GroupID,group in pairs(CULTUREGROUPS) do
		dprintV("Culture Group: "..group.Type)
		local instance = { }
		ContextPtr:BuildInstanceForControl("CulturesListInstance", instance, Controls.DLGCulturesListStack)
		instance.CultureGroupLabel:LocalizeAndSetText(group.Description)
		for CultureID,culture in pairs(CULTURES) do
			if (culture.Group == group.Type) then
				local instancerow = { }
				local bValid = true
				for _,sOldCulture in pairs(g.CivCultures[iPlayer]) do
					if sOldCulture==culture.Type then
						bValid = false
					end
				end
				if (bValid) then
					ContextPtr:BuildInstanceForControl("CulturesListByGroupInstance", instancerow, instance.CulturesListByGroupStack)
					instancerow.CultureListTextButton:LocalizeAndSetText(culture.Description)
					instancerow.CultureListTextButton:LocalizeAndSetToolTip(culture.SuggestedCivs)
					instancerow.CultureListAddButton:SetVoid1(iPlayer)
					instancerow.CultureListAddButton:SetVoid2(CultureID)
					instancerow.CultureListAddButton:RegisterCallback( Mouse.eLClick, CultureListAddButtonClicked)
				end
			end
		end
	end

	Controls.DLGCulturesScroll:CalculateInternalSize()
	Controls.DLGCulturesScroll:ReprocessAnchoring()
end


--civ cultures panel
function CivCultureDeleteClicked(iPlayer,i)
	dprintV("CivCultureDeleteClicked()")
	g.CivCultures[iPlayer][i] = nil
	PopulateDLGCivCulturesPanel()
end

function OnDLGAncientButtonClicked()
	GetCivCultures("ANCIENT")
	PopulateDLGCivCulturesPanel()
end
Controls.DLGAncientButton:RegisterCallback( Mouse.eLClick, OnDLGAncientButtonClicked)

function OnDLGModernButtonClicked()
	GetCivCultures("MODERN")
	PopulateDLGCivCulturesPanel()
end
Controls.DLGModernButton:RegisterCallback( Mouse.eLClick, OnDLGModernButtonClicked)


function PopulateDLGCivCulturesPanel()
	dprintV("PopulateDLGCivCulturesPanel()")
	Controls.DLG_Civilizations_CivList:DestroyAllChildren()
	local bPlayer0 = false

	for iPlayer,t in pairs(g.CivCultures) do
		
		local instance = { }
		ContextPtr:BuildInstanceForControl("CivCulturesInstance", instance, Controls.DLG_Civilizations_CivList)
		instance.CivCulturesLabel:SetText(GetName(iPlayer):upper())
		instance.CivCulturesListAddButton:SetVoid1(iPlayer)
		instance.CivCulturesListAddButton:RegisterCallback( Mouse.eLClick, ShowDLGCultures)
		for i,sCulture in pairs(t) do
			local instancerow = { }
			ContextPtr:BuildInstanceForControl("CivCulturesListInstance", instancerow, instance.CivCulturesListStack)
			instancerow.CivCulturesListLabel:LocalizeAndSetText(GameInfo["ML_Cultures"][sCulture]["Description"])
			instancerow.CivCulturesListLabel:LocalizeAndSetToolTip(GameInfo["ML_Cultures"][sCulture]["SuggestedCivs"])
			instancerow.CivCulturesListDeleteButton:SetVoid1(iPlayer)
			instancerow.CivCulturesListDeleteButton:SetVoid2(i)
			instancerow.CivCulturesListDeleteButton:RegisterCallback( Mouse.eLClick, CivCultureDeleteClicked)
		end
	end
	ResetDLGScroll()
end


--DLG options panel functions
function SaveDynamicOptions()
	dprint("SaveDynamicOptions()") 
	
	SetNumOptionFromEditBox("GlobalMaxChunks", Controls.GlobalMaxEditBox)
	SetNumOptionFromEditBox("GlobalMinPlotDistance", Controls.GlobalMinDistanceEditBox)
--	SetNumOptionFromEditBox("", )

	g.Options["CultureType"] = sCultureType
	g.Options["OneCulture"] = CULTURES[Controls.OneCulturePullDown:GetButton():GetVoid1()].Type

	for i,row in pairs(tDLGFeaturesOptions) do
		if (tDLGFeaturesOptionsInstances[i].FeatureEnabledCheckBox:IsChecked()) then
			c = tDLGFeaturesOptionsInstances[i]
			
			g.SubTypes(row.Type).Enabled = 1

			if string.len(c.FeatureMaxEditBox:GetText()) >= 1 then
				g.SubTypes(row.Type).MaxChunks = tonumber(c.FeatureMaxEditBox:GetText())
			end
			if string.len(c.FeatureMinPlotsEditBox:GetText()) >= 1 then
				g.SubTypes(row.Type).MinPlotsInChunk = tonumber(c.FeatureMinPlotsEditBox:GetText())
			end
			if string.len(c.FeatureMinDistanceEditBox:GetText()) >= 1 then
				g.SubTypes(row.Type).MinPlotDistance = tonumber(c.FeatureMinDistanceEditBox:GetText())
			end

			if (row.Type == "ISLAND") then
				if string.len(c.IslandMaxPlotsEditBox:GetText()) >= 1 then
					g.SubTypes(row.Type).MaxPlotsInChunk = tonumber(c.IslandMaxPlotsEditBox:GetText())
				end
			end
		else
			g.SubTypes(row.Type).Enabled = 0
		end
	end
end

function OnOneCultureChanged(ID)
	Controls.OneCulturePullDown:GetButton():LocalizeAndSetText(CULTURES[ID].Description)
	Controls.OneCulturePullDown:GetButton():SetVoid1(ID)
end

function OnCultureTypeChanged(i)
	sCultureType = CHOOSECULTURETYPES[i].Value
	Controls.CultureTypePullDown:GetButton():SetText(CHOOSECULTURETYPES[i].String)
	if (CHOOSECULTURETYPES[i].Value=="ONECULTURE") then
		Controls.CivCulturesButton:SetHide(true)
		Controls.OneCultureStack:SetHide(false)
	elseif (CHOOSECULTURETYPES[i].Value=="NEARESTCIV") then
		Controls.CivCulturesButton:SetHide(false)
		Controls.OneCultureStack:SetHide(true)
	else
		Controls.CivCulturesButton:SetHide(true)
		Controls.OneCultureStack:SetHide(true)
	end
end

function GlobalMaxCheckBoxClicked(bIsChecked)
	dprintV("GlobalMaxCheckBoxClicked()")
	iMaxChunks = g.Options["GlobalMaxChunks"]
	if (not bIsChecked) then
		if iMaxChunks==VALUEALL then
			iMaxChunks=""
		end
		Controls.GlobalMaxEditBox:SetText(iMaxChunks)
		Controls.GlobalMaxEditBox:SetHide(false)
		Controls.GlobalMaxEditBox:TakeFocus()
	else
		Controls.GlobalMaxEditBox:SetText(VALUEALL)
		Controls.GlobalMaxEditBox:SetHide(true)
	end
end

function GlobalMinDistanceCheckBoxClicked(bIsChecked)
	dprintV("GlobalMinDistanceCheckBoxClicked()")
	iMinPlot=g.Options["GlobalMinPlotDistance"]
	if (not bIsChecked) then
		if iMinPlot==VALUENONE then
			iMinPlot=""
		end	
		Controls.GlobalMinDistanceEditBox:SetText(iMinPlot)
		Controls.GlobalMinDistanceEditBox:SetHide(false)
		Controls.GlobalMinDistanceEditBox:TakeFocus()
	else
		Controls.GlobalMinDistanceEditBox:SetText(VALUENONE)
		Controls.GlobalMinDistanceEditBox:SetHide(true)
	end
end

function FeatureTitleClicked(i)
	dprintV("FeatureTitleClicked()")
	if (tDLGFeaturesOptions[i].Open == false) then
		tDLGFeaturesOptions[i].Open = true
		tDLGFeaturesOptionsInstances[i].FeatureOptionsLabel:SetText(tDLGFeaturesOptions[i].StringOpen)
		tDLGFeaturesOptionsInstances[i].FeatureOptionsOpenStack:SetHide(false)
	else
		tDLGFeaturesOptions[i].Open = false
		tDLGFeaturesOptionsInstances[i].FeatureOptionsLabel:SetText(tDLGFeaturesOptions[i].StringClosed)
		tDLGFeaturesOptionsInstances[i].FeatureOptionsOpenStack:SetHide(true)
	end
	ResetDLGScroll()
end

function FeaturesHeaderClicked()
	dprintV("FeaturesHeaderClicked()")
	if Controls.FeaturesStack:IsHidden() then
		Controls.FeaturesStack:SetHide(false)
		Controls.FeatureHeaderLabel:LocalizeAndSetText("TXT_KEY_ML_FEATURES_OPEN")
	else
		Controls.FeaturesStack:SetHide(true)
		Controls.FeatureHeaderLabel:LocalizeAndSetText("TXT_KEY_ML_FEATURES_CLOSED")
	end
	ResetOptionsScroll()
	ResetDLGScroll()
end
Controls.FeaturesHeaderButton:RegisterCallback(Mouse.eLClick, FeaturesHeaderClicked)

function RegionsHeaderClicked()
	dprintV("RegionsHeaderClicked()")
	if Controls.RegionsStack:IsHidden() then
		Controls.RegionsStack:SetHide(false)
		Controls.RegionHeaderLabel:LocalizeAndSetText("TXT_KEY_ML_REGIONS_HEADER_OPEN")
	else
		Controls.RegionsStack:SetHide(true)
		Controls.RegionHeaderLabel:LocalizeAndSetText("TXT_KEY_ML_REGIONS_HEADER_CLOSED")
	end
	ResetOptionsScroll()
	ResetDLGScroll()
end
Controls.RegionsHeaderButton:RegisterCallback(Mouse.eLClick, RegionsHeaderClicked)


function FeatureEnabledCheckBoxClicked(bIsChecked,i)
	dprintV("FeatureEnabledCheckBoxClicked()")
	if (not bIsChecked) then
		tDLGFeaturesOptionsInstances[i].FeatureOptionsEnabledStack:SetHide(true)
	else
		tDLGFeaturesOptionsInstances[i].FeatureOptionsEnabledStack:SetHide(false)
	end
	ResetOptionsScroll()
end

function FeatureMaxCheckBoxClicked(bIsChecked,i,iMaxChunks)
	dprintV("FeatureMaxCheckBoxClicked()")
	if (not bIsChecked) then
		if iMaxChunks==VALUEALL then
			iMaxChunks=""
		end
		tDLGFeaturesOptionsInstances[i].FeatureMaxEditBox:SetText(iMaxChunks)
		tDLGFeaturesOptionsInstances[i].FeatureMaxEditBox:SetHide(false)
		tDLGFeaturesOptionsInstances[i].FeatureMaxEditBox:TakeFocus()
	else
		tDLGFeaturesOptionsInstances[i].FeatureMaxEditBox:SetText(VALUEALL)
		tDLGFeaturesOptionsInstances[i].FeatureMaxEditBox:SetHide(true)
	end
end

function FeatureMinDistanceCheckBoxClicked(bIsChecked,i,iMinDistance)
	dprintV("FeatureMinDistanceCheckBoxClicked()")
	if (not bIsChecked) then
		if iMinDistance==VALUENONE then
			iMinDistance=""
		end
		tDLGFeaturesOptionsInstances[i].FeatureMinDistanceEditBox:SetText(iMinDistance)
		tDLGFeaturesOptionsInstances[i].FeatureMinDistanceEditBox:SetHide(false)
		tDLGFeaturesOptionsInstances[i].FeatureMinDistanceEditBox:TakeFocus()
	else
		tDLGFeaturesOptionsInstances[i].FeatureMinDistanceEditBox:SetText(VALUENONE)
		tDLGFeaturesOptionsInstances[i].FeatureMinDistanceEditBox:SetHide(true)
	end
end

function FeatureMinPlotsCheckBoxClicked(bIsChecked,i,iMinPlots)
	dprintV("FeatureMinPlotsCheckBoxClicked()")
	if (not bIsChecked) then
		if iMinPlots==VALUENONE then
			iMinPlots=""
		end
		tDLGFeaturesOptionsInstances[i].FeatureMinPlotsEditBox:SetText(iMinPlots)
		tDLGFeaturesOptionsInstances[i].FeatureMinPlotsEditBox:SetHide(false)
		tDLGFeaturesOptionsInstances[i].FeatureMinPlotsEditBox:TakeFocus()
	else
		tDLGFeaturesOptionsInstances[i].FeatureMinPlotsEditBox:SetText(VALUENONE)
		tDLGFeaturesOptionsInstances[i].FeatureMinPlotsEditBox:SetHide(true)
	end
end


function PopulateDLGPanel()
	dprintV("PopulateDLGPanel()")
	

	Controls.CultureTypePullDownStack:DestroyAllChildren()
	--populate culture pulldowns
	for i,row in pairs(CHOOSECULTURETYPES) do
		local entry = {}
		Controls.CultureTypePullDown:BuildEntry("CultureTypePullDownEntry", entry)
		entry.Button:SetVoid1(i)
		entry.Button:SetText(row.String)
	end
	local sCultureType
	local iCulture
	for i,row in pairs(CHOOSECULTURETYPES) do
		if g.Options.CultureType==row.Value then
			sCultureType = row.String
			iCulture = i
		end
	end
	Controls.CultureTypePullDown:GetButton():SetText(sCultureType)
	Controls.CultureTypePullDown:CalculateInternals()
	Controls.CultureTypePullDown:RegisterSelectionCallback(OnCultureTypeChanged)
	OnCultureTypeChanged(iCulture)

	Controls.OneCulturePullDownStack:DestroyAllChildren()
	for iCulture,row in pairs(CULTURES) do
		local entry = {}
		Controls.OneCulturePullDown:BuildEntry("OneCulturePullDownEntry", entry)
		entry.Button:SetVoid1(iCulture)
		entry.Button:LocalizeAndSetText(row.Description)
	end
	Controls.OneCulturePullDown:GetButton():LocalizeAndSetText(CULTURES[1].Description)
	Controls.OneCulturePullDown:GetButton():SetVoid1(1)
	Controls.OneCulturePullDown:CalculateInternals()
	Controls.OneCulturePullDown:RegisterSelectionCallback(OnOneCultureChanged)



	--global values
	Controls.GlobalMaxCheckBox:RegisterCheckHandler(GlobalMaxCheckBoxClicked)
	if (g.Options["GlobalMaxChunks"] == VALUEALL) then
		Controls.GlobalMaxCheckBox:SetCheck(true)
		GlobalMaxCheckBoxClicked(true)
	else
		GlobalMaxCheckBoxClicked(false)
	end

	Controls.GlobalMinDistanceCheckBox:RegisterCheckHandler(GlobalMinDistanceCheckBoxClicked)
	if (g.Options["GlobalMinPlotDistance"] == VALUENONE) then
		Controls.GlobalMinDistanceCheckBox:SetCheck(true)
		GlobalMinDistanceCheckBoxClicked(true)
	else
		GlobalMinDistanceCheckBoxClicked(false)
	end


	--options by feature
	Controls.FeaturesStack:DestroyAllChildren()
	Controls.RegionsStack:DestroyAllChildren()
	tDLGFeaturesOptionsInstances = { } --reset instances
	for iSubType,row in pairs(tDLGFeaturesOptions) do
		local iEnabled = row.Enabled
		if iEnabled == 1 then 
			iEnabled = true
		else
			iEnabled = false
		end
		local iMaxChunks = row.MaxChunks
		local iMinPlots = row.MinPlotsInChunk
		local iMinDistance = row.MinPlotDistance

		
		local instance = { }
		if (row.MainType == "FEATURE") then
			ContextPtr:BuildInstanceForControl("FeatureOptionsInstance", instance, Controls.FeaturesStack)
		else --"REGION"
			ContextPtr:BuildInstanceForControl("FeatureOptionsInstance", instance, Controls.RegionsStack)
		end
		tDLGFeaturesOptionsInstances[iSubType] = instance				
		
		--title
		instance.FeatureOptionsButton:SetVoid1(iSubType)
		instance.FeatureOptionsButton:RegisterCallback( Mouse.eLClick, FeatureTitleClicked)
		FeatureTitleClicked(iSubType)

		--enabled
		instance.FeatureEnabledCheckBox:SetCheck(iEnabled)	
		instance.FeatureEnabledCheckBox:SetVoid1(iSubType)
		instance.FeatureEnabledCheckBox:RegisterCheckHandler(FeatureEnabledCheckBoxClicked)
		FeatureEnabledCheckBoxClicked(iEnabled, iSubType)
			
		--max chunks
		instance.FeatureMaxCheckBox:SetVoid1(iSubType)
		instance.FeatureMaxCheckBox:SetVoid2(iMaxChunks)
		instance.FeatureMaxCheckBox:RegisterCheckHandler(FeatureMaxCheckBoxClicked)
		if (iMaxChunks == VALUEALL) then
			instance.FeatureMaxCheckBox:SetCheck(true)
			FeatureMaxCheckBoxClicked(true,iSubType,iMaxChunks)
		else
			FeatureMaxCheckBoxClicked(false,iSubType,iMaxChunks)
		end

		--min distance
		instance.FeatureMinDistanceCheckBox:SetVoid1(iSubType)
		instance.FeatureMinDistanceCheckBox:SetVoid2(iMinDistance)
		instance.FeatureMinDistanceCheckBox:RegisterCheckHandler(FeatureMinDistanceCheckBoxClicked)
		if (iMinDistance == VALUENONE) then
			instance.FeatureMinDistanceCheckBox:SetCheck(true)
			FeatureMinDistanceCheckBoxClicked(true,iSubType,iMinDistance)
		else
			FeatureMinDistanceCheckBoxClicked(false,iSubType,iMinDistance)
		end

		--min plots
		instance.FeatureMinPlotsCheckBox:SetVoid1(iSubType)
		instance.FeatureMinPlotsCheckBox:SetVoid2(iMinPlots)
		instance.FeatureMinPlotsCheckBox:RegisterCheckHandler(FeatureMinPlotsCheckBoxClicked)
		if (iMinPlots == VALUENONE) then
			instance.FeatureMinPlotsCheckBox:SetCheck(true)
			FeatureMinPlotsCheckBoxClicked(true,iSubType,iMinPlots)
		else
			FeatureMinPlotsCheckBoxClicked(false,iSubType,iMinPlots)
		end
		if (row.MainType == "REGION") then
			FeatureMinPlotsCheckBoxClicked(false,iSubType,iMinPlots)
			instance.FeatureMinPlotsCheckBox:SetHide(true)
		end

		if (row.SubType == "ISLAND") then
			instance.IslandMaxPlotsLabel:SetHide(false)
			instance.IslandMaxPlotsStack:SetHide(false)
			instance.IslandMaxPlotsEditBox:SetText(g.SubTypes[iSubType].MaxPlotsInChunk)
		end

		
	end
	Controls.FeaturesStack:CalculateSize()
	Controls.FeaturesStack:ReprocessAnchoring()
end

--DLG Execute functions
function OnDLGRedoClick()
	HideDLGStatus()
	ShowDLGStart()
end
Controls.DLGRedo:RegisterCallback(Mouse.eLClick, OnDLGRedoClick)

function DLG(s) --set error message text
	Controls.MessageText2:SetText("Error at: "..s)
end

function DLGTotal(s)
	sOld = Controls.DLGTotalsLabel:GetText()
	Controls.DLGTotalsLabel:SetText(sOld.."[NEWLINE]"..s)
end 


function ContinueGenerateDynamicLabels()
	HideMessage()
	MouseBusy()
	
	Controls.Message:ReprocessAnchoring()
	
	local sError = ("Map="..string.gsub(PreGame.GetMapScript(),"Assets/Maps/","").." / "..Map.GetWorldSize().." / "..g.Options.CultureType)
	ShowMessage(ERRORMSG,nil,nil,sError)
--	Controls.MessageText:SetText(sError)
	Controls.MessageText2:SetHide(false)
	
--	DLG("Saving Options")
--	SaveDynamicOptions()

	DLG("Deleting Feature and Region Labels")
	for i,row in pairs(g.Labels) do
		if (row.MainType == "FEATURE" or row.MainType == "REGION") then
			g.Labels[i] = nil
		end
	end
	local tLabels = DynamicLabelsGenerator()
	dprint("tLabels created")
	DLG("Adding new Map Labels to table")
	
	Controls.DLGTotalsLabel:SetText("")
	local numLabels = {  }
	for i,row in pairs(tLabels) do
		numLabels[row.SubType] = numLabels[row.SubType] or 1
		dprintV("i="..i,"row="..row.Name)
		table.insert(g.Labels,row)
		dprintV("row inserted")
		if (i>500) then 
			dprint("DLG insert labels into g.Labels caused infinite loop!",ERROR)
			break
		end
		numLabels[row.SubType] = numLabels[row.SubType] + 1
	end

	for i, strow in pairs(g.SubTypes) do
		for SubType, num in pairs(numLabels) do
			if strow.Type == SubType then
				DLGTotal(strow.StringWithIcon.."s: "..num)
			end
		end
	end

	dprint("g.Labels updated")
	DLG("Placing Labels on Map")
	RedrawLabels()
--	dprint("labels drawn")
	DLG("DLG Completed")
	MouseNormal()
	HideMessage()
	Controls.MessageText2:SetHide(true)
	ShowDLGStatus()
	Controls.DLGOK:SetHide(false)
end

function OnGenerateDynamicLabelsButtonClicked()
	dprint("OnGenerateDynamicLabelsButtonClicked")
	SaveDynamicOptions()
	HideDLGStart()
	if bDLGStart == true then
		ContinueGenerateDynamicLabels()
		bDLGStart = false
	else
		ShowMessage(DYNAMIC)
	end
end
Controls.GenerateDynamicLabelsButton:RegisterCallback(Mouse.eLClick, OnGenerateDynamicLabelsButtonClicked)


--show/hide panel functions
function ShowDLGStatus()
	Controls.DLGStatus:SetHide(false)
	Controls.DLGStatus:ReprocessAnchoring()
	Controls.DLGOK:SetHide(true)
end

function HideDLGStatus()
	Controls.DLGStatus:SetHide(true)
end
Controls.DLGOK:RegisterCallback(Mouse.eLClick, HideDLGStatus)

function ShowDLGCultures(iPlayer)
	dprintV("ShowDLGCultures()")
	MouseBusy()
	PopulateDLGCultures(iPlayer)
	Controls.DLGCulturesContainer:SetHide(false)
	Controls.DLGCulturesScroll:CalculateInternalSize()
	MouseNormal()
end

function HideDLGCultures()
	dprintV("HideDLGCultures()")
	Controls.DLGCulturesContainer:SetHide(true)
end
Controls.DLGCulturesCloseButton:RegisterCallback( Mouse.eLClick, HideDLGCultures)

function ShowDLGCivCultures()
	MouseBusy()
	HideDLGOptions()
	Controls.DLG_Civilizations:ChangeParent(Controls.DLG_Scroll)
	Controls.DLG_Civilizations:SetHide(false)
	PopulateDLGCivCulturesPanel()
	ResetDLGScroll()
	MouseNormal()
end
Controls.CivCulturesButton:RegisterCallback( Mouse.eLClick, ShowDLGCivCultures)

function HideDLGCivCultures()
	Controls.DLG_Civilizations:ChangeParent(Controls.PopupContentContainer)
	ShowDLGOptions()
end
Controls.DLGBackButton:RegisterCallback( Mouse.eLClick, HideDLGCivCultures)

function ShowDLGOptions()
	Controls.OptionsContent_Dynamic:ChangeParent(Controls.DLG_Scroll)
	ResetDLGScroll()
end

function HideDLGOptions()
	Controls.OptionsContent_Dynamic:ChangeParent(Controls.PopupContentContainer)
end

function ShowDLGStart()
	dprintV("ShowDLGStart()")
	HideDLGCivCultures()
	ResetDLGScroll()
	Controls.DLG_Start:SetHide(false)
end

function HideDLGStart()
	dprintV("HideDLGStart()")
	Controls.DLG_Start:SetHide(true)
end
Controls.DLG_CloseButton:RegisterCallback(Mouse.eLClick, HideDLGStart)


--init
function Init_UI_DLG()
	dprint("Init_UI_DLG()")

	

	--populate tDLGFeaturesOptions
	for iSubType,strow in pairs(g.SubTypes) do
		if (strow.MainType=="REGION" or strow.MainType=="FEATURE") then
			tDLGFeaturesOptions[iSubType] = strow
			tDLGFeaturesOptions[iSubType].StringOpen = "[ICON_MINUS] "..strow.StringWithIcon
			tDLGFeaturesOptions[iSubType].StringClosed = "[ICON_PLUS] "..strow.StringWithIcon
			tDLGFeaturesOptions[iSubType].Open = true
		end
	end

	CHOOSECULTURETYPES = { }
	CHOOSECULTURETYPES[1] = {Value="NEARESTCIV", String=Locale.ConvertTextKey("TXT_KEY_ML_OPTIONS_CULTURE_BYCIV")}
	CHOOSECULTURETYPES[2] = {Value="ONECULTURE", String=Locale.ConvertTextKey("TXT_KEY_ML_OPTIONS_CULTURE_ONECULTURE")}
	CHOOSECULTURETYPES[3] = {Value="RANDOM", String=Locale.ConvertTextKey("TXT_KEY_ML_OPTIONS_CULTURE_RANDOM")}

	Controls.DLG_StartGrid:SetSizeY(iGrid_MaxSize)
	Controls.DLG_ScrollGrid:SetSizeY(iOptionsScroll_MaxSize+127)
	Controls.DLG_Scroll:SetSizeY(iOptionsScroll_MaxSize+107)
	for i=1,3,1 do
		Controls.DLG_StartGrid:ReprocessAnchoring()
		Controls.DLG_ScrollGrid:ReprocessAnchoring()
	end

	Controls.DLG_StartGrid:SetOffsetY(iGrid_DLGOffset)

	PopulateDLGPanel()
end