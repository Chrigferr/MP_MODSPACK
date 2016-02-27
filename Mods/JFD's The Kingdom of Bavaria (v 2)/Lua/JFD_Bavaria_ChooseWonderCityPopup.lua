-- JFD_Bavaria_ChooseWonderCityPopup
-- Author: JFD
-- DateCreated: 5/28/2014 5:24:04 AM
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-- ShowPopup
------------------------------------------------------------------------------------------------------------------------
function ShowPopup()
	Controls.MainBG:SetHide(false)
	Controls.Main:SetHide(false)
	JFD_UpdateCityList()
end
LuaEvents.JFD_ShowChooseBavarianWonderPopup.Add(function() ShowPopup() end)
------------------------------------------------------------------------------------------------------------------------
-- OnSelectButton
------------------------------------------------------------------------------------------------------------------------
function OnSelectButton()
	Controls.MainBG:SetHide(true)
	Controls.Main:SetHide(true)	
	local iProductionReward = math.ceil(Players[Game.GetActivePlayer()]:GetTotalJONSCulturePerTurn() * 5)
	Players[Game.GetActivePlayer()]:GetCityByID(citySelectedID):ChangeBuildingProduction(Players[Game.GetActivePlayer()]:GetCityByID(citySelectedID):GetProductionBuilding(), iProductionReward)
end
Controls.SelectButton:RegisterCallback(Mouse.eLClick, OnSelectButton)
------------------------------------------------------------------------------------------------------------------------
-- OnCloseButton 
------------------------------------------------------------------------------------------------------------------------
function OnCloseButton()
	ContextPtr:SetHide(true)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_OnCityChosen
------------------------------------------------------------------------------------------------------------------------
function JFD_OnCityChosen(cityID)
	local player = Players[Game.GetActivePlayer()]
	local cityDesc = player:GetCityByID(cityID):GetName()
	Controls.Menu:GetButton():LocalizeAndSetText(cityDesc)
	citySelectedID = cityID

	local iProductionReward = math.ceil(Players[Game.GetActivePlayer()]:GetTotalJONSCulturePerTurn() * 5)
	Controls.SelectButton:SetDisabled(false)
	Controls.SelectButton:LocalizeAndSetToolTip("TXT_KEY_JFD_CHOOSE_CITY_MENU_TOOLTIP", cityDesc, iProductionReward)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateCityList
------------------------------------------------------------------------------------------------------------------------
function JFD_UpdateCityList()
	Controls.Menu:ClearEntries()
	local activePlayerID = Game.GetActivePlayer()
	
	for city in Players[activePlayerID]:Cities() do
		if city:GetProductionBuilding() ~= -1 then
			local currentBuildingClass = GameInfo.Buildings[city:GetProductionBuilding()].BuildingClass
			if GameInfo.BuildingClasses[currentBuildingClass].MaxGlobalInstances == 1 then
				local cityDesc = city:GetName()
				local entry = {}
				Controls.Menu:BuildEntry("InstanceOne", entry)
				entry.Button:SetVoid1(city:GetID())
				entry.Button:LocalizeAndSetText(cityDesc)
			end
		end
	end
	
	Controls.SelectButton:SetDisabled(true)
	Controls.Menu:GetButton():LocalizeAndSetText("TXT_KEY_JFD_CHOOSE_CITY_MENU")
	Controls.Menu:CalculateInternals()
	Controls.Menu:RegisterSelectionCallback(JFD_OnCityChosen)
end
--==========================================================================================================================
--==========================================================================================================================
