-- JFD_GreatBritain_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Great Britain Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_CountNumMountedUnits
local unitCombatClassMountedID = GameInfoTypes["UNITCOMBAT_MOUNTED"]
function JFD_CountNumMountedUnits(playerID)
	local player = Players[playerID]
	local numMountedUnits = 0 
	for unit in player:Units() do
		if unit:GetUnitCombatType() == unitCombatClassMountedID then
			numMountedUnits = numMountedUnits + 1
		end
	end
    return numMountedUnits
end

-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- EVENTS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_GREAT_BRITAIN"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Great Britain: Charge of the Light Cavalry
--------------------------------------------------------------------------------------------------------------------------
local buildingMilitaryAcademyID = GameInfoTypes["BUILDING_MILITARY_ACADEMY"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"] 
local resourceOilID = GameInfoTypes["RESOURCE_OIL"]
local unitLandshipID = GameInfoTypes["UNIT_WWI_TANK"]
local Event_JFD_GreatBritain_LightBrigade = {}
	Event_JFD_GreatBritain_LightBrigade.Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE"
	Event_JFD_GreatBritain_LightBrigade.Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_DESC"
	Event_JFD_GreatBritain_LightBrigade.EventImage = 'Event_GreatBritain_LightBrigade.dds'
	Event_JFD_GreatBritain_LightBrigade.Weight = 10
	Event_JFD_GreatBritain_LightBrigade.CanFunc = (
		function (player)			
			if load(player, "Event_JFD_GreatBritain_LightBrigade") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() ~= eraIndustrialID then return false end
			if player:GetCapitalCity():IsHasBuilding(buildingMilitaryAcademyID) then return false end
			local goldCost = mathCeil(200*iMod)
			if player:GetGold() < goldCost then return false end
			if Teams[player:GetTeam()]:GetAtWarCount(false) == 0 then return false end
			if JFD_CountNumMountedUnits(player:GetID()) == 0 then return false end
			return true
		end
		)
	Event_JFD_GreatBritain_LightBrigade.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_GreatBritain_LightBrigade.Outcomes[1] = {}
	Event_JFD_GreatBritain_LightBrigade.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_1"
	Event_JFD_GreatBritain_LightBrigade.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_1"
	Event_JFD_GreatBritain_LightBrigade.Outcomes[1].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local numMountedUnits = JFD_CountNumMountedUnits(playerID)
			local goldCost = mathCeil((numMountedUnits*25)*iMod)
			if player:GetGold() < goldCost then return false end
			Event_JFD_GreatBritain_LightBrigade.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFD_GreatBritain_LightBrigade.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local numMountedUnits = JFD_CountNumMountedUnits(playerID)
			local goldCost = mathCeil((numMountedUnits*25)*iMod)
			player:ChangeGold(-goldCost)
			for unit in player:Units() do
				if unit:GetUnitCombatType() == unitCombatClassMountedID then
					unit:ChangeExperience(10)
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VICTORIA_LIGHT_BRIGADE_1"))
			save(player, "Event_JFD_GreatBritain_LightBrigade", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_GreatBritain_LightBrigade.Outcomes[2] = {}
	Event_JFD_GreatBritain_LightBrigade.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_2"
	Event_JFD_GreatBritain_LightBrigade.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_2"
	Event_JFD_GreatBritain_LightBrigade.Outcomes[2].CanFunc = (
		function(player)			
			local goldCost = mathCeil(200*iMod)
			if player:GetGold() < goldCost then return false end
			Event_JFD_GreatBritain_LightBrigade.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_2", goldCost)
			return true
		end
		)
	Event_JFD_GreatBritain_LightBrigade.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(200*iMod)
			player:ChangeGold(-goldCost)
			player:GetCapitalCity():SetNumRealBuilding(buildingMilitaryAcademyID, 1)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VICTORIA_LIGHT_BRIGADE_2"))
			save(player, "Event_JFD_GreatBritain_LightBrigade", true)
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_GreatBritain_LightBrigade.Outcomes[3] = {}
	Event_JFD_GreatBritain_LightBrigade.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_3"
	Event_JFD_GreatBritain_LightBrigade.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_3"
	Event_JFD_GreatBritain_LightBrigade.Outcomes[3].CanFunc = (
		function(player)		
			local playerID = player:GetID()
			local numMountedUnits = JFD_CountNumMountedUnits(playerID)
			local goldCost = mathCeil((numMountedUnits*100)*iMod)
			if player:GetGold() < goldCost then return false end
			if player:GetNumResourceAvailable(resourceOilID, true) < numMountedUnits then return false end
			Event_JFD_GreatBritain_LightBrigade.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_3", goldCost)
			return true
		end
		)
	Event_JFD_GreatBritain_LightBrigade.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local numMountedUnits = JFD_CountNumMountedUnits(playerID)
			local goldCost = mathCeil((numMountedUnits*100)*iMod)
			player:ChangeGold(-goldCost)
			local mountedUnits = {}
			local count = 1
			for unit in player:Units() do
				if unit:GetUnitCombatType() == unitCombatClassMountedID then 
					mountedUnits[count] = unit
					count = count + 1
				end
			end
			for _, unit in pairs(mountedUnits) do
				if unit then
					local landShip = player:InitUnit(unitLandshipID, unit:GetX(), unit:GetY())
					landShip:Convert(unit)
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VICTORIA_LIGHT_BRIGADE_2"))
			save(player, "Event_JFD_GreatBritain_LightBrigade", true)
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_GreatBritain_LightBrigade", Event_JFD_GreatBritain_LightBrigade)
--------------------------------------------------------------------------------------------------------------------------
-- Great Britain: Jubilee Celebrations
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_GreatBritain_Jubilee = {}
	Event_JFD_GreatBritain_Jubilee.Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE"
	Event_JFD_GreatBritain_Jubilee.Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE_DESC"
	Event_JFD_GreatBritain_Jubilee.EventImage = 'Event_GreatBritain_Jubilee.dds'
	Event_JFD_GreatBritain_Jubilee.Weight = 5
	Event_JFD_GreatBritain_Jubilee.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			return true
		end
		)
	Event_JFD_GreatBritain_Jubilee.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_GreatBritain_Jubilee.Outcomes[1] = {}
	Event_JFD_GreatBritain_Jubilee.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE_OUTCOME_1"
	Event_JFD_GreatBritain_Jubilee.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE_OUTCOME_RESULT_1"
	Event_JFD_GreatBritain_Jubilee.Outcomes[1].CanFunc = (
		function(player)	
			local wLtKDTurns = mathCeil(10*iGAMod)
			Event_JFD_GreatBritain_Jubilee.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE_OUTCOME_RESULT_1", wLtKDTurns)
			return true
		end
		)
	Event_JFD_GreatBritain_Jubilee.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local wLtKDTurns = mathCeil(10*iGAMod)
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(wLtKDTurns)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GREAT_BRITAIN_JUBILEE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VICTORIA_JUBILEE", player:GetName(), player:GetCivilizationDescription())) 
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_GreatBritain_Jubilee", Event_JFD_GreatBritain_Jubilee)
--=======================================================================================================================
--=======================================================================================================================


