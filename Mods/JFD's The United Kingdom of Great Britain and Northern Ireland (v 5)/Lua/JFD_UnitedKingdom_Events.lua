-- JFD_UnitedKingdom_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's United Kingdom Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_CountNumGreatAdmirals
------------------------------------------------------------------------------------------------------------------------
local unitGreatAdmiralID = GameInfoTypes["UNIT_GREAT_ADMIRAL"]
function JFD_CountNumGreatAdmirals(playerID)
	local numGreatAdmirals = 0
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:GetUnitType() == unitGreatAdmiralID then
			numGreatAdmirals = numGreatAdmirals + 1
		end
	end

	return numGreatAdmirals
end
------------------------------------------------------------------------------------------------------------------------
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_UNITED_KINGDOM"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Anti-Imperialists
--------------------------------------------------------------------------------------------------------------------------
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local unitSettlerID = GameInfoTypes["UNIT_SETTLER"]

local Event_JFDUnitedKingdomAntiImperialism = {}
	Event_JFDUnitedKingdomAntiImperialism.Name = "TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS"
	Event_JFDUnitedKingdomAntiImperialism.Desc = "TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS_DESC"
	Event_JFDUnitedKingdomAntiImperialism.Weight = 5
	Event_JFDUnitedKingdomAntiImperialism.CanFunc = (
		function(player)			
			if load(player, "Event_JFDUnitedKingdomAntiImperialism") == true	then return false end
			if player:GetCivilizationType() ~= civilisationID					then return false end
			if player:GetCurrentEra() < eraMedievalID							then return false end
			if player:GetNumCities() < 6										then return false end
			
			Event_JFDUnitedKingdomAntiImperialism.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS_DESC")
			return true
		end
		)
	Event_JFDUnitedKingdomAntiImperialism.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDUnitedKingdomAntiImperialism.Outcomes[1] = {}
	Event_JFDUnitedKingdomAntiImperialism.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS_OUTCOME_1"
	Event_JFDUnitedKingdomAntiImperialism.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS_OUTCOME_RESULT_1"
	Event_JFDUnitedKingdomAntiImperialism.Outcomes[1].CanFunc = (
		function(player)
			Event_JFDUnitedKingdomAntiImperialism.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDUnitedKingdomAntiImperialism.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			player:InitUnit(unitSettlerID, capitalX, capitalY):JumpToNearestValidPlot()
			player:InitUnit(unitSettlerID, capitalX, capitalY):JumpToNearestValidPlot()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_UNITED_KINGDOM_ANTI_IMPERIALISTS_1"))
			save(player, "Event_JFDUnitedKingdomAntiImperialism", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDUnitedKingdomAntiImperialism.Outcomes[2] = {}
	Event_JFDUnitedKingdomAntiImperialism.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS_OUTCOME_2"
	Event_JFDUnitedKingdomAntiImperialism.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS_OUTCOME_RESULT_2"
	Event_JFDUnitedKingdomAntiImperialism.Outcomes[2].CanFunc = (
		function(player)	
			local cultureReward = mathCeil(60 * iMod)
			Event_JFDUnitedKingdomAntiImperialism.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS_OUTCOME_RESULT_2", cultureReward)
			return true
		end
		)
	Event_JFDUnitedKingdomAntiImperialism.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = mathCeil(60 * iMod)
			player:ChangeJONSCulture(cultureReward)
			player:ChangeGoldenAgeTurns(12)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ANTI_IMPERIALISTS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_UNITED_KINGDOM_ANTI_IMPERIALISTS_2"))
			save(player, "Event_JFDUnitedKingdomAntiImperialism", true)
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDUnitedKingdomAntiImperialism", Event_JFDUnitedKingdomAntiImperialism)
--------------------------------------------------------------------------------------------------------------------------
--  First Lord of the Admiralty
--------------------------------------------------------------------------------------------------------------------------
local unitPromotionMedicID		= GameInfoTypes["PROMOTION_MEDIC"]
local unitPromotionExtraSightID = GameInfoTypes["PROMOTION_EXTRA_SIGHT_I"]

local Event_JFDUnitedKingdomFirstLordAdmiralty = {}
	Event_JFDUnitedKingdomFirstLordAdmiralty.Name = "TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ADMIRALTY"
	Event_JFDUnitedKingdomFirstLordAdmiralty.Desc = "TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ADMIRALTY_DESC"
	Event_JFDUnitedKingdomFirstLordAdmiralty.Weight = 5
	Event_JFDUnitedKingdomFirstLordAdmiralty.CanFunc = (
		function(player)			
			if load(player, "Event_JFDUnitedKingdomFirstLordAdmiralty") == true then return false end
			if player:GetCivilizationType() ~= civilisationID 					then return false end
			if JFD_CountNumGreatAdmirals(player:GetID()) < 3					then return false end

			Event_JFDUnitedKingdomFirstLordAdmiralty.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ADMIRALTY_DESC")
			return true
		end
		)
	Event_JFDUnitedKingdomFirstLordAdmiralty.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDUnitedKingdomFirstLordAdmiralty.Outcomes[1] = {}
	Event_JFDUnitedKingdomFirstLordAdmiralty.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ADMIRALTY_OUTCOME_1"
	Event_JFDUnitedKingdomFirstLordAdmiralty.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ADMIRALTY_OUTCOME_RESULT_1"
	Event_JFDUnitedKingdomFirstLordAdmiralty.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDUnitedKingdomFirstLordAdmiralty.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ADMIRALTY_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDUnitedKingdomFirstLordAdmiralty.Outcomes[1].DoFunc = (
		function(player) 
			for unit in player:Units() do
				if unit:GetUnitType() == unitGreatAdmiralID then
					unit:SetHasPromotion(unitPromotionMedicID, true) 
					unit:SetHasPromotion(unitPromotionExtraSightID, true) 
				end
			end
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_UNITED_KINGDOM_ADMIRALTY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_UNITED_KINGDOM_ADMIRALTY"))
			save(player, "Event_JFDUnitedKingdomFirstLordAdmiralty", true)
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDUnitedKingdomFirstLordAdmiralty", Event_JFDUnitedKingdomFirstLordAdmiralty)
--=======================================================================================================================
--=======================================================================================================================


