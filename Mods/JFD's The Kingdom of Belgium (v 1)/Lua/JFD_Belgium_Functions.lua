-- JFD_Belgium_Functions
-- Author: JFD
-- DateCreated: 6/24/2014 4:29:58 AM
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
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
local militarySupport = {}
  militarySupport["ERA_ANCIENT"]		= "UNITCLASS_WARRIOR"
  militarySupport["ERA_CLASSICAL"]		= "UNITCLASS_SPEARMAN"
  militarySupport["ERA_MEDIEVAL"]		= "UNITCLASS_PIKEMAN"
  militarySupport["ERA_RENAISSANCE"]	= "UNITCLASS_MUSKETMAN"
  militarySupport["ERA_ENLIGHTENMENT"]	= "UNITCLASS_LINE_INFANTRY"
  militarySupport["ERA_INDUSTRIAL"]		= "UNITCLASS_RIFLEMAN"
  militarySupport["ERA_MODERN"]			= "UNITCLASS_GREAT_WAR_INFANTRY"
  militarySupport["ERA_POSTMODERN"]		= "UNITCLASS_INFANTRY"
  militarySupport["ERA_FUTURE"]			= "UNITCLASS_INFANTRY"
		
function JFD_SendMilitarySupport(playerID, otherPlayerID, attackingPlayerID)
	local player = Players[playerID]
	local otherPlayer = Players[otherPlayerID]
	local attackingPlayer = Players[attackingPlayerID]
	local currentEra = GameInfo.Eras[otherPlayer:GetCurrentEra()]
	if (not currentEra) then return end
	local unitClass = militarySupport[currentEra.Type]
	local unitID = nil
	if isUsingCPDLL then 
		unitID = player:GetSpecificUnitType(unitClass) 
	else
		unitID = GameInfoTypes[JFD_GetUniqueUnit(otherPlayer, unitClass)]
	end
	if unitID then
		local capital = player:GetCapitalCity()
		player:InitUnit(unitID, capital:GetX(), capital:GetY())
		if player:IsHuman() then
			local description = Locale.ConvertTextKey('TXT_KEY_JFD_BELGIUM_MILITARY_SUPPORT', otherPlayer:GetName(), GameInfo.Units[unitID].Description, attackingPlayer:GetCivilizationDescription())
			local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_BELGIUM_MILITARY_SUPPORT_SHORT", otherPlayer:GetName())
			player:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, descriptionShort)
		end
	end
end

-- JFD_GetUniqueUnit
function JFD_GetUniqueUnit(player, unitClass)
	local unitType = nil
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for uniqueUnit in GameInfo.Civilization_UnitClassOverrides{CivilizationType = civType, UnitClassType = unitClass} do
		unitType = uniqueUnit.UnitType
		break
	end
	if (unitType == nil) then
		unitType = GameInfo.UnitClasses[unitClass].DefaultUnit
	end
	return unitType
end

-- JFD_GetWarPartner
function JFD_GetWarPartner(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS-1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then
			if playerTeam:IsAtWar(otherPlayer:GetTeam()) then
				return otherPlayerID
			end
		end
	end
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_BELGIUM"]
local isBelgiumCivActive = JFD_IsCivilisationActive(civilizationID)
if isBelgiumCivActive then
	print("King Albert is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_TreatyOfLondon
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Belgium_TreatyOfLondon
function JFD_Belgium_TreatyOfLondon(teamID, otherTeamID)
	local team = Teams[teamID]
	local otherTeam = Teams[otherTeamID]
	local attackingPlayerID = team:GetLeaderID()
	local attackingPlayer = Players[attackingPlayerID]
	local playerID = otherTeam:GetLeaderID()
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilizationID and (not attackingPlayer:IsMinorCiv())) then
		local belgianFriends = {}
		local count = 1
		for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS-1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and (not otherPlayer:IsMinorCiv())) then
				if otherPlayer:IsDoF(playerID) then
					belgianFriends[count] = otherPlayerID
					count = count + 1
				end
			end
		end
		for _, otherPlayerID in pairs(belgianFriends) do
			JFD_SendMilitarySupport(playerID, otherPlayerID, attackingPlayerID)	
		end
	end
end
if isBelgiumCivActive then
	GameEvents.DeclareWar.Add(JFD_Belgium_TreatyOfLondon)
end

-- JFD_Belgium_BlockWorkers
local unitBelgianWorkerID = GameInfoTypes["UNIT_JFD_BELGIAN_WORKER"]
function JFD_Belgium_BlockWorkers(playerID, unitID)
	local player = Players[playerID]
    if unitID == unitBelgianWorkerID then return false end
	return true
end
GameEvents.PlayerCanTrain.Add(JFD_Belgium_BlockWorkers)

-- JFD_Belgium_ConvertWorkers
local unitWorkerID = GameInfoTypes["UNIT_WORKER"]
function JFD_Belgium_ConvertWorkers(playerID, unitID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		local unit = player:GetUnitByID(unitID)
       	if (unit and unit:GetUnitType() == unitWorkerID) then
			local unit = player:GetUnitByID(unitID)
			local newUnit = player:InitUnit(unitBelgianWorkerID, unit:GetX(), unit:GetY())
			newUnit:Convert(unit)
        end
    end
end
if isBelgiumCivActive then
	Events.SerialEventUnitCreated.Add(JFD_Belgium_ConvertWorkers)
end

-- JFD_Belgium_Plantations
local improvementBelgianPlantationID = GameInfoTypes["IMPROVEMENT_JFD_BELGIAN_PLANTATION"]
function JFD_Belgium_Plantations(playerID, plotX, plotY, improvementID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		if improvementID == improvementBelgianPlantationID then
			local plot = Map.GetPlot(plotX, plotY)
			if (plot and plot:GetOwner() ~= playerID) then
				plot:SetOwner(playerID)
				plot:SetRevealed(player:GetTeam(), true)
			end
		end
	end
end
if isBelgiumCivActive then
	GameEvents.BuildFinished.Add(JFD_Belgium_Plantations)
end
----------------------------------------------------------------------------------------------------------------------------
-- CHASSEUR
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Belgium_Chasseur
local unitClassGatlingGunID = GameInfoTypes["UNITCLASS_GATLINGGUN"]
local unitPromotionChasseurID = GameInfoTypes["PROMOTION_JFD_CHASSEUR"]
local unitPromotionChasseurMarchID = GameInfoTypes["PROMOTION_JFD_CHASSEUR_MARCH"]
function JFD_Belgium_Chasseur(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsMinorCiv()) and (not player:IsBarbarian())) then 
		if player:GetUnitClassCount(unitClassGatlingGunID) == 0 then return end
		local isInCoalitionWar = false
		local warPlayerID = JFD_GetWarPartner(playerID)
		if warPlayerID then
			for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS-1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then
					local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
					if (otherPlayer:IsDoF(playerID) and JFD_GetWarPartner(otherPlayerID) == warPlayerID) then
						isInCoalitionWar = true
						break
					end
				end
			end
			for unit in player:Units() do
				if isInCoalitionWar then
					if unit:IsHasPromotion(unitPromotionChasseurID) then
						unit:SetHasPromotion(unitPromotionChasseurMarchID, true)
						unit:SetHasPromotion(unitPromotionChasseurID, false)
					end
				else
					if unit:IsHasPromotion(unitPromotionChasseurMarchID) then
						unit:SetHasPromotion(unitPromotionChasseurMarchID, false)
						unit:SetHasPromotion(unitPromotionChasseurID, true)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Belgium_Chasseur)
--==========================================================================================================================
--==========================================================================================================================