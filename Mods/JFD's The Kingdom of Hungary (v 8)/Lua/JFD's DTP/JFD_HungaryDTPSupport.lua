-- JFD_HungaryDynamicTopPanelSupport
-- Author: JFD
--=======================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsUsingPietyPrestige
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingPietyPrestige()
	local pietyPrestigeModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	local isUsingPiety = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == pietyPrestigeModID) then
	    isUsingPiety = true
	    break
	  end
	end

	return isUsingPiety
end

if JFD_IsUsingPietyPrestige() then
	include("JFD_PietyUtils")
end
--=======================================================================================================================
-- JFD_GetHungaryGAPFromFPT
--=======================================================================================================================
--  JFD_GetHungaryGAPFromFPT
--------------------------------------------------------------------------------------------------------------------------
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()

function JFD_GetHungaryGAPFromFPT(playerID)
	local player = Players[playerID]
	local numGAPointsFromFaith = 0
	local religionID = player:GetCapitalCity():GetReligiousMajority()
	if isUsingPietyPrestige then
		religionID = JFD_GetStateReligion(playerID)
	end

	if player:HasReligionInMostCities(religionID) then
		numGAPointsFromFaith = math.ceil(player:GetTotalFaithPerTurn() * 33 / 100)
	end

	return numGAPointsFromFaith
end
--=======================================================================================================================
--=======================================================================================================================


