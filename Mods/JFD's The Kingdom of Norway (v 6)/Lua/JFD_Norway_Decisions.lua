-- JFD_Norway_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Norway Decisions: loaded")
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
-------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetNumPaganCitizens
function JFD_GetNumPaganCitizens(playerID) 
	local player = Players[playerID]
	local numPagans = 0 
	for city in player:Cities() do
		numPagans = numPagans + city:GetNumFollowers(religionPantheonID)
	end
	return numPagans
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
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_NORWAY"]
local mathCeil = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Norway: Root out Paganism
-------------------------------------------------------------------------------------------------------------------------
local religionPantheonID = GameInfoTypes["RELIGION_PANTHEON"]
local Decisions_Norway_RootOutPaganism = {}
	Decisions_Norway_RootOutPaganism.Name = "TXT_KEY_DECISIONS_JFD_NORWAY_ROOT_OUT_PAGANISM"
	Decisions_Norway_RootOutPaganism.Desc = "TXT_KEY_DECISIONS_JFD_NORWAY_ROOT_OUT_PAGANISM_DESC"
	HookDecisionCivilizationIcon(Decisions_Norway_RootOutPaganism, "CIVILIZATION_JFD_NORWAY")
	Decisions_Norway_RootOutPaganism.CanFunc = (
	function(player)		
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		local numPagans = JFD_GetNumPaganCitizens(player:GetID())+5
		local religionType = "majority religion"
		local yieldReward = 0
		local yieldRewardType = "[ICON_PEACE] Faith"
		if isUsingPiety then
			religionType = "State Religion"
			yieldRewardType = "[ICON_JFD_PIETY] Piety"
		end
		if load(player, "Decisions_Norway_RootOutPaganism") == true then
			Decisions_Norway_RootOutPaganism.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NORWAY_ROOT_OUT_PAGANISM_ENACTED_DESC", religionType, yieldRewardType)
			return false, false, true
		end
		local cultureCost = mathCeil((6*iMod)*numPagans)
		yieldReward = mathCeil((10*iMod)*numPagans)
		if isUsingPiety then
			yieldReward = mathCeil((2*iMod)*numPagans)
		end
		Decisions_Norway_RootOutPaganism.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NORWAY_ROOT_OUT_PAGANISM_DESC", religionType, cultureCost, yieldReward, yieldRewardType)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1	then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
		if isUsingPiety then
			if (not player:HasStateReligion()) then return true, false end
		else
			if (not GetPlayerMajorityReligion(player)) then return true, false end
		end
		return true, true
	end
	)
	
	Decisions_Norway_RootOutPaganism.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local numPagans = JFD_GetNumPaganCitizens(player:GetID())+5
		local cultureCost = mathCeil((6*iMod)*numPagans)
		player:ChangeJONSCulture(-cultureCost)
		local yieldReward = mathCeil((10*iMod)*numPagans)
		local religionID = GetPlayerMajorityReligion(player)
		if isUsingPiety then
			religionID = player:GetStateReligion()
			yieldReward = mathCeil((2*iMod)*numPagans)
			player:ChangePiety(yieldReward)
		else
			player:ChangeFaith(yieldReward)
		end			
		for city in player:Cities() do
			city:ConvertPercentFollowers(religionID, religionPantheonID, 100)
		end
		player:ChangeNumResourceTotal(iMagistrate, -1)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NORWAY_ROOT_OUT_PAGANISM", player:GetName(), player:GetCivilizationShortDescription())) 
		save(player, "Decisions_Norway_RootOutPaganism", true)
	end
	)

Decisions_AddCivilisationSpecific(civilisationID, "Decisions_Norway_RootOutPaganism", Decisions_Norway_RootOutPaganism)
-------------------------------------------------------------------------------------------------------------------------
-- Norway: Fund Seafaring Expeditions
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local promotionAllWaterEmbarkID	= GameInfoTypes["PROMOTION_ALLWATER_EMBARKATION"]
local techOpticsID	 = GameInfoTypes["TECH_OPTICS"]
local unitLongboatID = GameInfoTypes["UNIT_JFD_LONGBOAT"]
local unitSettlerID	 = GameInfoTypes["UNIT_SETTLER"]
local Decisions_FundSeafaringExpeditions = {}
	Decisions_FundSeafaringExpeditions.Name = "TXT_KEY_DECISIONS_JFD_NORWAY_EXPEDITIONS"
	Decisions_FundSeafaringExpeditions.Desc = "TXT_KEY_DECISIONS_JFD_NORWAY_EXPEDITIONS_DESC"
	HookDecisionCivilizationIcon(Decisions_FundSeafaringExpeditions, "CIVILIZATION_JFD_NORWAY")
	Decisions_FundSeafaringExpeditions.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if player:GetCurrentEra() >= eraRenaissanceID  then 
			Decisions_FundSeafaringExpeditions.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NORWAY_EXPEDITIONS_ENACTED_DESC")
			return false, false, true
		end
		local eraID = load(player, "Decisions_FundSeafaringExpeditions")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_FundSeafaringExpeditions", nil)
			else
				Decisions_FundSeafaringExpeditions.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NORWAY_EXPEDITIONS_ENACTED_DESC")
				return false, false, true
			end
		end
		local goldCost = mathCeil(500*iMod)
		Decisions_FundSeafaringExpeditions.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NORWAY_EXPEDITIONS_DESC", goldCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techOpticsID)) then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_FundSeafaringExpeditions.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(500*iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		local capital = player:GetCapitalCity()
		local capitalX = capital:GetX()
		local capitalY = capital:GetY()
		player:InitUnit(unitLongboatID, capitalX, capitalY)
		player:InitUnit(unitLongboatID, capitalX, capitalY)
		player:InitUnit(unitSettlerID, capitalX, capitalY):SetHasPromotion(promotionAllWaterEmbarkID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NORWAY_EXPEDITIONS", player:GetName(), player:GetCivilizationShortDescription())) 
		save(player, "Decisions_FundSeafaringExpeditions", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_FundSeafaringExpeditions", Decisions_FundSeafaringExpeditions)
--=======================================================================================================================
--=======================================================================================================================
