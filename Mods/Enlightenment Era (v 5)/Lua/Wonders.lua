--------------------------------------------------------------
-- Crystal Palace effect (5% GP Generation for each GW)
-- Author: JFD
--------------------------------------------------------------
local buildingCrystalPalaceID = GameInfoTypes["BUILDING_EE_CRYSTAL_PALACE"]
local buildingCrystalPalaceGPPID = GameInfoTypes["BUILDING_EE_CRYSTAL_PALACE_GPPG"]
function JFD_GPGenerationFromGWs(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:CountNumBuildings(buildingCrystalPalaceID) == 1) then
		for city in player:Cities() do
			if city:IsHasBuilding(buildingCrystalPalaceID) then
				city:SetNumRealBuilding(buildingCrystalPalaceGPPID, city:GetNumGreatWorks())
			end
		end
	end	
end
GameEvents.PlayerDoTurn.Add(JFD_GPGenerationFromGWs)