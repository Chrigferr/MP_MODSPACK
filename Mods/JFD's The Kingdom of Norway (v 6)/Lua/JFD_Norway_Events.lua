-- JFD_Norway_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Norway Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingPiety
function JFD_IsUsingPiety()
	local pietyModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == pietyModID) then
			return true
		end
	end
	return false
end
local isUsingPiety = JFD_IsUsingPiety()
------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
------------------------------------------------------------------------------------------------------------------------
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_NORWAY"]
local mathCeil	= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Norway: Bagli Pretender
--------------------------------------------------------------------------------------------------------------------------
local eraMedievalID		= GameInfoTypes["ERA_MEDIEVAL"]
local playerBarbarianID = Players[63]
local unitBirkebeinerID = GameInfoTypes["UNIT_JFD_BIRKEBEINER"]
local unitSwordsmanID	= GameInfoTypes["UNIT_SWORDSMAN"]
local Event_JFD_Norway_Bagli = {}
	Event_JFD_Norway_Bagli.Name = "TXT_KEY_EVENT_JFD_NORWAY_BAGLI"
	Event_JFD_Norway_Bagli.Desc = "TXT_KEY_EVENT_JFD_NORWAY_BAGLI_DESC"
	Event_JFD_Norway_Bagli.EventImage = 'Event_Norway_Bagli.dds'
	Event_JFD_Norway_Bagli.Weight = 5
	Event_JFD_Norway_Bagli.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() ~= eraMedievalID then return false end
			return true
		end
		)
	Event_JFD_Norway_Bagli.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Norway_Bagli.Outcomes[1] = {}
	Event_JFD_Norway_Bagli.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NORWAY_BAGLI_OUTCOME_1"
	Event_JFD_Norway_Bagli.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NORWAY_BAGLI_OUTCOME_RESULT_1"
	Event_JFD_Norway_Bagli.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_Norway_Bagli.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORWAY_BAGLI_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_Norway_Bagli.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local capitalX = capital:GetX()
			local capitalY = capital:GetY()
			local plotX = capitalX + GetRandom(1,2)
			local plotY = capitalY + GetRandom(1,2)
			playerBarbarianID:InitUnit(unitSwordsmanID, plotX, plotY):JumpToNearestValidPlot()
			playerBarbarianID:InitUnit(unitSwordsmanID, plotX, plotY):JumpToNearestValidPlot()
			playerBarbarianID:InitUnit(unitSwordsmanID, plotX, plotY):JumpToNearestValidPlot()
			player:InitUnit(unitBirkebeinerID, capitalX, capitalY):JumpToNearestValidPlot()
			player:InitUnit(unitBirkebeinerID, capitalX, capitalY):JumpToNearestValidPlot()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NORWAY_BAGLI_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORWAY_BAGLI"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NORWAY_BAGLI", player:GetCivilizationShortDescription(), player:GetName())) 
		end)
		
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Norway_Bagli", Event_JFD_Norway_Bagli)	
--------------------------------------------------------------------------------------------------------------------------
-- Norway: Rex Perpetuus Norvegiae
--------------------------------------------------------------------------------------------------------------------------
local policyEternalKingID = GameInfoTypes["POLICY_EVENTS_JFD_ETERNAL_KING"]
local Event_JFD_Norway_EternalKing = {}
	Event_JFD_Norway_EternalKing.Name = "TXT_KEY_EVENT_JFD_NORWAY_ETERNAL_KING"
	Event_JFD_Norway_EternalKing.Desc = "TXT_KEY_EVENT_JFD_NORWAY_ETERNAL_KING_DESC"
	Event_JFD_Norway_EternalKing.EventImage = 'Event_Norway_EternalKing.dds'
	Event_JFD_Norway_EternalKing.Weight = 10
	Event_JFD_Norway_EternalKing.CanFunc = (
		function(player)			
			if player:HasPolicy(policyEternalKingID) then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			local religionID = player:GetReligionCreatedByPlayer()
			if religionID <= 0 then religionID = player:GetCapitalCity():GetReligiousMajority() end
			if isUsingPiety then 
				if (not player:HasStateReligion()) then return false end
				religionID = player:GetStateReligion() 
			end
			if religionID <= 0 then return false end
			if GetReligiousUnity(player, religionID) < 0.7 then return false end
			Event_JFD_Norway_EternalKing.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORWAY_ETERNAL_KING_DESC", Game.GetReligionName(religionID))
			return true
		end
		)
	Event_JFD_Norway_EternalKing.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Norway_EternalKing.Outcomes[1] = {}
	Event_JFD_Norway_EternalKing.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NORWAY_ETERNAL_KING_OUTCOME_1"
	Event_JFD_Norway_EternalKing.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NORWAY_ETERNAL_KING_OUTCOME_RESULT_1"
	Event_JFD_Norway_EternalKing.Outcomes[1].CanFunc = (
		function(player)			
			local yieldReward = mathCeil(200*iMod)
			local yieldRewardType = "[ICON_PEACE] Faith"
			if isUsingPiety then
				reward = mathCeil(30*iMod)
				yieldRewardType = "[ICON_JFD_PIETY] Piety"
			end
			Event_JFD_Norway_EternalKing.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORWAY_ETERNAL_KING_OUTCOME_RESULT_1", yieldReward, yieldRewardType)
			return true
		end
		)
	Event_JFD_Norway_EternalKing.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local yieldReward = mathCeil(200*iMod)
			if isUsingPiety then
				reward = mathCeil(30*iMod)
				player:ChangePiety(yieldReward)
			else
				player:ChangeFaith(yieldReward)
			end
			PreGame.SetLeaderName(playerID, "TXT_KEY_JFD_NORWAY_THE_HOLY_ENACTED")
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NORWAY_ETERNAL_KING_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORWAY_ETERNAL_KING"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NORWAY_ETERNAL_KING")) 
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyEternalKingID, true)
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Norway_EternalKing", Event_JFD_Norway_EternalKing)
--=======================================================================================================================
--=======================================================================================================================


