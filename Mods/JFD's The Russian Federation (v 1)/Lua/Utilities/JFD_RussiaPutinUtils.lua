-- JFD_RussiaPutin_Utils
-- Author: JFD
-- DateCreated: 12/25/2015 1:51:27 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("PlotIterators.lua")
--=======================================================================================================================
-- UTILITY FUNCTIONS
--=======================================================================================================================
-- UTILS
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCityStateBordering
function JFD_IsCityStateBordering(playerID, city)
	local plot = city:Plot()
	for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_INWARDS, CENTRE_EXCLUDE) do
		local workingCity = loopPlot:GetWorkingCity()
		if (workingCity and workingCity ~= city and workingCity:GetOwner() == playerID) then
			return true
		end
	end
	return false
end
--=======================================================================================================================
--=======================================================================================================================
