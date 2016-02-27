-- ChooseStateReligionPopup
-- Author: JFD
-- DateCreated: 5/28/2014 5:24:04 AM
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-- Globals
------------------------------------------------------------------------------------------------------------------------
local activePlayer = Players[Game.GetActivePlayer()]
------------------------------------------------------------------------------------------------------------------------
-- JFD_OnSelectButton
------------------------------------------------------------------------------------------------------------------------
local buildingCathedralID = GameInfoTypes["BUILDING_CATHEDRAL"]

function JFD_OnSelectButton()
	Controls.MainUIBG:SetHide(true)
	Controls.MainUI:SetHide(true)	

	local city = activePlayer:GetCityByID(citySelectedID)
	city:SetNumRealBuilding(buildingCathedralID, 1)
	city:SetName("CityInstance of " .. city:GetName())
end
Controls.SelectButton:RegisterCallback(Mouse.eLClick, JFD_OnSelectButton)
------------------------------------------------------------------------------------------------------------------------
-- JFD_OnStateReligionChosen
------------------------------------------------------------------------------------------------------------------------
function JFD_OnCityChosen(cityID)
	local player = Players[Game.GetActivePlayer()]
	local cityDesc = player:GetCityByID(cityID):GetName()
	Controls.CityInstanceMenu:GetButton():LocalizeAndSetText(cityDesc)
	citySelectedID = cityID

	Controls.SelectButton:SetDisabled(false)
	Controls.SelectButton:LocalizeAndSetToolTip("TXT_KEY_JFD_CHOOSE_ARCHDIOCESE_MENU_TOOLTIP", cityDesc)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_ShowPopup
------------------------------------------------------------------------------------------------------------------------
function JFD_ShowPopup()
	Controls.MainUIBG:SetHide(false)
	Controls.MainUI:SetHide(false)
	JFD_UpdateCityList()
end
LuaEvents.JFD_ShowChooseArchdiocesePopup.Add(function() JFD_ShowPopup() end)
------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateCityList
------------------------------------------------------------------------------------------------------------------------
function JFD_UpdateCityList()
	Controls.CityInstanceMenu:ClearEntries()
	local activePlayerID = Game.GetActivePlayer()
	
	for city in Players[activePlayerID]:Cities() do
		local cityDesc = city:GetName()
		local entry = {}
		Controls.CityInstanceMenu:BuildEntry("InstanceOne", entry)
		entry.Button:SetVoid1(city:GetID())
		entry.Button:LocalizeAndSetText(cityDesc)
	end
	
	Controls.SelectButton:SetDisabled(true)
	Controls.CityInstanceMenu:GetButton():LocalizeAndSetText("TXT_KEY_JFD_CHOOSE_ARCHDIOCESE_MENU")
	Controls.CityInstanceMenu:CalculateInternals()
	Controls.CityInstanceMenu:RegisterSelectionCallback(JFD_OnCityChosen)
end
--==========================================================================================================================
--==========================================================================================================================
