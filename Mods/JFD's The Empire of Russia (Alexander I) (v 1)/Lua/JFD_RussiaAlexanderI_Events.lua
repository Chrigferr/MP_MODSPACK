-- JFD_RussiaAlexanderI_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Austria (Joseph II) Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingClaimsColonies
function JFD_IsUsingClaimsColonies()
	local claimsColoniesModID = "10e9728f-d61c-4317-be4f-7d52d6bae6f4"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == claimsColoniesModID) then
			return true
		end
	end
	return false
end
local isUsingClaimsColonies = JFD_IsUsingClaimsColonies()

-- JFD_IsUsingEnlightenmentEra
function JFD_IsUsingEnlightenmentEra()
	local enlightenmentEraID = "ce8aa614-7ef7-4a45-a179-5329869e8d6d"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == enlightenmentEraID) then
			return true
		end
	end
	return false
end
local isUsingEnlightenmentEra = JFD_IsUsingEnlightenmentEra()
--------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_RUSSIA_ALEXANDER_I"]
local eraEnlightenmentID = GameInfoTypes["ERA_ENLIGHTENMENT"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
--------------------------------------------------------------------------------------------------------------------------
-- Russia (Alexander I): Metternich
--------------------------------------------------------------------------------------------------------------------------
local unitGreatDignitaryID = GameInfoTypes["UNIT_JFD_GREAT_DIGNITARY"]
local unitGreatMerchantID = GameInfoTypes["UNIT_MERCHANT"]
local Event_JFD_RussiaAlexanderI_Metternich = {}
	Event_JFD_RussiaAlexanderI_Metternich.Name = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_METTERNICH"
	Event_JFD_RussiaAlexanderI_Metternich.Desc = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_METTERNICH_DESC"
	Event_JFD_RussiaAlexanderI_Metternich.EventImage = 'Event_RussiaAlexanderI_Metternich.dds'
	Event_JFD_RussiaAlexanderI_Metternich.Weight = 10
	Event_JFD_RussiaAlexanderI_Metternich.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_RussiaAlexanderI_Metternich") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			Event_JFD_RussiaAlexanderI_Metternich.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_METTERNICH_DESC")
			return true
		end
		)
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[1] = {}
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_METTERNICH_OUTCOME_1"
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_METTERNICH_OUTCOME_RESULT_1"
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[1].Weight = 5
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[1].CanFunc = (
		function(player)	
			local unitDesc = "Great Merchant"
			if (isUsingClaimsColonies and unitGreatDignitaryID) then
				unitDesc = "Great Dignitary"
			end		
			Event_JFD_RussiaAlexanderI_Metternich.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_METTERNICH_OUTCOME_RESULT_1", unitDesc)
			return true
		end
		)
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local unitID = unitGreatMerchantID
			if (isUsingClaimsColonies and unitGreatDignitaryID) then
				unitID = unitGreatDignitaryID
			end	
			player:InitUnit(unitID, capital:GetX(), capital:GetY())
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_ALEXANDER_I_METTERNICH_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_METTERNICH"))
			save(player, "Event_JFD_RussiaAlexanderI_Metternich", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[2] = {}
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_METTERNICH_OUTCOME_2"
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_METTERNICH_OUTCOME_RESULT_2"
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[2].Weight = 2
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFD_RussiaAlexanderI_Metternich.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_METTERNICH_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_RussiaAlexanderI_Metternich.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_ALEXANDER_I_METTERNICH_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_METTERNICH"))
			save(player, "Event_JFD_RussiaAlexanderI_Metternich", true)
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_RussiaAlexanderI_Metternich", Event_JFD_RussiaAlexanderI_Metternich)
--------------------------------------------------------------------------------------------------------------------------
--  Russia (Alexander I): Serfodom
--------------------------------------------------------------------------------------------------------------------------
local policySerfdomID = GameInfoTypes["POLICY_EVENTS_JFD_RUSSIA_ALEXANDER_I_SERFDOM"]
local unitSettlerID = GameInfoTypes["UNIT_SETTLER"]
local unitClassWorkerID = GameInfoTypes["UNITCLASS_WORKER"]
local Event_JFD_RussiaAlexanderI_Serfdom = {}
	Event_JFD_RussiaAlexanderI_Serfdom.Name = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM"
	Event_JFD_RussiaAlexanderI_Serfdom.Desc = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_DESC"
	Event_JFD_RussiaAlexanderI_Serfdom.EventImage = 'Event_RussiaAlexanderI_Serfdom.dds'
	Event_JFD_RussiaAlexanderI_Serfdom.Weight = 10
	Event_JFD_RussiaAlexanderI_Serfdom.CanFunc = (
		function(player)			
			if player:HasPolicy(policySerfdomID) then return false end
			if load(player, "Event_JFD_RussiaAlexanderI_Serfdom") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			local unitWorkerCount = player:GetUnitClassCount(unitClassWorkerID)
			if unitWorkerCount == 0 then return false end
			local goldCost = mathCeil((300*iMod)*unitWorkerCount)
			if player:GetGold() < goldCost then return false end
			return true
		end
		)
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[1] = {}
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_1"
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_RESULT_1"
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[1].Weight = 2
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policySerfdomID, true)
			for city in player:Cities() do
				if GetRandom(1,100) <= 35 then
					city:ChangeResistanceTurns(1)
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[2] = {}
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_2"
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_RESULT_2"
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[2].Weight = 5
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[2].CanFunc = (
		function(player)			
			local unitWorkerCount = player:GetUnitClassCount(unitClassWorkerID)
			local goldCost = mathCeil((300*iMod)*unitWorkerCount)
			Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_RESULT_2", goldCost)
			return true
		end
		)
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local unitWorkerCount = player:GetUnitClassCount(unitClassWorkerID)
			local goldCost = mathCeil((300*iMod)*unitWorkerCount)
			player:ChangeGold(-goldCost) 
			local unitID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_GUN")
			if unitID then
				for unit in player:Units() do
					if unit:GetUnitClassType() == unitClassWorkerID then
						local newUnit = player:InitUnit(unitID, unit:GetX(), unit:GetY())
						newUnit:Convert(unit)
					end
				end
			end
			if GetRandom(1,100) <= 10 then
				player:GetCapitalCity():ChangeResistanceTurns(2)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_RESULT_2_NOTIFICATION", cityList), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_2", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
			save(player, "Event_JFD_RussiaAlexanderI_Serfdom", true)
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[3] = {}
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_3"
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_RESULT_3"
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[3].Weight = 3
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[3].CanFunc = (
		function(player)			
			local unitWorkerCount = player:GetUnitClassCount(unitClassWorkerID)
			local goldCost = mathCeil((200*iMod)*unitWorkerCount)
			Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_RESULT_3", goldCost)
			return true
		end
		)
	Event_JFD_RussiaAlexanderI_Serfdom.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local unitWorkerCount = player:GetUnitClassCount(unitClassWorkerID)
			local goldCost = mathCeil((200*iMod)*unitWorkerCount)
			player:ChangeGold(-goldCost) 
			for unit in player:Units() do
				if unit:GetUnitClassType() == unitClassWorkerID then
					local newUnit = player:InitUnit(unitSettlerID, unit:GetX(), unit:GetY())
					newUnit:Convert(unit)
				end
			end
			if GetRandom(1,100) <= 25 then
				player:GetCapitalCity():ChangeResistanceTurns(2)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_ALEXANDER_I_SERFDOM_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_ALEXANDER_I_SERFDOM_3", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
			save(player, "Event_JFD_RussiaAlexanderI_Serfdom", true)
		end)
		
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_RussiaAlexanderI_Serfdom", Event_JFD_RussiaAlexanderI_Serfdom)
--=======================================================================================================================
--=======================================================================================================================


