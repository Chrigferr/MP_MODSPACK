-- JFD_EnglandHenryVIIIDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's England (Henry VIII) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_IsUsingHistoricalReligions
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingHistoricalReligions()
	local historicalReligionsModID = "6010e6f6-918e-48b8-9332-d60783bd8fb5"
	local isUsingHistoricalReligions = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == historicalReligionsModID) then
	    isUsingHistoricalReligions = true
	    break
	  end
	end

	return isUsingHistoricalReligions
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
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
--------------------------------------------------------------------------------------------------------------------------
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
local civilisationID 				= GameInfoTypes["CIVILIZATION_JFD_HENRY_ENGLAND"]
local eraMedievalID 				= GameInfoTypes["ERA_MEDIEVAL"]
local isUsingHistoricalReligions	= JFD_IsUsingHistoricalReligions()
local isUsingPietyPrestige			= JFD_IsUsingPietyPrestige()
local mathCeil 						= math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- England (Henry VIII): Enact the Statute in Restraint of Appeals
-------------------------------------------------------------------------------------------------------------------------
local religionAnglicanismID			= GameInfoTypes["RELIGION_CHRISTIAN_ANGLICANISM"]
local religionProtestantismID		= GameInfoTypes["RELIGION_PROTESTANTISM"]
local policyRestraintOfAppealsID	= GameInfoTypes["POLICY_JFD_HENRY_APPEALS"]

local Decisions_EnglandHenryRestraintOfAppeals = {}
	Decisions_EnglandHenryRestraintOfAppeals.Name = "TXT_KEY_DECISIONS_JFD_ENGLAND_HENRY_RESTRAINT_OF_APPEALS"
	Decisions_EnglandHenryRestraintOfAppeals.Desc = "TXT_KEY_DECISIONS_JFD_ENGLAND_HENRY_RESTRAINT_OF_APPEALS_DESC"
	HookDecisionCivilizationIcon(Decisions_EnglandHenryRestraintOfAppeals, "CIVILIZATION_JFD_HENRY_ENGLAND")
	Decisions_EnglandHenryRestraintOfAppeals.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID	then return false, false end
		if (not player:GetCapitalCity())					then return false, false end
		
		local religionType = "the religion of your [ICON_CAPITAL] Capital"	
		if isUsingPietyPrestige then religionType = "your State Religion" end
		if load(player, "Decisions_EnglandHenryRestraintOfAppeals") == true then
			Decisions_EnglandHenryRestraintOfAppeals.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ENGLAND_HENRY_RESTRAINT_OF_APPEALS_ENACTED_DESC", religionType)
			return false, false, true 
		end
		
		local costType = "[ICON_PEACE] Faith"
		local cost = mathCeil(300 * iMod)
		local religionReq = "Capital must have a religion"
		if isUsingPietyPrestige then 
			religionReq = "Must have adopted a State Religion" 
			costType = "[ICON_JFD_PIETY] Piety"
			cost = mathCeil(40 * iMod)
		end
		Decisions_EnglandHenryRestraintOfAppeals.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ENGLAND_HENRY_RESTRAINT_OF_APPEALS_DESC", religionReq, cost, costType, religionType)
		
		local religionID = player:GetCapitalCity():GetReligiousMajority()
		if isUsingPietyPrestige then religionID = JFD_GetStateReligion(player:GetID()) end

		if player:GetReligionCreatedByPlayer() > 0					then return true, false end
		if player:GetCurrentEra() < eraMedievalID 					then return true, false end
		if religionID < 1											then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		
		if isUsingPietyPrestige and JFD_CalculatePietyRate(player:GetID()) < cost then 
			return true, false 
		else
			if player:GetFaith() < cost then return true, false end
		end

		return true, true
	end
	)
	
	Decisions_EnglandHenryRestraintOfAppeals.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cost = mathCeil(300 * iMod)
		if isUsingPietyPrestige then 
			cost = mathCeil(40 * iMod)
			JFD_ChangePiety(playerID, -cost)
		else
			player:ChangeFaith(-cost)
		end		
		player:ChangeNumResourceTotal(iMagistrate, -1)

		local religionID = player:GetCapitalCity():GetReligiousMajority()
		local religionToFoundID = religionProtestantismID
		if isUsingPietyPrestige	then religionID = JFD_GetStateReligion(playerID) end
		if (isUsingHistoricalReligions and (not Game.GetHolyCityForReligion(religionAnglicanismID, -1)))	then 
			religionToFoundID = religionAnglicanismID
		end

		if (religionToFoundID == religionProtestantismID and Game.GetHolyCityForReligion(religionProtestantismID, -1)) then
			local religions = {}
			local count = 1
			for religion in GameInfo.Religions() do
				if (not Game.GetHolyCityForReligion(religion.ID, -1)) then
					religions[count] = religion.ID
					count = count + 1
				end
			end

			religionToFoundID = religions[JFD_GetRandom(1, #religions)]
		end
		
		local belief1ID
		local belief2ID
		for _, beliefID in ipairs(Game.GetBeliefsInReligion(religionID)) do
			if GameInfo.Beliefs[beliefID].Founder	then belief1ID = beliefID end
			if GameInfo.Beliefs[beliefID].Follower	then belief2ID = beliefID end
		end
		
		Game.FoundReligion(playerID, religionToFoundID, nil, belief1ID, belief2ID, -1, -1, player:GetCapitalCity()) 
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyRestraintOfAppealsID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ENGLAND_HENRY_RESTRAINT_OF_APPEALS", player:GetCivilizationDescription())) 
		save(player, "Decisions_EnglandHenryRestraintOfAppeals", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_EnglandHenryRestraintOfAppeals", Decisions_EnglandHenryRestraintOfAppeals)
-------------------------------------------------------------------------------------------------------------------------
-- England (Henry VIII): Dissolve the Monasteries
-------------------------------------------------------------------------------------------------------------------------
local buildingMonasteryID = GameInfoTypes["BUILDING_MONASTERY"]

local Decisions_EnglandHenryDissolveMonasteries = {}
	Decisions_EnglandHenryDissolveMonasteries.Name = "TXT_KEY_DECISIONS_JFD_ENGLAND_HENRY_DISSOLVE_MONASTERIES"
	Decisions_EnglandHenryDissolveMonasteries.Desc = "TXT_KEY_DECISIONS_JFD_ENGLAND_HENRY_DISSOLVE_MONASTERIES_DESC"
	HookDecisionCivilizationIcon(Decisions_EnglandHenryDissolveMonasteries, "CIVILIZATION_JFD_HENRY_ENGLAND")
	Decisions_EnglandHenryDissolveMonasteries.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_EnglandHenryDissolveMonasteries") == true then
			Decisions_EnglandHenryDissolveMonasteries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ENGLAND_HENRY_DISSOLVE_MONASTERIES_ENACTED_DESC")
			return false, false, true
		end
		
		local numMonasteries = player:CountNumBuildings(buildingMonasteryID) + 1
		local reward = mathCeil((30 * iMod) * numMonasteries) + 100
		local rewardType = "[ICON_PEACE] Faith"
		if isUsingPietyPrestige then 
			rewardType = "[ICON_JFD_PIETY] Piety"
			reward = mathCeil((3 * iMod) * numMonasteries) + 17
		end
		local goldReward = mathCeil((65 * iMod) * numMonasteries) + 190
		Decisions_EnglandHenryDissolveMonasteries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ENGLAND_HENRY_DISSOLVE_MONASTERIES_DESC", reward, rewardType, goldReward)
		
		if (not load(player, "Decisions_EnglandHenryRestraintOfAppeals"))	then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 			then return true, false end
		if player:GetCurrentEra() < eraMedievalID 							then return true, false end
		
		return true, true
	end
	)
	
	Decisions_EnglandHenryDissolveMonasteries.DoFunc = (
	function(player)
		local numMonasteries = player:CountNumBuildings(buildingMonasteryID) + 1
		local reward = mathCeil((30 * iMod) * numMonasteries) + 100
		if isUsingPietyPrestige then 
			reward = mathCeil((3 * iMod) * numMonasteries) + 17
			JFD_ChangePiety(player:GetID(), reward)
		else
			player:ChangeFaith(reward)
		end
		local goldReward = mathCeil((65 * iMod) * numMonasteries) + 190
		player:ChangeGold(goldReward)
		player:ChangeNumResourceTotal(iMagistrate, -2)

		for city in player:Cities() do
			if city:IsHasBuilding(buildingMonasteryID) then
				city:SetNumRealBuilding(buildingMonasteryID, 0)
			end
		end
		save(player, "Decisions_EnglandHenryDissolveMonasteries", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_EnglandHenryDissolveMonasteries", Decisions_EnglandHenryDissolveMonasteries)
--=======================================================================================================================
--=======================================================================================================================
