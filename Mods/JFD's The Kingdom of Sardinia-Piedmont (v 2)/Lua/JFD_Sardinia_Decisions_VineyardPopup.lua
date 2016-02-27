-- JFD_Sardinia_Decisions_VineyardPopup.lua
-- Author: JFD
-- DateCreated: 5/28/2014 5:24:04 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("IconSupport.lua")
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer = Players[activePlayerID]
local buildingRoyalVineyardID = GameInfoTypes["BUILDING_DECISIONS_JFD_ROYAL_VINEYARD"]
local buildingRoyalVineyardHappinessID = GameInfoTypes["BUILDING_DECISIONS_JFD_ROYAL_VINEYARD_HAPPINESS"]
local mathMin = math.min
local resourceWineID = GameInfoTypes["RESOURCE_WINE"]

-- JFD_Sardinia_ShowVineyardPopup
function JFD_Sardinia_ShowVineyardPopup()
	Controls.Background:SetHide(false)
	Controls.MainGrid:SetHide(false)
	JFD_Sardinia_UpdateCityList()
end
LuaEvents.JFD_Sardinia_ShowVineyardPopup.Add(JFD_Sardinia_ShowVineyardPopup)

-- JFD_Sardinia_OnCitySelected
function JFD_Sardinia_OnCitySelected()
	Controls.Background:SetHide(true)
	Controls.MainGrid:SetHide(true)	
	local city = activePlayer:GetCityByID(citySelectedID)
	city:SetNumRealBuilding(buildingRoyalVineyardID, 1)
	city:SetNumRealBuilding(buildingRoyalVineyardHappinessID, mathMin(5, activePlayer:GetNumResourceAvailable(resourceWineID, true)))
end
Controls.SelectButton:RegisterCallback(Mouse.eLClick, JFD_Sardinia_OnCitySelected)

-- JFD_Sardinia_OnCityChosen
function JFD_Sardinia_OnCityChosen(cityID)
	citySelectedID = cityID
	local cityDesc = activePlayer:GetCityByID(cityID):GetName()
	Controls.Menu:GetButton():LocalizeAndSetText(cityDesc)
	Controls.SelectButton:SetDisabled(false)
	Controls.SelectButton:LocalizeAndSetToolTip("TXT_KEY_JFD_DECISIONS_CHOOSE_VINEYARD_MENU_TOOLTIP", cityDesc)
end

-- JFD_Sardinia_UpdateCityList
function JFD_Sardinia_UpdateCityList()
	Controls.Menu:ClearEntries()
	for city in Players[activePlayerID]:Cities() do
		local entry = {}
		Controls.Menu:BuildEntry("InstanceOne", entry)
		entry.Button:SetVoid1(city:GetID())
		entry.Button:SetText(city:GetName())
	end
	IconHookup(5, 128, "JFD_SARDINIA_ATLAS", Controls.Image)
	Controls.SelectButton:SetDisabled(true)
	Controls.Menu:GetButton():LocalizeAndSetText("TXT_KEY_JFD_DECISIONS_CHOOSE_VINEYARD_MENU")
	Controls.Menu:CalculateInternals()
	Controls.Menu:RegisterSelectionCallback(JFD_Sardinia_OnCityChosen)
end
--==========================================================================================================================
--==========================================================================================================================
