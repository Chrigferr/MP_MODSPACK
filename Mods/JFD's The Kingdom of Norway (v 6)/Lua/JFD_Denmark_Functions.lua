-- JFD_Denmark_Functions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("PlotIterators.lua")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsUsingCPDLL()
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- LONGBOAT
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Denmark_Longboat
local unitDomainLandID = GameInfoTypes["DOMAIN_LAND"]
local unitPromotionCoastalRaider1ID	= GameInfoTypes["PROMOTION_COASTAL_RAIDER_1"]
local unitPromotionLongboatID = GameInfoTypes["PROMOTION_JFD_LONGBOAT"]
function JFD_Denmark_Longboat(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then	
		for unit in player:Units() do
			if (unit:GetDomainType() == unitDomainLandID and (not unit:IsEmbarked())) then
				local isNearbyLongboat = false
				local unitPlot = unit:GetPlot()
				if isUsingCPDLL then
					isNearbyLongboat = unit:IsWithinDistanceOfUnitPromotion(unitPromotionLongboatID, 2, true, false)
				else
					for adjacentPlot in PlotAreaSweepIterator(unitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						isNearbyLongboat = (adjacentPlot:GetUnit() and adjacentPlot:GetUnit():IsHasPromotion(unitPromotionLongboatID))
						if isNearbyLongboat == true then 
							break
						end
					end
				end
				if isNearbyLongboat then
					if (not unit:IsHasPromotion(unitPromotionCoastalRaider1ID)) then
						unit:SetHasPromotion(unitPromotionCoastalRaider1ID, true)
					end
				else
					if unit:IsHasPromotion(unitPromotionCoastalRaider1ID) then
						unit:SetHasPromotion(unitPromotionCoastalRaider1ID, false)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Denmark_Longboat) 
--==========================================================================================================================
--==========================================================================================================================