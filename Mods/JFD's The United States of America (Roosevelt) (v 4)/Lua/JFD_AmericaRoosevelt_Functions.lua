-- JFD_AmericaRooseveltFunctions
-- Author: JFD
-- DateCreated: 8/2/2013 7:09:28 PM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("IconSupport")
include("PlotIterators")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID						= GameInfoTypes["CIVILIZATION_JFD_AMERICA_ROOSEVELT"]
local isAmericaRooseveltCivilisationActive	= JFD_IsCivilisationActive(civilisationID)
local mathCeil								= math.ceil
local mathFloor 							= math.floor

if isAmericaRooseveltCivilisationActive then
	print("President Roosevelt is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
--JFD_RooseveltNewDeal
----------------------------------------------------------------------------------------------------------------------------
local popupOpen				= false
local specialistEngineerID	= GameInfoTypes["SPECIALIST_ENGINEER"]
local specialistMerchantID	= GameInfoTypes["SPECIALIST_MERCHANT"]

function JFD_RooseveltNewDeal(playerID, policyID)
	local player = Players[playerID]
	 if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		if player:IsTurnActive() then
			JFD_ShowNewDealPopup()
		else
			if JFD_GetRandom(1,3) < 3 then
				JFD_RooseveltMerchantPoints(playerID)
			else
				JFD_RooseveltEngineerPoints(playerID)
			end
		end
	end
end

if isAmericaRooseveltCivilisationActive then
	GameEvents.PlayerAdoptPolicy.Add(JFD_RooseveltNewDeal)
	GameEvents.PlayerAdoptPolicyBranch.Add(JFD_RooseveltNewDeal)
end

function JFD_RooseveltMerchantPoints(playerID)
	local player = Players[playerID] or Players[Game.GetActivePlayer()]
	local currentEra = player:GetCurrentEra() + 1
	local newDealGoldBoost = mathCeil(34 * currentEra)
	local newDealMerchantPoints = mathFloor(28 + currentEra)
	for city in player:Cities() do
		city:ChangeSpecialistGreatPersonProgressTimes100(specialistMerchantID, newDealMerchantPoints*100)
	end
	player:ChangeGold(newDealGoldBoost)
	
	if popupOpen then
		player:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_AMERICA_ROOSEVELT_NOTIFICATION_MERCHANT"), Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_AMERICA_ROOSEVELT_SHORT"), -1, -1)
		JFD_HideNewDealPopup()
	end
end
Controls.Button1:RegisterCallback(Mouse.eLClick, JFD_RooseveltMerchantPoints)

function JFD_RooseveltEngineerPoints(playerID)
	local player = Players[playerID] or Players[Game.GetActivePlayer()]
	local currentEra = player:GetCurrentEra() + 1
	local newDealProductionBoost = mathCeil(23 * currentEra)
	local newDealEngineerPoints = mathFloor(17 + currentEra)
	for city in player:Cities() do
		city:ChangeSpecialistGreatPersonProgressTimes100(specialistEngineerID, newDealEngineerPoints*100)
		city:ChangeProduction(newDealProductionBoost)
	end
	
	if popupOpen then
		player:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_AMERICA_ROOSEVELT_NOTIFICATION_ENGINEER"), Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_AMERICA_ROOSEVELT_SHORT"), -1, -1)
		JFD_HideNewDealPopup()
	end
end
Controls.Button2:RegisterCallback(Mouse.eLClick, JFD_RooseveltEngineerPoints)

function JFD_ShowNewDealPopup()
	popupOpen = true
	CivIconHookup(Game.GetActivePlayer(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true)
	local player = Players[Game.GetActivePlayer()]
	Controls.Summary:LocalizeAndSetText("TXT_KEY_JFD_ROOSEVELT_NEW_DEAL_MESSAGE")
	Controls.ButtonStack:CalculateSize()
	Controls.MainUI:DoAutoSize()
	Controls.MainUIBG:SetHide(false)
	Controls.MainUI:SetHide(false)

	local currentEra = player:GetCurrentEra() + 1
	local newDealProductionBoost = mathCeil(23 * currentEra)
	local newDealEngineerPoints = mathFloor(17 + currentEra)
	local newDealGoldBoost = mathCeil(34 * currentEra)
	local newDealMerchantPoints = mathFloor(28 + currentEra)
	Controls.Button1:LocalizeAndSetToolTip("TXT_KEY_JFD_ROOSEVELT_MERCHANT_TT", newDealMerchantPoints, newDealGoldBoost)
	Controls.Button2:LocalizeAndSetToolTip("TXT_KEY_JFD_ROOSEVELT_ENGINEER_TT", newDealEngineerPoints, newDealProductionBoost)
end

function JFD_HideNewDealPopup()
	Controls.MainUIBG:SetHide(true)
	Controls.MainUI:SetHide(true)
end
--==========================================================================================================================
-- CORE WASHINGTON FUNCTIONS
--==========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingRanchID = GameInfoTypes["BUILDING_JFD_RANCH"]
local civilisationWashingtonID = GameInfoTypes["CIVILIZATION_AMERICA"]
local isAmericaWashingtonCivilisationActive = JFD_IsCivilisationActive(civilisationWashingtonID)

if isAmericaWashingtonCivilisationActive then
	print("President Washington is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_WashingtonRanchClaimantsAndImprovement
----------------------------------------------------------------------------------------------------------------------------
local improvementCampID		= GameInfoTypes["IMPROVEMENT_CAMP"]
local improvementPastureID	= GameInfoTypes["IMPROVEMENT_PASTURE"]
local resourceBisonID		= GameInfoTypes["RESOURCE_BISON"]
local resourceCowID			= GameInfoTypes["RESOURCE_COW"]
local resourceDeerID		= GameInfoTypes["RESOURCE_DEER"]
local resourceHorseID		= GameInfoTypes["RESOURCE_HORSE"]
local resourceSheepID		= GameInfoTypes["RESOURCE_SHEEP"]

function JFD_WashingtonRanchClaimantsAndImprovement(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationWashingtonID and player:IsEverAlive()) then
		if buildingID == buildingRanchID then
			local city = player:GetCityByID(cityID)
			local plot = Map.GetPlot(city:GetX(), city:GetY())
			for loopPlot in PlotAreaSpiralIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				local plotX = loopPlot:GetX()
				local plotY = loopPlot:GetY()
				local plotResource = loopPlot:GetResourceType()
				if loopPlot:GetOwner() == -1 then
					if (plotResource == resourceSheepID or plotResource == resourceHorseID or plotResource == resourceCowID)  then
						loopPlot:SetOwner(playerID, cityID, true, true)
						loopPlot:SetRevealed(playerTeam, true)	
						if loopPlot:GetImprovementType() == -1 then
							loopPlot:SetImprovementType(improvementPastureID, true)
						end
					elseif (plotResource == resourceBisonID or plotResource == resourceDeerID)  then
						loopPlot:SetOwner(playerID, cityID, true, true)
						loopPlot:SetRevealed(playerTeam, true)	
						if loopPlot:GetImprovementType() == -1 then
							loopPlot:SetImprovementType(improvementCampID, true)
						end
					end
				end
			end
		end
	end 	
end

if isAmericaWashingtonCivilisationActive then
	GameEvents.CityConstructed.Add(JFD_WashingtonRanchClaimantsAndImprovement)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_WashingtonWorkersandSettlers
----------------------------------------------------------------------------------------------------------------------------
local promotionExtraMoves1ID = GameInfoTypes["PROMOTION_EXTRA_MOVES_I"]

function JFD_WashingtonWorkersandSettlers(playerID, cityID, unitID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationWashingtonID) then
		local unit = player:GetUnitByID(unitID)
		if ((not unit:IsHasPromotion(promotionExtraMoves1ID)) and (not unit:IsCombatUnit())) then
			local movementChange = math.floor(unit:GetMoves() - 1)
			unit:SetHasPromotion(promotionExtraMoves1ID, true)
	        unit:ChangeMoves(60)
		end
    end
end

function JFD_WashingtonWorkersandSettlersOnGameLoad(playerID)
	local player = Players[playerID] or Players[Game.GetActivePlayer()]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationWashingtonID) then
		for unit in player:Units() do
			if ((not unit:IsHasPromotion(promotionExtraMoves1ID)) and (not unit:IsCombatUnit())) then
				local movementChange = math.floor(unit:GetMoves() - 1)
				unit:SetHasPromotion(promotionExtraMoves1ID, true) 
	            unit:ChangeMoves(movementChange)
			end
		end
	end
end

if isAmericaWashingtonCivilisationActive then
	GameEvents.CityTrained.Add(JFD_WashingtonWorkersandSettlers)
	Events.LoadScreenClose.Add(JFD_WashingtonWorkersandSettlersOnGameLoad)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_WashingtonBorderAttrition
----------------------------------------------------------------------------------------------------------------------------
function JFD_WashingtonBorderAttrition(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationWashingtonID) then
		for otherPlayerID = 0, GameDefines.MAX_PLAYERS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then
				if Teams[otherPlayer:GetTeam()]:IsAtWar(player:GetTeam()) then
					for unit in otherPlayer:Units() do
						local plot = unit:GetPlot()
						for adjacentPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
							if (adjacentPlot:GetOwner() == playerID and plot:GetOwner() ~= playerID) then
								unit:ChangeDamage(10)
							end
						end
					end
				end
			end
		end
	end
end

if isAmericaWashingtonCivilisationActive then
	GameEvents.PlayerDoTurn.Add(JFD_WashingtonBorderAttrition)
end
--==========================================================================================================================
--==========================================================================================================================
