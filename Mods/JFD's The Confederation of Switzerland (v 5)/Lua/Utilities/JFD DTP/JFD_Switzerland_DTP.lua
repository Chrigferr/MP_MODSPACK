-- JFD_Switzerland_DTP
-- Author: JFD
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
--JFD_Switzerland_GetGoldFromNeutrality
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_SWITZERLAND"]
local mathFloor = math.floor
function JFD_Switzerland_GetGoldFromNeutrality(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local goldFromNeutrality = 0
	for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayerID ~= playerID and otherPlayer:IsAlive()) then
			local otherTeamID = otherPlayer:GetTeam()
			if playerTeam:IsHasMet(otherTeamID) then
				if (not otherPlayer:IsDoF(playerID)) 
				and (not otherPlayer:IsDenouncedPlayer(playerID)) 
				and (not otherPlayer:IsDenouncingPlayer(playerID)) 
				and (not playerTeam:IsAtWar(otherTeamID)) then
					local otherPlayerGold = otherPlayer:CalculateGoldRate()
					goldFromNeutrality = goldFromNeutrality + mathFloor(otherPlayerGold*10/100)
				end
			end
		end
	end
	return goldFromNeutrality
end
--=======================================================================================================================
--=======================================================================================================================


