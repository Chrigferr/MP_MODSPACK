--[[
*****************************************
*			Map Labels					*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************
]]--
print(":::MAPLABELS::: ML_UI_Misc loaded")


--MESSAGES
function ShowMessage(iType, iVoid1, iVoid2, sMsg)
	dprint("ShowMessage()")
	--MESSAGE[TYPE] .String="TYPE"  .f_Continue=function
	local Message = MESSAGE[iType]
	local sTitle = tostring("TXT_KEY_ML_MSG_TITLE_"..Message.String):upper()
	local sTxt = "[ICON_ML_EXCLAMATION2] "
	if (sMsg and string.len(sMsg)>1) then
		sTxt = sTxt..sMsg
	else
		sTxt = sTxt..Locale.ConvertTextKey("TXT_KEY_ML_MSG_TXT_"..Message.String)
	end

	if (iType==ERRORMSG) then
		Controls.ContinueButton:SetHide(true)
		Controls.MessageButtonStack:ReprocessAnchoring()
	else
		Controls.ContinueButton:SetHide(false)
		if (iVoid1) then Controls.ContinueButton:SetVoid1(iVoid1); end
		if (iVoid2) then Controls.ContinueButton:SetVoid2(iVoid2); end
		Controls.ContinueButton:RegisterCallback(Mouse.eLClick, Message.f_Continue)
		Controls.MessageButtonStack:ReprocessAnchoring()
	end

	Controls.MessageTitle:LocalizeAndSetText(sTitle)
	Controls.MessageText:LocalizeAndSetText(sTxt)
	Controls.MessageText:SetWrapWidth(325)
	Controls.MessageText2:SetHide(true)

	Controls.MessageGrid:ReprocessAnchoring()
	Controls.Message:SetHide(false)
end

function HideMessage()
	Controls.Message:SetHide(true)
	MouseNormal()
end
Controls.CancelButton:RegisterCallback(Mouse.eLClick, HideMessage)


--ICONS
function PopulateIconPanel(iSubType, iPanel, bRecent)
	dprint("PopulateIconPanel()")

	--icons table: ICONS_TABLE[Icon#] = IconName (ex. ICON_WAR, no brackets)
	--total icons: iNumIcons

	ICONSPERROW = 5
	local iNumRows = 0
	local iCounter = 1
	local iTotalIcons = 0

	local c

	if (bRecent) then
		c = Controls.IconRecentStack
		iTotalIcons = #g.IconsRecent
	else
		c = Controls.IconOuterStack
		iTotalIcons = iNumIcons
	end

	if iTotalIcons == 0 then
		Controls.Bar_Icon:SetHide(true)
		return
	else
		Controls.Bar_Icon:SetHide(false)
	end
	
	iNumRows = math.ceil(iTotalIcons/ICONSPERROW)

	for i = 1, iNumRows, 1 do
		row = { }
		ContextPtr:BuildInstanceForControl("IconRowInstance", row, c)
		for j = 1, ICONSPERROW, 1 do

			local iIcon
			if (bRecent) then
				iIcon = g.IconsRecent[iCounter]
			else
				iIcon = iCounter
			end
			local sIcon = tostring(ICONS_TABLE[iIcon]) or nil

			local sTT
			if sIcon == "BLANK" then
				sIcon = ""
				sTT = "No Icon"
			elseif sIcon and string.len(sIcon)>1 then
				sTT = string.gsub(sIcon,"%[ICON_","") -- remove [ICON_...] from tooltip
				sTT = string.gsub(sTT,"%]","")
				sTT = string.gsub(sTT,"ML_","")
			end

			local instance = { }
			ContextPtr:BuildInstanceForControl("IconInstance", instance, row.IconInnerStack)
			instance.IconLabel:SetText(sIcon)
			instance.IconButton:SetVoid1(iIcon)
			instance.IconButton:SetVoid2(iSubType)
			instance.IconButton:SetToolTipString(sTT)

			if iPanel == ICON then
				instance.IconButton:RegisterCallback(Mouse.eLClick, ChangeOptionPanelIcon)
				if (sIcon == g.SubTypes[iSubType].Icon) then
					instance.IconCurrent:SetHide(false)
				end
			elseif iPanel == ADD then
				instance.IconButton:RegisterCallback(Mouse.eLClick, ChangeAddPanelIcon)
				if (sIcon == Controls.AddIconButtonLabel:GetText()) then
					instance.IconCurrent:SetHide(false)
				end
			elseif iPanel == QUICKADD then
				instance.IconButton:RegisterCallback(Mouse.eLClick, QuickAddIconChosen)
			end
			
			--dprint("Icon ID: "..iCounter, "IconName: "..ICONS_TABLE[iCounter])
			

			if iCounter >= iTotalIcons then
				Controls.IconScroll:CalculateInternalSize()
				Controls.IconScroll:ReprocessAnchoring()
				return
			else
				iCounter = iCounter + 1
			end
		end
	end
end

function InsertRecentIcon(iIconID)
	for _,i in pairs(g.IconsRecent) do
		if i==iIconID then
			return
		end
	end
	table.insert(g.IconsRecent,iIconID)
end


function ChangeAddPanelIcon(iIconID,_)
	InsertRecentIcon(iIconID)
	sIcon = ICONS_TABLE[iIconID]
	Controls.AddIconButtonLabel:SetText(sIcon)
	HideIconPanel()
end

function ShowIconPanel(i,iPanel)
	dprint("ShowIconPanel()")
	MouseBusy()
	Controls.IconOuterStack:DestroyAllChildren()
	Controls.IconRecentStack:DestroyAllChildren()
	PopulateIconPanel(i,iPanel,true) --populate recent icons
	PopulateIconPanel(i,iPanel,false) --populate all icons
	if (iPanel == ICON) then
		Controls.IconFrame:SetOffsetVal(400,500)
	elseif (iPanel == ADD) then
		Controls.IconFrame:SetOffsetVal(100,400)
	elseif (iPanel == QUICKADD) then
		Controls.IconFrame:SetOffsetVal(0,400)
	end
	Controls.IconScroll:SetScrollValue(0)
	MouseNormal()
	Controls.IconContainer:SetHide(false)
end

function HideIconPanel()
	Controls.IconContainer:SetHide(true)
end
Controls.IconCloseButton:RegisterCallback(Mouse.eLClick, HideIconPanel)



--init
function Init_UI_Misc()
	MESSAGE = { } 
		--String="TYPE", f_Continue=Function to call when Message Box Continue clicked
		--IconControl=Controls.IconControl
	MESSAGE[DYNAMIC] = {String="DYNAMIC", f_Continue=ContinueGenerateDynamicLabels}
	MESSAGE[DELETE] = {String="DELETE", f_Continue=DeleteModeContinue}
	MESSAGE[ERRORMSG] = {String="ERROR"}
	MESSAGE[DEFAULTS] = {String="DEFAULTS", f_Continue=RestoreDefaultsContinue}

	--registercallbacks for Map Options menu checkbox
	Controls.MMShowMapLabels:RegisterCheckHandler(OnMiniMapClick)
	Controls.MMOpenOptions:RegisterCallback(Mouse.eLClick, MMOpenOptionsClick)
	Controls.MMOpenPopup:RegisterCallback(Mouse.eLClick, (function() ShowPopup();end))

	ResetIconStrings()
end
