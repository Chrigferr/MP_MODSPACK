-- JFD_JFD_FranceNapoleon_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's France (Napoleon) Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_FRANCE_NAPOLEON"]
local eraRenaissanceID	= GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Vendee Rebellion
--------------------------------------------------------------------------------------------------------------------------
local city = nil
local eraModernID	= GameInfoTypes["ERA_MODERN"]
local playerBarbarian = Players[63]
local Event_JFD_FranceNapoleon_Vendee = {}
	Event_JFD_FranceNapoleon_Vendee.Name = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_VENDEE"
	Event_JFD_FranceNapoleon_Vendee.Desc = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_VENDEE_DESC"
	Event_JFD_FranceNapoleon_Vendee.EventImage = 'Event_France_Vendee.dds'
	Event_JFD_FranceNapoleon_Vendee.Weight = 5
	Event_JFD_FranceNapoleon_Vendee.CanFunc = (
		function(player)			
			if player:GetCurrentEra() < eraRenaissanceID  then return false end
			if player:GetCurrentEra() > eraModernID  then return false end
			if (not player:IsEmpireUnhappy()) then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				if (not city:IsCapital()) then
					cities[count] = city
					count = count + 1
				end
			end
			city = cities[GetRandom(1, #cities)]	
			if (not city) then return false end
			Event_JFD_FranceNapoleon_Vendee.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_VENDEE_DESC", city:GetName())
			return true
		end
		)
	Event_JFD_FranceNapoleon_Vendee.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_FranceNapoleon_Vendee.Outcomes[1] = {}
	Event_JFD_FranceNapoleon_Vendee.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_VENDEE_OUTCOME_1"
	Event_JFD_FranceNapoleon_Vendee.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_VENDEE_OUTCOME_RESULT_1"
	Event_JFD_FranceNapoleon_Vendee.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_FranceNapoleon_Vendee.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_VENDEE_OUTCOME_RESULT_1", city:GetName())
			return true
		end
		)
	Event_JFD_FranceNapoleon_Vendee.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local unitToSpawnID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_GUN", "UNITCOMBAT_MOUNTED")
			if unitToSpawnID then
				local capital = player:GetCapitalCity()
				playerBarbarian:AcquireCity(city, true)
				playerBarbarian:InitUnit(unitToSpawnID, city:GetX(), city:GetY()):SetName("Royalist")
				player:InitUnit(unitToSpawnID, capital:GetX(), capital:GetY()):JumpToNearestValidPlot()
				player:InitUnit(unitToSpawnID, capital:GetX(), capital:GetY()):JumpToNearestValidPlot()
				player:InitUnit(unitToSpawnID, capital:GetX(), capital:GetY()):JumpToNearestValidPlot()

				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_NAPOLEON_VENDEE_OUTCOME_RESULT_1_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_VENDEE"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_FRANCE_NAPOLEON_VENDEE", city:GetName(), player:GetName())) 
			end
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_FranceNapoleon_Vendee", Event_JFD_FranceNapoleon_Vendee)		
--------------------------------------------------------------------------------------------------------------------------
-- Turncoat Diplomat
--------------------------------------------------------------------------------------------------------------------------
local policyMinister1ID = GameInfoTypes["POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_1"]
local policyMinister2ID = GameInfoTypes["POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_2"]
local policyMinister3ID = GameInfoTypes["POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_3"]
local policyMinister4ID = GameInfoTypes["POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_4"]
local policyMinisters = {policyMinister1ID, policyMinister2ID, policyMinister3ID, policyMinister4ID}
local Event_JFD_FranceNapoleon_ForeignAffairs = {}
	Event_JFD_FranceNapoleon_ForeignAffairs.Name = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS"
	Event_JFD_FranceNapoleon_ForeignAffairs.Desc = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_DESC"
	Event_JFD_FranceNapoleon_ForeignAffairs.EventImage = 'Event_France_ForeignAffairs.dds'
	Event_JFD_FranceNapoleon_ForeignAffairs.Weight = 5
	Event_JFD_FranceNapoleon_ForeignAffairs.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID  then return false end
			for _, policyID in pairs(policyMinisters) do
				if player:HasPolicy(policyID) then return false end
			end
			local leaders = {}
			local count = 1
			for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
				if (player:GetID() ~= otherPlayerID and (not player:IsBarbarian())) then 
					local otherPlayer = Players[otherPlayerID]
					local playerTeam = Teams[player:GetTeam()]
					if playerTeam:IsHasMet(otherPlayer:GetTeam()) then
						leaders[count] = otherPlayer
						count = count + 1
					end
				end
			end
			local leader = leaders[GetRandom(1, #leaders)]	
			if leader == nil then return false end
			Event_JFD_FranceNapoleon_ForeignAffairs.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_DESC", leader:GetName())
			return true
		end
		)
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[1] = {}
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_1"
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_1"
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyMinister1ID, true)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[2] = {}
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_2"
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_2"
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyMinister2ID, true)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[3] = {}
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_3"
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_3"
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyMinister3ID, true)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS"))
		end)
	--=========================================================
	-- Outcome 4
	--=========================================================
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[4] = {}
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[4].Name = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_4"
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[4].Desc = "TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_4"
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[4].CanFunc = (
		function(player)			
			Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[4].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_4")
			return true
		end
		)
	Event_JFD_FranceNapoleon_ForeignAffairs.Outcomes[4].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyMinister4ID, true)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_RESULT_4_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS"))
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_FranceNapoleon_ForeignAffairs", Event_JFD_FranceNapoleon_ForeignAffairs)
--=======================================================================================================================
--=======================================================================================================================


