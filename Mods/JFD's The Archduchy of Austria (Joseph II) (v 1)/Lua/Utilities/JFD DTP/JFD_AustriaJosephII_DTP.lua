-- JFD_AustriaJosephII_DTPS
-- Author: JFD
--=======================================================================================================================
-- UTILITY FUNCTIONS
--=======================================================================================================================
--  JFD_AustriaJosephII_GetGAPFromGPP
--------------------------------------------------------------------------------------------------------------------------
local mathFloor = math.floor
function JFD_AustriaJosephII_GetGAPFromGPP(playerID)
	local player = Players[playerID]
	local greatPeoplePoints = 0
	for city in player:Cities() do
		for specialist in GameInfo.Specialists("GreatPeopleRateChange > 0") do
			local specialistCount = (city:GetSpecialistCount(specialist.ID)*specialist.GreatPeopleRateChange)
			greatPeoplePoints = greatPeoplePoints + specialistCount
		end
		for building in GameInfo.Buildings("GreatPeopleRateChange > 0") do
			if city:IsHasBuilding(building.ID) then
				greatPeoplePoints = greatPeoplePoints + building.GreatPeopleRateChange
			end
		end
	end
	return greatPeoplePoints
end
--=======================================================================================================================
--=======================================================================================================================


