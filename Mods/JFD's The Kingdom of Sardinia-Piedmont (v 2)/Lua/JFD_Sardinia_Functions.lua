-- JFD_SardiniaPiedmontFunctions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("PlotIterators.lua")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end
--------------------------------------------------------------------------------------------------------------------------
-- UTILS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_SARDINIA"]
local isSardiniaCivActive  = JFD_IsCivilisationActive(civilizationID)
local mathCeil = math.ceil
local mathFloor = math.floor
if isSardiniaCivActive then
	print("King Victor Emmanuel II is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
-- RISORGIMENTO
--------------------------------------------------------------------------------------------------------------------------
local buildingSardiniaID = GameInfoTypes["BUILDING_JFD_SARDINIA"]
-- JFD_Sardinia_TourismToProduction
function JFD_Sardinia_TourismToProduction(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		for city in player:Cities() do
			local cityUnitProductionID = city:GetProductionUnit()
			if cityUnitProductionID > -1 then
				local tourism = city:GetBaseTourism()
				if tourism > 0 then	
					city:ChangeProduction(city:GetBaseTourism())
				end
			end
		end
	end
end
if isSardiniaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Sardinia_TourismToProduction)
end

-- JFD_Sardinia_CityStateSurrender
local unitGaribaldinoID = GameInfoTypes["UNIT_JFD_GARIBALDINO"]
function JFD_Sardinia_CityStateSurrender(playerID)
	local player = Players[playerID]
	local teamID = player:GetTeam()
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv()) then
				if Teams[otherPlayer:GetTeam()]:IsAtWar(teamID) then
					local minorCapital = otherPlayer:GetCapitalCity()
					if minorCapital:GetDamage() >= (minorCapital:GetMaxHitPoints()/2) then
						local plot = Map.GetPlot(minorCapital:GetX(), minorCapital:GetY())
						local numGaribaldinosNearby = 0
						local chanceToSurrender = (minorCapital:GetDamage()*10/100)
						for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
							local unit = loopPlot:GetUnit()
							if (unit and unit:GetOwner() == playerID) then
								if unit:GetUnitType() == unitGaribaldinoID then
									numGaribaldinosNearby = numGaribaldinosNearby + 1
								end
								chanceToSurrender = chanceToSurrender + 2
							end
						end
						if numGaribaldinosNearby > 0 then chanceToSurrender = chanceToSurrender*2 end
						if JFD_GetRandom(1,100) <= chanceToSurrender then
							if player:IsHuman() then
								player:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], Locale.ConvertTextKey("TXT_KEY_WORLD_EVENTS_JFD_SARDINIA_TRAIT", minorCapital:GetName()), Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_SARDINIA_SHORT"), -1, -1)
							else
								JFD_SendWorldEvent(player, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENTS_JFD_SARDINIA_TRAIT", minorCapital:GetName()))
							end
							player:AcquireCity(minorCapital, false, true)
						end
					end
				end
			end
		end
	end
end
if isSardiniaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Sardinia_CityStateSurrender)
end
--------------------------------------------------------------------------------------------------------------------------
-- BERSAGLIERI
--------------------------------------------------------------------------------------------------------------------------
local unitBersaglieriID = GameInfoTypes["UNIT_JFD_BERSAGLIERI"]
local unitPromotionGaribaldinoID = GameInfoTypes["PROMOTION_JFD_GARIBALDINO_UPGRADE"]
-- JFD_Sardinia_BlockGaribaldinos
function JFD_Sardinia_BlockGaribaldinos(playerID, unitID)
	if unitID == unitGaribaldinoID then
		return false
	end
	return true
end
GameEvents.PlayerCanTrain.Add(JFD_Sardinia_BlockGaribaldinos)

-- JFD_Sardinia_GaribaldinoPromotion
function JFD_Sardinia_GaribaldinoPromotion(playerID, unitID, promotionID)
	local player = Players[playerID]
	if promotionID == unitPromotionGaribaldinoID then
		local unit = player:GetUnitByID(unitID)
		if unit:GetUnitType() ~= unitBersaglieriID then return false end
		if unit:GetLevel() < 5 then return false end
	end
	return true
end
GameEvents.CanHavePromotion.Add(JFD_Sardinia_GaribaldinoPromotion)

-- JFD_Sardinia_GaribaldinoUpgrade
function JFD_Sardinia_GaribaldinoUpgrade(playerID, unitID, promotionID)
	local player = Players[playerID]	
	local unit = player:GetUnitByID(unitID)
	if promotionID == unitPromotionGaribaldinoID then 
		local newUnit = player:InitUnit(unitGaribaldinoID, unit:GetX(), unit:GetY())
		newUnit:Convert(unit)
		newUnit:SetHasPromotion(unitPromotionGaribaldinoID, false)
	end
end
GameEvents.UnitPromoted.Add(JFD_Sardinia_GaribaldinoUpgrade)
--==========================================================================================================================
--==========================================================================================================================