-- JFD_PapalStates_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Papal States Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandomCity
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandomCity(player)
	local randomCity = JFD_GetRandom(1, player:GetNumCities())
	local cityCount = 0
	for city in player:Cities() do
		cityCount = cityCount + 1

		if cityCount == randomCity then
		    return city
		end
		
		return nil
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingPietyPrestige
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingPietyPrestige()
	local pietyPrestigeModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	local isUsingPiety = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == pietyPrestigeModID) then
	    isUsingPiety = true
	    break
	  end
	end

	return isUsingPiety
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
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_PAPAL_STATES"]
local eraRenaissanceID		= GameInfoTypes["ERA_RENAISSANCE"] 
local isUsingPietyPrestige	= JFD_IsUsingPietyPrestige()
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Banquet of Chestnuts
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDPapalStatesChestnuts = {}
	Event_JFDPapalStatesChestnuts.Name = "TXT_KEY_EVENT_JFD_PAPAL_STATES_BANQUET_CHESTNUTS"
	Event_JFDPapalStatesChestnuts.Desc = "TXT_KEY_EVENT_JFD_PAPAL_STATES_BANQUET_CHESTNUTS_DESC"
	Event_JFDPapalStatesChestnuts.CanFunc = (
		function(player)			
			if load(player, "Event_JFDPapalStatesChestnuts") == true	then return false end
			if player:GetCivilizationType() ~= civilisationID			then return false end
			if player:GetReligionCreatedByPlayer() <= 0					then return false end

			local goldCost = mathCeil(300 * iMod)
			if player:GetGold() < goldCost then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end

			Event_JFDPapalStatesChestnuts.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAPAL_STATES_BANQUET_CHESTNUTS_DESC")
			return true
		end
		)
	Event_JFDPapalStatesChestnuts.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDPapalStatesChestnuts.Outcomes[1] = {}
	Event_JFDPapalStatesChestnuts.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_PAPAL_STATES_BANQUET_CHESTNUTS_OUTCOME_1"
	Event_JFDPapalStatesChestnuts.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_PAPAL_STATES_BANQUET_CHESTNUTS_OUTCOME_RESULT_1"
	Event_JFDPapalStatesChestnuts.Outcomes[1].CanFunc = (
		function(player)		
			local goldCost = mathCeil(300 * iMod)
			local goldenAgeReward = mathCeil(200 * iMod)
			Event_JFDPapalStatesChestnuts.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAPAL_STATES_BANQUET_CHESTNUTS_OUTCOME_RESULT_1", goldCost, goldenAgeReward)
			return true
		end
		)
	Event_JFDPapalStatesChestnuts.Outcomes[1].DoFunc = (
		function(player) 
			local goldCost = mathCeil(300 * iMod)
			local goldenAgeReward = mathCeil(200 * iMod)
			player:ChangeGold(-goldCost)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PAPAL_STATES_BANQUET_CHESTNUTS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAPAL_STATES_BANQUET_CHESTNUTS"))
			save(player, "Event_JFDPapalStatesChestnuts", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDPapalStatesChestnuts.Outcomes[2] = {}
	Event_JFDPapalStatesChestnuts.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_PAPAL_STATES_BANQUET_CHESTNUTS_OUTCOME_2"
	Event_JFDPapalStatesChestnuts.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_PAPAL_STATES_BANQUET_CHESTNUTS_OUTCOME_RESULT_2"
	Event_JFDPapalStatesChestnuts.Outcomes[2].CanFunc = (
		function(player)
			local faithReward = mathCeil(30 * iMod)
			Event_JFDPapalStatesChestnuts.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAPAL_STATES_BANQUET_CHESTNUTS_OUTCOME_RESULT_2", faithReward)
			return true
		end
		)
	Event_JFDPapalStatesChestnuts.Outcomes[2].DoFunc = (
		function(player) 
			local faithReward = mathCeil(30 * iMod)
			player:ChangeFaith(faithReward)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PAPAL_STATES_BANQUET_CHESTNUTS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAPAL_STATES_BANQUET_CHESTNUTS"))
			save(player, "Event_JFDPapalStatesChestnuts", true)
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDPapalStatesChestnuts", Event_JFDPapalStatesChestnuts)
Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDPapalStatesChestnuts", Event_JFDPapalStatesChestnuts, 1501, true)
--------------------------------------------------------------------------------------------------------------------------
-- Inquisition
--------------------------------------------------------------------------------------------------------------------------
local city

local Event_JFDPapalStatesInquisition = {}
	Event_JFDPapalStatesInquisition.Name = "TXT_KEY_EVENT_JFD_PAPAL_STATES_INQUSITION"
	Event_JFDPapalStatesInquisition.Desc = "TXT_KEY_EVENT_JFD_PAPAL_STATES_INQUSITION_DESC"
	Event_JFDPapalStatesInquisition.Weight = 10
	Event_JFDPapalStatesInquisition.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID			then return false end
			if player:GetReligionCreatedByPlayer() <= 0					then return false end

			local goldCost = mathCeil(103 * iMod)
			if player:GetGold() < goldCost then return false end
				
			city = JFD_GetRandomCity(player)
			if (not city) then return false end
			Event_JFDPapalStatesInquisition.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAPAL_STATES_INQUSITION_DESC", city:GetName())
			
			return true
		end
		)
	Event_JFDPapalStatesInquisition.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDPapalStatesInquisition.Outcomes[1] = {}
	Event_JFDPapalStatesInquisition.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_PAPAL_STATES_INQUSITION_OUTCOME_1"
	Event_JFDPapalStatesInquisition.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_PAPAL_STATES_INQUSITION_OUTCOME_RESULT_1"
	Event_JFDPapalStatesInquisition.Outcomes[1].CanFunc = (
		function(player)
			Event_JFDPapalStatesInquisition.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAPAL_STATES_INQUSITION_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDPapalStatesInquisition.Outcomes[1].DoFunc = (
		function(player) 
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PAPAL_STATES_INQUSITION_OUTCOME_RESULT_1_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAPAL_STATES_INQUSITION"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDPapalStatesInquisition.Outcomes[2] = {}
	Event_JFDPapalStatesInquisition.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_PAPAL_STATES_INQUSITION_OUTCOME_2"
	Event_JFDPapalStatesInquisition.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_PAPAL_STATES_INQUSITION_OUTCOME_RESULT_2"
	Event_JFDPapalStatesInquisition.Outcomes[2].CanFunc = (
		function(player)		
			local goldCost = mathCeil(103 * iMod)
			local reward = mathCeil(34 * iMod)
			local rewardYieldType = "[ICON_PEACE] Faith"
			if isUsingPietyPrestige then
				if JFD_HasStateReligion(player:GetID()) then
					reward = mathCeil(13 * iMod)
					rewardYieldType = "[ICON_JFD_PIETY] Piety"
				end
			end

			if player:GetGold() < goldCost then return false end
			Event_JFDPapalStatesInquisition.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAPAL_STATES_INQUSITION_OUTCOME_RESULT_2", goldCost, city:GetName(), Game.GetReligionName(player:GetReligionCreatedByPlayer()), reward, rewardYieldType)
			return true
		end
		)
	Event_JFDPapalStatesInquisition.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(103 * iMod)
			local reward = mathCeil(34 * iMod)
			player:ChangeGold(-goldCost)
			if isUsingPietyPrestige then
				if JFD_HasStateReligion(playerID) then
					reward = mathCeil(13 * iMod)
					JFD_ChangePiety(playerID, reward)
				end
			else
				player:ChangeFaith(reward)
			end
			city:AdoptReligionFully(player:GetReligionCreatedByPlayer())
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PAPAL_STATES_INQUSITION_OUTCOME_RESULT_2_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAPAL_STATES_INQUSITION"))
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDPapalStatesInquisition", Event_JFDPapalStatesInquisition)
--=======================================================================================================================
--=======================================================================================================================


