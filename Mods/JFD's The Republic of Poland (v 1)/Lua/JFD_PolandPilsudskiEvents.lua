-- JFD_PolandPilsudskiEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Poland (Pilsudski) Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID	= GameInfoTypes["CIVILIZATION_JFD_POLAND_PILSUDSKI"]
local eraAtomicID		= GameInfoTypes["ERA_MODERN"]
local mathCeil			= math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Poland (Pilsudski): May Coup
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDPolandPilsudskiMayCoup = {}
	Event_JFDPolandPilsudskiMayCoup.Name = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_MAY_COUP"
	Event_JFDPolandPilsudskiMayCoup.Desc = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_MAY_COUP_DESC"
	Event_JFDPolandPilsudskiMayCoup.Weight = 5
	Event_JFDPolandPilsudskiMayCoup.CanFunc = (
		function (player)			
			if load(player, "Event_JFDPolandPilsudskiMayCoup") == true	then return false end
			if player:GetCivilizationType() ~= civilisationID 			then return false end
			if player:GetCurrentEra() < eraAtomicID 					then return false end
			
			return true
		end
		)
	Event_JFDPolandPilsudskiMayCoup.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDPolandPilsudskiMayCoup.Outcomes[1] = {}
	Event_JFDPolandPilsudskiMayCoup.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_MAY_COUP_OUTCOME_1"
	Event_JFDPolandPilsudskiMayCoup.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_MAY_COUP_OUTCOME_RESULT_1"
	Event_JFDPolandPilsudskiMayCoup.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDPolandPilsudskiMayCoup.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_MAY_COUP_OUTCOME_RESULT_1", player:GetCityByID(cityID):GetName())
			return true
		end
		)
	Event_JFDPolandPilsudskiMayCoup.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:GetCapitalCity():ChangeResistanceTurns(3)
			player:SetNumFreePolicies(1)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_POLAND_PILSUDSKI_MAY_COUP_OUTCOME_RESULT_1_NOTIFICATION", player:GetCivilizationDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_MAY_COUP"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_POLAND_PILSUDSKI_MAY_COUP", player:GetCivilizationDescription()))
			save(player, "Event_JFDPolandPilsudskiVaBanque", true)
		end)

Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDPolandPilsudskiMayCoup", Event_JFDPolandPilsudskiMayCoup, 1926, true)
--------------------------------------------------------------------------------------------------------------------------
--  Poland (Pilsudski): Enigma Code
--------------------------------------------------------------------------------------------------------------------------
local buildingEnigmaCodeID = GameInfoTypes["BUILDING_JFD_PILSUDSKI_ENIGMA_CODE"] 

local Event_JFDPolandPilsudskiEnigmaCode = {}
	Event_JFDPolandPilsudskiEnigmaCode.Name = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_ENIGMA_CODE"
	Event_JFDPolandPilsudskiEnigmaCode.Desc = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_ENIGMA_CODE_DESC"
	Event_JFDPolandPilsudskiEnigmaCode.Weight = 5
	Event_JFDPolandPilsudskiEnigmaCode.CanFunc = (
		function (player)			
			if load(player, "Event_JFDPolandPilsudskiEnigmaCode") == true	then return false end
			if player:GetCivilizationType() ~= civilisationID 				then return false end
			if player:GetCurrentEra() < eraAtomicID 						then return false end
			
			return true
		end
		)
	Event_JFDPolandPilsudskiEnigmaCode.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDPolandPilsudskiEnigmaCode.Outcomes[1] = {}
	Event_JFDPolandPilsudskiEnigmaCode.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_ENIGMA_CODE_OUTCOME_1"
	Event_JFDPolandPilsudskiEnigmaCode.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_ENIGMA_CODE_OUTCOME_RESULT_1"
	Event_JFDPolandPilsudskiEnigmaCode.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDPolandPilsudskiEnigmaCode.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_ENIGMA_CODE_OUTCOME_RESULT_1", player:GetCityByID(cityID):GetName())
			return true
		end
		)
	Event_JFDPolandPilsudskiEnigmaCode.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:GetCapitalCity():SetNumRealBuilding(buildingEnigmaCodeID, 1)
			player:SetNumFreePolicies(1)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_POLAND_PILSUDSKI_ENIGMA_CODE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_ENIGMA_CODE"))
			save(player, "Event_JFDPolandPilsudskiEnigmaCode", true)
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDPolandPilsudskiEnigmaCode", Event_JFDPolandPilsudskiEnigmaCode)
--------------------------------------------------------------------------------------------------------------------------
-- Poland (Pilsudski): Va Banque
--------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]

local Event_JFDPolandPilsudskiVaBanque = {}
	Event_JFDPolandPilsudskiVaBanque.Name = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_VA_BANQUE"
	Event_JFDPolandPilsudskiVaBanque.Desc = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_VA_BANQUE_DESC"
	Event_JFDPolandPilsudskiVaBanque.Weight = 5
	Event_JFDPolandPilsudskiVaBanque.CanFunc = (
		function(player)			
			if load(player, "Event_JFDPolandPilsudskiVaBanque") == true	then return false end
			if player:GetCivilizationType() ~= civilisationID 			then return false end
			if player:GetCurrentEra() < eraIndustrialID 				then return false end
			
			return true
		end
		)
	Event_JFDPolandPilsudskiVaBanque.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDPolandPilsudskiVaBanque.Outcomes[1] = {}
	Event_JFDPolandPilsudskiVaBanque.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_VA_BANQUE_OUTCOME_1"
	Event_JFDPolandPilsudskiVaBanque.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_VA_BANQUE_OUTCOME_RESULT_1"
	Event_JFDPolandPilsudskiVaBanque.Outcomes[1].CanFunc = (
		function(player)	
			local goldReward = mathCeil(200 * iMod)
			Event_JFDPolandPilsudskiVaBanque.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_VA_BANQUE_OUTCOME_RESULT_1", goldReward)
			return true
		end
		)
	Event_JFDPolandPilsudskiVaBanque.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldReward = mathCeil(200 * iMod)
			player:ChangeGold(goldReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_POLAND_PILSUDSKI_VA_BANQUE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_VA_BANQUE"))
			save(player, "Event_JFDPolandPilsudskiVaBanque", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDPolandPilsudskiVaBanque.Outcomes[2] = {}
	Event_JFDPolandPilsudskiVaBanque.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_VA_BANQUE_OUTCOME_2"
	Event_JFDPolandPilsudskiVaBanque.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_VA_BANQUE_OUTCOME_RESULT_2"
	Event_JFDPolandPilsudskiVaBanque.Outcomes[2].CanFunc = (
		function(player)	
			local cultureReward = mathCeil(90 * iMod)
			local wLtKDReward = 5 * iGAMod
			Event_JFDPolandPilsudskiVaBanque.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_VA_BANQUE_OUTCOME_RESULT_2", cultureReward, wLtKDReward)
			return true
		end
		)
	Event_JFDPolandPilsudskiVaBanque.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = mathCeil(90 * iMod)
			local wLtKDReward = 5 * iGAMod
			player:ChangeJONSCulture(cultureReward)
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(wLtKDReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_POLAND_PILSUDSKI_VA_BANQUE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_PILSUDSKI_VA_BANQUE"))
			save(player, "Event_JFDPolandPilsudskiVaBanque", true)
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDPolandPilsudskiVaBanque", Event_JFDPolandPilsudskiVaBanque)
--=======================================================================================================================
--=======================================================================================================================


