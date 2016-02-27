-- JFD_UnitedKingdom_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's United Kingdom Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetNumFriendships
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumFriendships(playerID)
	local player = Players[playerID]
	local numFriendships = 0
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		if iPlayer ~= playerID and Players[iPlayer]:IsDoF(playerID) then
			numFriendships = numFriendships + 1
		end
	end

	return numFriendships
end
--------------------------------------------------------------------------------------------------------------------------
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
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_UNITED_KINGDOM"]
local mathCeil = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- United Kingdom: Address the British Nation
-------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID		= GameInfoTypes["ERA_INDUSTRIAL"]
local policyAddressNationID = GameInfoTypes["POLICY_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION"]

local Decisions_AddressBritishNation = {}
	Decisions_AddressBritishNation.Name = "TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION"
	Decisions_AddressBritishNation.Desc = "TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION_DESC"
	HookDecisionCivilizationIcon(Decisions_AddressBritishNation, "CIVILIZATION_JFD_UNITED_KINGDOM")
	Decisions_AddressBritishNation.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		
		local era = load(player, "Decisions_AddressBritishNation")
		local currentEra = player:GetCurrentEra()
		if era ~= nil then
			if era < currentEra then
				save(player, "Decisions_AddressBritishNation", nil)
			else
				Decisions_AddressBritishNation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local cultureCost = mathCeil(200 * iMod)
		Decisions_AddressBritishNation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION_DESC", cultureCost)
		
		if player:GetJONSCulture() < cultureCost 				 then return true, false end
		if currentEra < eraIndustrialID 				 		 then return true, false end
		if Teams[player:GetTeam()]:GetAtWarCount(true) == 0		then return true, false end
		
		return true, true
	end
	)
	
	Decisions_AddressBritishNation.DoFunc = (
	function(player)
		local cultureCost = mathCeil(200 * iMod)
		player:ChangeJONSCulture(-cultureCost)
		if player:HasPolicy(policyAddressNationID) then
			player:SetHasPolicy(policyAddressNationID, false)
		end
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyAddressNationID, true)
		save(player, "Decisions_AddressBritishNation", player:GetCurrentEra())
		if player:IsHuman() then Events.AudioPlay2DSound("AS2D_LEADER_MUSIC_JFD_CHURCHILL_SPEECH") end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_AddressBritishNation", Decisions_AddressBritishNation)
-------------------------------------------------------------------------------------------------------------------------
-- United Kingdom: Special Relationship
-------------------------------------------------------------------------------------------------------------------------
local buildingSpecialRelationshipID = GameInfoTypes["BUILDING_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP"]
local eraMedievalID					= GameInfoTypes["ERA_MEDIEVAL"]
local policySpecialRelationshipID	= GameInfoTypes["POLICY_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP"]

local Decisions_SpecialRelationship = {}
	Decisions_SpecialRelationship.Name = "TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP"
	Decisions_SpecialRelationship.Desc = "TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP_DESC"
	HookDecisionCivilizationIcon(Decisions_SpecialRelationship, "CIVILIZATION_JFD_UNITED_KINGDOM")
	Decisions_SpecialRelationship.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_SpecialRelationship") == true then
			Decisions_SpecialRelationship.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(400 * iMod)
		Decisions_SpecialRelationship.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if JFD_GetNumFriendships(player:GetID()) < 1 				then return true, false end
		if player:GetCurrentEra() < eraMedievalID					then return true, false	end
		
		return true, true
	end
	)
	
	Decisions_SpecialRelationship.DoFunc = (
	function(player)
		local goldCost = mathCeil(400 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policySpecialRelationshipID, true)
		player:GetCapitalCity():SetNumRealBuilding(buildingSpecialRelationshipID, 1)
		save(player, "Decisions_SpecialRelationship", true)
	end
	)
	
	Decisions_SpecialRelationship.Monitors = {}
	Decisions_SpecialRelationship.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilisationID then return end
		if load(player, "Decisions_SpecialRelationship") == true then
			local capital = player:GetCapitalCity()
			if JFD_GetNumFriendships(playerID) > 0 then
				if not capital:IsHasBuilding(buildingSpecialRelationshipID) then
					capital:SetNumRealBuilding(buildingSpecialRelationshipID, 1)
				end
			else
				if capital:IsHasBuilding(buildingSpecialRelationshipID) then
					capital:SetNumRealBuilding(buildingSpecialRelationshipID, 0)
				end
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(civilisationID, "Decisions_SpecialRelationship", Decisions_SpecialRelationship)
--=======================================================================================================================
--=======================================================================================================================