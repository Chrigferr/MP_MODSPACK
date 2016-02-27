-- JFD_Prussia_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Prussia Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MODS CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingSovereignty
function JFD_IsUsingSovereignty()
	local sovereigntyModID = "d99bf7aa-51ac-4bef-bd88-d765b28e260e"
	for _, mod in pairs(Modding.GetActivatedMods()) do
	   if (mod.ID == sovereigntyModID) then
	     return true
		end
	end
	return false
end
local isUsingSovereignty  = JFD_IsUsingSovereignty()

-- JFD_IsUsingEnlightenmentEra
function JFD_IsUsingEnlightenmentEra()
	local enlightenmentEraModID = "ce8aa614-7ef7-4a45-a179-5329869e8d6d"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == enlightenmentEraModID) then
			return true
		end
	end
	return false
end
local isUsingEnlightenmentEra = JFD_IsUsingEnlightenmentEra()
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID	  = GameInfoTypes["CIVILIZATION_JFD_PRUSSIA"]
local mathCeil			  = math.ceil
local resourceDignitaryID = GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
--------------------------------------------------------------------------------------------------------------------------
-- Prussia: Empower the Junker Nobility
-------------------------------------------------------------------------------------------------------------------------
local policyEmpowerJunkersID = GameInfoTypes["POLICY_DECISIONS_JFD_JUNKERS"]
local techFlintlockID		 = GameInfoTypes["TECH_EE_FLINTLOCK"]
local techRiflingID			 = GameInfoTypes["TECH_RIFLING"]
local yieldProductionID		 = GameInfoTypes["YIELD_PRODUCTION"]
local unitLandwehrID		 = GameInfoTypes["UNIT_JFD_LANDWEHR"]
local Decisions_JFD_Prussia_Junkers = {}
	Decisions_JFD_Prussia_Junkers.Name = "TXT_KEY_DECISIONS_JFD_PRUSSIA_JUNKERS"
	Decisions_JFD_Prussia_Junkers.Desc = "TXT_KEY_DECISIONS_JFD_PRUSSIA_JUNKERS_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Prussia_Junkers, "CIVILIZATION_JFD_PRUSSIA")
	Decisions_JFD_Prussia_Junkers.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyEmpowerJunkersID) then
			Decisions_JFD_Prussia_Junkers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PRUSSIA_JUNKERS_ENACTED_DESC")
			return false, false, true 
		end
		local goldCost = mathCeil(730*iMod)
		local techID = techRiflingID
		local techDesc = "Rifling"
		if isUsingEnlightenmentEra then
			techID = techFlintlockID
			techDesc = "Flintlock"
		end
		Decisions_JFD_Prussia_Junkers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PRUSSIA_JUNKERS_DESC", techDesc, goldCost)
		if (not Teams[player:GetTeam()]:IsHasTech(techID)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Prussia_Junkers.DoFunc = (
	function(player)
		local goldCost = mathCeil(730*iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyEmpowerJunkersID, true)
	end
	)

	Decisions_JFD_Prussia_Junkers.Monitors = {}
	Decisions_JFD_Prussia_Junkers.Monitors[GameEvents.SetPopulation] =  (
	function(cityX, cityY, oldPopulation, newPopulation)
		local city = Map.GetPlot(cityX, cityY):GetPlotCity()
		local player = Players[city:GetOwner()]
		if player:HasPolicy(policyEmpowerJunkersID) then
			if oldPopulation < newPopulation then
				if player:CanTrain(unitLandwehrID) then
					city:ChangeUnitProduction(unitLandwehrID, city:GetYieldRate(yieldProductionID)*3)
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Prussia_Junkers", Decisions_JFD_Prussia_Junkers)
-------------------------------------------------------------------------------------------------------------------------
-- Prussia: Award the Pour le Merite
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID	 = GameInfoTypes["ERA_RENAISSANCE"]
local eraModernID		 = GameInfoTypes["ERA_MODERN"]
local resourceHorseID	 = GameInfoTypes["RESOURCE_HORSE"]
local unitGreatGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"]
local Decisions_JFD_Prussia_Merit = {}
	Decisions_JFD_Prussia_Merit.Name = "TXT_KEY_DECISIONS_JFD_PRUSSIA_POUR_LE_MERITE"
	Decisions_JFD_Prussia_Merit.Desc = "TXT_KEY_DECISIONS_JFD_PRUSSIA_POUR_LE_MERITE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Prussia_Merit, "CIVILIZATION_JFD_PRUSSIA")
	Decisions_JFD_Prussia_Merit.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local era = load(player, "Decisions_JFD_Prussia_Merit")
		local currentEra = player:GetCurrentEra()
		if currentEra >= eraModernID then
			Decisions_JFD_Prussia_Merit.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PRUSSIA_POUR_LE_MERITE_ENACTED_DESC")
			return false, false, true 
		else
			if era ~= nil then
				if era < currentEra then
					save(player, "Decisions_JFD_Prussia_Merit", nil)
				else
					Decisions_JFD_Prussia_Merit.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PRUSSIA_POUR_LE_MERITE_ENACTED_DESC")
					return false, false, true
				end
			end
		end
		local cultureCost = mathCeil(370*iMod)
		local resourceType = "[ICON_MAGISTRATES] Magistrates"
		local resourceID = iMagistrate
		if isUsingSovereignty then
			resourceType = "[ICON_JFD_DIGNITARY] Dignitaries"
			resourceID = resourceDignitaryID
		end
		Decisions_JFD_Prussia_Merit.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PRUSSIA_POUR_LE_MERITE_DESC", cultureCost, resourceType)	
		if player:GetNumResourceAvailable(resourceID, false) < 1 then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Prussia_Merit.DoFunc = (
	function(player)
		local cultureCost = mathCeil(370*iMod)
		local resourceID = iMagistrate
		if isUsingSovereignty then
			resourceID = resourceDignitaryID
		end
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(resourceID, -1)
		local numHorses = player:GetNumResourceAvailable(resourceHorseID, true)
		local unitToSpawnID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_GUN")
		if unitToSpawnID then
			for unit in player:Units() do
				if numHorses > 0 then
					unitToSpawnID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_MOUNTED")
					numHorses = numHorses - 1
				end
				if unit:GetUnitType() == unitGreatGeneralID then
					local newUnit = player:InitUnit(unitToSpawnID, unit:GetX(), unit:GetY())
					newUnit:Convert(unit, false)
					newUnit:ChangeExperience(30)
				end
			end
		end
		save(player, "Decisions_JFD_Prussia_Merit", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Prussia_Merit", Decisions_JFD_Prussia_Merit)
--=======================================================================================================================
--=======================================================================================================================
