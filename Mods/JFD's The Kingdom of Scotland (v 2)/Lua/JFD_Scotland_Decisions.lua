-- JFD_Scotland_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Scotland Decisions: loaded")
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
local civilizationID	= GameInfoTypes["CIVILIZATION_JFD_SCOTLAND"]
local eraRenaissanceID	= GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil			= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Scotland: Translate Holy Scriptures
-------------------------------------------------------------------------------------------------------------------------
local unitMissionaryID = GameInfoTypes["UNIT_MISSIONARY"]
local Decisions_JFD_Scotland_TranslateScriptures = {}
	Decisions_JFD_Scotland_TranslateScriptures.Name = "TXT_KEY_DECISIONS_JFD_SCOTLAND_TRANSLATE_HOLY_SCRIPTURES"
	Decisions_JFD_Scotland_TranslateScriptures.Desc = "TXT_KEY_DECISIONS_JFD_SCOTLAND_TRANSLATE_HOLY_SCRIPTURES_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Scotland_TranslateScriptures, "CIVILIZATION_JFD_SCOTLAND")
	Decisions_JFD_Scotland_TranslateScriptures.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local yieldReward = mathCeil(50*iMod)
		local yieldRewardType = "[ICON_PEACE] Faith"
		local religionType = "majority religion"
		if isUsingPiety then
			religionType = "State Religion"
			yieldReward = mathCeil(12*iMod)
			yieldRewardType = "[ICON_JFD_PIETY] Piety"
		end
		if load(player, "Decisions_JFD_Scotland_TranslateScriptures") == true then
			Decisions_JFD_Scotland_TranslateScriptures.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SCOTLAND_TRANSLATE_HOLY_SCRIPTURES_ENACTED_DESC", yieldRewardType)
			return false, false, true
		end
		local goldCost = mathCeil(120*iMod)
		Decisions_JFD_Scotland_TranslateScriptures.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SCOTLAND_TRANSLATE_HOLY_SCRIPTURES_DESC", religionType, goldCost, yieldReward, yieldRewardType)
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if isUsingPiety then
			if (not player:HasStateReligion()) then return true, false end
		else
			if (not GetPlayerMajorityReligion(player)) then return true, false end
		end
		return true, true
	end
	)
	
	Decisions_JFD_Scotland_TranslateScriptures.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(120*iMod)
		player:ChangeGold(-goldCost)
		local yieldReward = mathCeil(50*iMod)
		if isUsingPiety then
			yieldReward = mathCeil(12*iMod)
			player:ChangePiety(yieldReward)
		else
			player:ChangeFaith(yieldReward)
		end			
		local capital = player:GetCapitalCity()
		player:InitUnit(unitMissionaryID, capital:GetX(), capital:GetY())
		player:InitUnit(unitMissionaryID, capital:GetX(), capital:GetY())
		player:ChangeNumResourceTotal(iMagistrate, 1)
		local religionType = player:GetCapitalCity():GetReligiousMajority()
		local religiousText = "TXT_KEY_RELIGION_NONE_HOLY_BOOK_DESC"
		for row in GameInfo.Religion_ReligiousText("ReligionType = '" .. religionType .. "'") do
			religiousText = row.Text
			break
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SCOTLAND_HOLY_SCRIPTURES", player:GetName(), religiousText, player:GetCivilizationShortDescription())) 
		save(player, "Decisions_JFD_Scotland_TranslateScriptures", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Scotland_TranslateScriptures", Decisions_JFD_Scotland_TranslateScriptures)
-------------------------------------------------------------------------------------------------------------------------
-- Scotland: Found the Royal Society
-------------------------------------------------------------------------------------------------------------------------
local buildingRoyalSocietyID = GameInfoTypes["BUILDING_DECISIONS_JFD_ROYAL_SOCIETY"]
local specialistScientistID	 = GameInfoTypes["SPECIALIST_SCIENTIST"]
local Decisions_JFD_Scotland_RoyalSociety = {}
	Decisions_JFD_Scotland_RoyalSociety.Name = "TXT_KEY_DECISIONS_JFD_SCOTLAND_ROYAL_SOCIETY"
	Decisions_JFD_Scotland_RoyalSociety.Desc = "TXT_KEY_DECISIONS_JFD_SCOTLAND_ROYAL_SOCIETY_DESC"
	Decisions_JFD_Scotland_RoyalSociety.Pedia = "TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_SOCIETY"
	HookDecisionCivilizationIcon(Decisions_JFD_Scotland_RoyalSociety, "CIVILIZATION_JFD_SCOTLAND")
	Decisions_JFD_Scotland_RoyalSociety.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_JFD_Scotland_RoyalSociety") == true then
			Decisions_JFD_Scotland_RoyalSociety.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SCOTLAND_ROYAL_SOCIETY_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(400*iMod)
		Decisions_JFD_Scotland_RoyalSociety.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SCOTLAND_ROYAL_SOCIETY_DESC", goldCost)
		if player:GetCapitalCity():GetSpecialistCount(specialistScientistID) == 0 then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Scotland_RoyalSociety.DoFunc = (
	function(player)
		local goldCost = mathCeil(400*iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:GetCapitalCity():SetNumRealBuilding(buildingRoyalSocietyID, 1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SCOTLAND_ROYAL_SOCIETY", player:GetName(), player:GetCivilizationShortDescription())) 
		save(player, "Decisions_JFD_Scotland_RoyalSociety", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Scotland_RoyalSociety", Decisions_JFD_Scotland_RoyalSociety)
--=======================================================================================================================
--=======================================================================================================================
