-- JFD_HungaryDynamicTopPanelSupport
-- Author: JFD
--=======================================================================================================================
-- JFD_GetAngloSaxonGAP
--=======================================================================================================================
--  JFD_GetAngloSaxonGAP
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetAngloSaxonGAP(playerID)
	local player = Players[playerID]
	local numGAPPointsFromLessUnhapPenalty = math.ceil(player:GetUnhappiness() * 33 / 100)

	return numGAPPointsFromLessUnhapPenalty
end
--=======================================================================================================================
--=======================================================================================================================


