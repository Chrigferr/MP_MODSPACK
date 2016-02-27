-- JFD_Novgorod_Functions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
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

-- JFD_IsAtPeace
function JFD_IsAtPeace(playerID)
	local atPeace = false
	if Teams[Players[playerID]:GetTeam()]:GetAtWarCount(true) == 0 then 
		atPeace = true 
	end
	return atPeace
end

-- JFD_GetNumCivPlayersAlive
function JFD_GetNumCivPlayersAlive()
	local numCivPlayersAlive = 0
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and (not player:IsMinorCiv())) then
			numCivPlayersAlive = numCivPlayersAlive + 1
		end
	end
	return numCivPlayersAlive
end

-- JFD_GetNumTradeRoutesToPlayer
function JFD_GetNumTradeRoutesToPlayer(playerID, otherPlayerID)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutes()
	local numTRs = 0
	for _, tradeRoute in ipairs(tradeRoutes) do
		if tradeRoute.ToID == otherPlayerID then
			numTRs = numTRs + 1
		end
	end
	return numTRs
end

-- JFD_GetDefenseFromConnectedTRs
local mathFloor = math.floor
function JFD_GetDefenseFromConnectedTRs(playerID, city)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutesToYou()
	local numStrength = 0
	for _, tradeRoute in ipairs(tradeRoutes) do
		if tradeRoute.ToCity == city then
			numStrength = numStrength + mathFloor((tradeRoute.FromCity:GetStrengthValue()*33/100)/100)
		end
	end
	return numStrength
end

-- JFD_GetNumIncomingTradeRoutes
function JFD_GetNumIncomingTradeRoutes(playerID, city)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutesToYou()
	local numIncomingTRs = 0
	for _, tradeRoute in ipairs(tradeRoutes) do
		if tradeRoute.ToCity == city then
			numIncomingTRs = numIncomingTRs + 1
		end
	end
	return numIncomingTRs
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID 				= Game.GetActivePlayer()
local activePlayer 					= Players[activePlayerID]
local civilizationID 				= GameInfoTypes["CIVILIZATION_JFD_NOVGOROD"]
local isNovgorodCivActive 			= JFD_IsCivilisationActive(civilizationID)
local isNovgorodCivActivePlayer 	= activePlayer:GetCivilizationType() == civilizationID
local mathMin 						= math.min
if isNovgorodCivActive then
	print("Prince Aleksandr Nevsky is in the game")
end
--------------------------------------------------------------------------------------------------------------------------
-- PEACE OF NOVGOROD
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Novgorod_CanDeclareWar
function JFD_Novgorod_CanDeclareWar(teamID, otherTeamID)
	local playerID = Teams[teamID]:GetLeaderID()
	local otherPlayerID = Teams[otherTeamID]:GetLeaderID()
	local player = Players[playerID]
	local otherPlayer = Players[otherPlayerID]
	if JFD_GetNumCivPlayersAlive() <= 3 then return true end
	if ((player:IsAlive() and player:GetCivilizationType() == civilizationID) or
	(otherPlayer:IsAlive() and otherPlayer:GetCivilizationType() == civilizationID)) then
		if JFD_GetNumTradeRoutesToPlayer(playerID, otherPlayerID) >= 3 then
			return false
		end
		return true
	end
	return true
end
if isNovgorodCivActive then
	GameEvents.CanDeclareWar.Add(JFD_Novgorod_CanDeclareWar)
end

-- JFD_Novogord_DefenseFromTRs
local buildingNovgorodDefenseID = GameInfoTypes["BUILDING_JFD_NOVGOROD_DEFENSE"]
function JFD_Novogord_DefenseFromTRs(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingNovgorodDefenseID, JFD_GetDefenseFromConnectedTRs(playerID, city))
		end
	end
end
if isNovgorodCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Novogord_DefenseFromTRs)
end
----------------------------------------------------------------------------------------------------------------------------
-- POGOST
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Novgorod_Pogost
local buildingPogostID			 = GameInfoTypes["BUILDING_JFD_POGOST"]
local buildingPogostConnectionID = GameInfoTypes["BUILDING_JFD_POGOST_CONNECTION"]
function JFD_Novgorod_Pogost(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingPogostID) then
				city:SetNumRealBuilding(buildingPogostConnectionID, JFD_GetNumIncomingTradeRoutes(playerID, city)) 
			end
		end
	end
end
if isNovgorodCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Novgorod_Pogost)
end
----------------------------------------------------------------------------------------------------------------------------
-- BOYAR
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Novgorod_Boyar
local buildingBoyarPeaceID	= GameInfoTypes["BUILDING_JFD_BOYAR_PEACE"]
local buildingBoyarWarID	= GameInfoTypes["BUILDING_JFD_BOYAR_WAR"]
local unitClassGreatGeneralID = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
local unitPromotionBoyarID	= GameInfoTypes["PROMOTION_JFD_BOYAR"]
function JFD_Novgorod_Boyar(playerID)
	local playerID = playerID or activePlayerID
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		if player:GetUnitClassCount(unitClassGreatGeneralID) == 0 then return end
		for city in player:Cities() do
			local isBoyarHere = false
			local plot = city:Plot()
			for unitID = 0, plot:GetNumUnits() - 1, 1 do
				if (plot and unitID and plot:GetUnit(unitID):IsHasPromotion(unitPromotionBoyarID)) then
					isBoyarHere = true
					break
				end
			end
			if isBoyarHere then
				if JFD_IsAtPeace(playerID) then
					if (not city:IsHasBuilding(buildingBoyarPeaceID)) then
						city:SetNumRealBuilding(buildingBoyarPeaceID, 1)
					end
					if city:IsHasBuilding(buildingBoyarWarID) then
						city:SetNumRealBuilding(buildingBoyarWarID, 0)
					end	
				else
					if city:IsHasBuilding(buildingBoyarPeaceID) then
						city:SetNumRealBuilding(buildingBoyarPeaceID, 0)
					end
					if (not city:IsHasBuilding(buildingBoyarWarID)) then
						city:SetNumRealBuilding(buildingBoyarWarID, 1)
					end	
				end
				
			else
				if city:IsHasBuilding(buildingBoyarPeaceID) then
					city:SetNumRealBuilding(buildingBoyarPeaceID, 0)
				end
				if city:IsHasBuilding(buildingBoyarWarID) then
					city:SetNumRealBuilding(buildingBoyarWarID, 0)
				end
			end
		end
	end
end
if isNovgorodCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Novgorod_Boyar)
	if isNovgorodCivActivePlayer then
		Events.SerialEventEnterCityScreen.Add(JFD_Novgorod_Boyar)
	end
end
--==========================================================================================================================
--==========================================================================================================================