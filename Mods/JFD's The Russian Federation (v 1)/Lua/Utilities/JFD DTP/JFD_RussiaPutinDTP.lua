-- JFD_RussiaPutinDTP.lua
-- Author: JFD
-- DateCreated: 6/5/2015 2:42:50 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_RussiaPutin_GoldenAgePointsFromUnhappiness
function JFD_RussiaPutin_GoldenAgePointsFromUnhappiness(playerID)
	local player = Players[playerID]
	return player:GetUnhappiness()
end

-- JFD_RussiaPutin_GoldenAgePointsFromHappiness
function JFD_RussiaPutin_GoldenAgePointsFromHappiness(playerID)
	local player = Players[playerID]
	return player:GetExcessHappiness()
end
--=======================================================================================================================
--=======================================================================================================================


