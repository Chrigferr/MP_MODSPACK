-- JFD_Novgorod_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Novgorod Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num*eraMod/100)
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
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilizationID  = GameInfoTypes["CIVILIZATION_JFD_NOVGOROD"]
local eraMedievalID	  = GameInfoTypes["ERA_MEDIEVAL"]	
local mathCeil		  = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Novgorod: New Posadnik Elected
--------------------------------------------------------------------------------------------------------------------------
local posadnikRewards = 1
local Event_JFD_Novgorod_Posadnik = {}
	Event_JFD_Novgorod_Posadnik.Name = "TXT_KEY_EVENT_JFD_NOVGOROD_POSADNIK"
	Event_JFD_Novgorod_Posadnik.Desc = "TXT_KEY_EVENT_JFD_NOVGOROD_POSADNIK_DESC"
	Event_JFD_Novgorod_Posadnik.EventImage = 'Event_Novgorod_Posadnik.dds'
	Event_JFD_Novgorod_Posadnik.Weight = 5
	Event_JFD_Novgorod_Posadnik.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() < eraMedievalID then return false end
			local boyarName = "TXT_KEY_GREAT_PERSON_JFD_BOYAR_" .. GetRandom(1,20)			
			Event_JFD_Novgorod_Posadnik.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NOVGOROD_POSADNIK_DESC", boyarName)
			return true
		end
		)
	Event_JFD_Novgorod_Posadnik.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Novgorod_Posadnik.Outcomes[1] = {}
	Event_JFD_Novgorod_Posadnik.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NOVGOROD_POSADNIK_OUTCOME_1"
	Event_JFD_Novgorod_Posadnik.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NOVGOROD_POSADNIK_OUTCOME_RESULT_1"
	Event_JFD_Novgorod_Posadnik.Outcomes[1].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local rewardType = "[ICON_GOLD] Gold"
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			posadnikRewards = GetRandom(1,4)
			if posadnikRewards == 2 then 
				rewardType = "[ICON_GOLDEN_AGE] Golden Age Points"
				reward = JFD_GetEraAdjustedValue(playerID, mathCeil(60*iGAMod))
			elseif posadnikRewards == 3 then 
				rewardType = "[ICON_PEACE] Faith"
				reward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			elseif posadnikRewards == 4 then 
				rewardType = "[ICON_CULTURE] Culture"
				reward = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			end
			Event_JFD_Novgorod_Posadnik.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NOVGOROD_POSADNIK_OUTCOME_RESULT_1", reward, rewardType)
			return true
		end
		)
	Event_JFD_Novgorod_Posadnik.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if posadnikRewards == 1 then
				reward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
				player:ChangeGold(reward)
			elseif posadnikRewards == 2 then 
				reward = JFD_GetEraAdjustedValue(playerID, mathCeil(60*iGAMod))
				player:ChangeGoldenAgeProgressMeter(reward)
			elseif posadnikRewards == 3 then 
				reward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
				player:ChangeFaith(reward)
			elseif posadnikRewards == 4 then 
				reward = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
				player:ChangeJONSCulture(reward)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NOVGOROD_POSADNIK_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NOVGOROD_POSADNIK"))
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Novgorod_Posadnik", Event_JFD_Novgorod_Posadnik)
--------------------------------------------------------------------------------------------------------------------------
--  Novgorod: Treachery in the Court
--------------------------------------------------------------------------------------------------------------------------
local attackedCity 			= nil
local eraIndustrialID 		= GameInfoTypes["ERA_INDUSTRIAL"]
local revoltingCity 		= nil
local playerBarbarian 		= Players[63]
local playerBarbarianTeamID = playerBarbarian:GetTeam()
local Event_JFD_Novgorod_Treachery = {}
	Event_JFD_Novgorod_Treachery.Name = "TXT_KEY_EVENT_JFD_NOVGOROD_TREACHERY"
	Event_JFD_Novgorod_Treachery.Desc = "TXT_KEY_EVENT_JFD_NOVGOROD_TREACHERY_DESC"
	Event_JFD_Novgorod_Treachery.EventImage = 'Event_Novgorod_Treachery.dds'
	Event_JFD_Novgorod_Treachery.Weight = 5
	Event_JFD_Novgorod_Treachery.CanFunc = (
		function(player)	
			if load(player, "Event_JFD_Novgorod_Treachery") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if (not Teams[player:GetTeam()]:IsAtWar(playerBarbarianTeamID))	then return false end
			if player:GetCurrentEra() < eraMedievalID then return false end
			if player:GetCurrentEra() > eraIndustrialID then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				cities[count] = city
				count = count + 1
			end
			revoltingCity = cities[GetRandom(1, #cities)]
			attackedCity = cities[GetRandom(1, #cities)]
			if ((not revoltingCity) or (not attackedCity)) then return false end
			Event_JFD_Novgorod_Treachery.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NOVGOROD_TREACHERY_DESC", revoltingCity:GetName(), attackedCity:GetName())
			return true
		end
		)
	Event_JFD_Novgorod_Treachery.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Novgorod_Treachery.Outcomes[1] = {}
	Event_JFD_Novgorod_Treachery.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NOVGOROD_TREACHERY_OUTCOME_1"
	Event_JFD_Novgorod_Treachery.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NOVGOROD_TREACHERY_OUTCOME_RESULT_1"
	Event_JFD_Novgorod_Treachery.Outcomes[1].CanFunc = (
		function(player)			
			local goldCost = mathCeil(400*iMod)
			if player:GetGold() < goldCost then return false end
			Event_JFD_Novgorod_Treachery.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NOVGOROD_TREACHERY_OUTCOME_RESULT_1", goldCost, revoltingCity:GetName())
			return true
		end
		)
	Event_JFD_Novgorod_Treachery.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(400 * iMod)
			player:ChangeGold(-goldCost)
			revoltingCity:ChangeResistanceTurns(2)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NOVGOROD_TREACHERY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NOVGOROD_TREACHERY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NOVGOROD_TREACHERY_1", player:GetName(), player:GetCivilizationShortDescription())) 
			save(player, "Event_JFD_Novgorod_Treachery", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Novgorod_Treachery.Outcomes[2] = {}
	Event_JFD_Novgorod_Treachery.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_NOVGOROD_TREACHERY_OUTCOME_2"
	Event_JFD_Novgorod_Treachery.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_NOVGOROD_TREACHERY_OUTCOME_RESULT_2"
	Event_JFD_Novgorod_Treachery.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFD_Novgorod_Treachery.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NOVGOROD_TREACHERY_OUTCOME_RESULT_2", revoltingCity:GetName(), attackedCity:GetName())
			return true
		end
		)
	Event_JFD_Novgorod_Treachery.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local attackedCityX = attackedCity:GetX()+1
			local attackedCityY = attackedCity:GetY()
			local unitID = GetStrongestMilitaryUnit(playerBarbarian, true, "UNITCOMBAT_MOUNTED")
			revoltingCity:ChangeResistanceTurns(2)
			if unitID then
				playerBarbarian:InitUnit(unitID, attackedCityX, attackedCityY):JumpToNearestValidPlot()
				playerBarbarian:InitUnit(unitID, attackedCityX, attackedCityY):JumpToNearestValidPlot()
				playerBarbarian:InitUnit(unitID, attackedCityX, attackedCityY):JumpToNearestValidPlot()
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NOVGOROD_TREACHERY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NOVGOROD_TREACHERY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NOVGOROD_TREACHERY_2", player:GetName(), player:GetCivilizationShortDescription())) 
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Novgorod_Treachery", Event_JFD_Novgorod_Treachery)
--=======================================================================================================================
--=======================================================================================================================


