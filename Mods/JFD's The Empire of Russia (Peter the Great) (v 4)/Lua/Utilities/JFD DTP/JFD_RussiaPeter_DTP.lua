-- JFD_RussiaPeterI_DTPS
-- Author: JFD
--=======================================================================================================================
-- UTILITY FUNCTIONS
--=======================================================================================================================
--  JFD_RussiaPeter_GetScienceFromDoF
local mathFloor = math.floor
function JFD_RussiaPeter_GetScienceFromDoF(playerID)
	local player = Players[playerID]
	local scienceBoost = 0
	for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		if otherPlayerID ~= playerID then
			local playerTeam = Teams[player:GetTeam()]
			local otherPlayer = Players[otherPlayerID]
			local otherTeam = Teams[otherPlayer:GetTeam()]
			if (otherPlayer:IsAlive() and otherPlayer:IsDoF(playerID)) then
				for row in GameInfo.Technologies() do
					if otherTeam:IsHasTech(row.ID) and player:GetCurrentResearch() == row.ID then
						scienceBoost = scienceBoost + mathFloor((otherPlayer:GetScience()*5)/100)
					end
				end
			end
		end
	end
	return scienceBoost
end
--=======================================================================================================================
--=======================================================================================================================


