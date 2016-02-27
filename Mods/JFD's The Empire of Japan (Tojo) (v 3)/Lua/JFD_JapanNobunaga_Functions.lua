-- JFD_JapanNobunaga_Functions
-- Author: JFD
-- DateCreated: 4/11/2015 9:37:11 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID		= GameInfoTypes["CIVILIZATION_JAPAN"]
local isCivilisationActive	= JFD_IsCivilisationActive(civilisationID)
local mathMin				= math.min

if isCivilisationActive then
	print("Daiymo Nobunaga is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_DojoExperienceFromCulture
--------------------------------------------------------------------------------------------------------------------------
local buildingDojoID		= GameInfoTypes["BUILDING_JFD_DOJO"]
local buildingTempleID		= GameInfoTypes["BUILDING_TEMPLE"]
local unitCombatGunID		= GameInfoTypes["UNITCOMBAT_GUN"] 
local unitCombatMeleeID		= GameInfoTypes["UNITCOMBAT_MELEE"] 
local yieldCultureID		= GameInfoTypes["YIELD_CULTURE"]

function JFD_DojoExperienceFromCulture(playerID, cityID, unitID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local city = player:GetCityByID(cityID)
		if city:IsHasBuilding(buildingDojoID) then
			local unit = player:GetUnitByID(unitID)
			if (unit:GetUnitCombatType() == unitCombatMeleeID or unit:GetUnitCombatType() == unitCombatGunID) then	
				local experiencePercent = 20
				if city:IsHasBuilding(buildingTempleID) then experiencePercent = 30 end
				
				local experienceFromCulture = city:GetYieldRate(yieldCultureID) * experiencePercent / 100
				unit:ChangeExperience(mathMin(experienceFromCulture, 20))
			end
		end
	end
end

if isCivilisationActive then
	GameEvents.CityTrained.Add(JFD_DojoExperienceFromCulture)
end
--==========================================================================================================================
--==========================================================================================================================
