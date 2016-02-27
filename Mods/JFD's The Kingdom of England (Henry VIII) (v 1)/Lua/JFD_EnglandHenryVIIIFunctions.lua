-- JFD_EnglandHenryVIIIFunctions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("FLuaVector.lua")
include("NewSaveUtils.lua"); MY_MOD_NAME = "EnglandHenryVIII";
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
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID				= Game.GetActivePlayer()
local activePlayer					= Players[activePlayerID]
local civilisationID 				= GameInfoTypes["CIVILIZATION_JFD_HENRY_ENGLAND"]
local isHenryEnglandCivActive		= JFD_IsCivilisationActive(civilisationID)
local isHenryEnglandActivePlayer	= activePlayer:GetCivilizationType() == civilisationID
local isUsingPietyPrestige			= JFD_IsUsingPietyPrestige()
local mathMin 						= math.min

if isHenryEnglandCivActive then
	print("King Henry VIII is in this game")
end

if isUsingPietyPrestige then
	include("JFD_PietyUtils.lua")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_WeLoveTheKingDayFromCapture
----------------------------------------------------------------------------------------------------------------------------
function JFD_WeLoveTheKingDayFromCapture(oldOwnerID, capital, cityX, cityY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local capturedCity = Map.GetPlot(cityX, cityY):GetPlotCity()
		local cityPopulation = capturedCity:GetPopulation()
		for city in player:Cities() do
			city:ChangeWeLoveTheKingDayCounter(cityPopulation)
		end
	end
end

if isHenryEnglandCivActive then
	GameEvents.CityCaptureComplete.Add(JFD_WeLoveTheKingDayFromCapture)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_WeLoveTheKingDayFromPolicies
----------------------------------------------------------------------------------------------------------------------------
function JFD_WeLoveTheKingDayFromPolicies(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local numWLTKD = player:GetNumPolicies() + 1
		for city in player:Cities() do
			city:ChangeWeLoveTheKingDayCounter(numWLTKD)
		end
	end
end

if isHenryEnglandCivActive then
	GameEvents.PlayerAdoptPolicy.Add(JFD_WeLoveTheKingDayFromPolicies)
	GameEvents.PlayerAdoptPolicyBranch.Add(JFD_WeLoveTheKingDayFromPolicies)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_WeLoveTheKingDayChurchofEngland
----------------------------------------------------------------------------------------------------------------------------
function JFD_WeLoveTheKingDayChurchofEngland(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		for city in player:Cities() do
			if city:GetWeLoveTheKingDayCounter() > 0 then
				local religionID = player:GetReligionCreatedByPlayer()
				if religionID == -1 then religionID = player:GetCapitalCity():GetReligiousMajority() end
				if isUsingPietyPrestige then religionID = JFD_GetStateReligionID(playerID) end

				for religion in GameInfo.Religions() do
					if city:IsReligionInCity(religion.ID) then
						city:ConvertPercentFollowers(religionID, religion.ID, 100) 
					end
				end
				
				if city:GetReligiousMajority() == -1 then
					city:ConvertPercentFollowers(religionID, -1, 100) 
				end
			end
		end
	end
end

if isHenryEnglandCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_WeLoveTheKingDayChurchofEngland)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_WeLoveTheKingDayGreatPeople
----------------------------------------------------------------------------------------------------------------------------
local buildingGPGenID = GameInfoTypes["BUILDING_JFD_HENRY_GPGEN"]

function JFD_WeLoveTheKingDayGreatPeople(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		for city in player:Cities() do
			if city:GetWeLoveTheKingDayCounter() > 0 then
				if (not city:IsHasBuilding(buildingGPGenID)) then
					city:SetNumRealBuilding(buildingGPGenID, 1)
				end
			else
				if city:IsHasBuilding(buildingGPGenID) then
					city:SetNumRealBuilding(buildingGPGenID, 0)
				end
			end
		end
	end
end

function JFD_WeLoveTheKingDayGreatPeopleCityView()
    if (activePlayer:IsAlive() and activePlayer:GetCivilizationType() == civilisationID) then 
		local city = UI.GetHeadSelectedCity()
		if city:GetWeLoveTheKingDayCounter() > 0 then
			if (not city:IsHasBuilding(buildingGPGenID)) then
				city:SetNumRealBuilding(buildingGPGenID, 1)
			end
		else
			if city:IsHasBuilding(buildingGPGenID) then
				city:SetNumRealBuilding(buildingGPGenID, 0)
			end
		end
	end
end

if isHenryEnglandCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_WeLoveTheKingDayGreatPeople)
	if isHenryEnglandActivePlayer then
		Events.SerialEventEnterCityScreen.Add(JFD_WeLoveTheKingDayGreatPeopleCityView)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_JoustingGroundsCulture
----------------------------------------------------------------------------------------------------------------------------
local buildingJoustingGroundsID	 = GameInfoTypes["BUILDING_JFD_JOUSTING_GROUNDS"]
local unitCombatMountedID		 = GameInfoTypes["UNITCOMBAT_MOUNTED"]

function JFD_JoustingGroundsCulture(playerID, cityID, unitID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		local city = player:GetCityByID(cityID)
		if city:IsHasBuilding(buildingJoustingGroundsID) then
			local unit = player:GetUnitByID(unitID)
			if unit:GetUnitCombatType() == unitCombatMountedID then
				local cultureReward = unit:GetExperience()
				player:ChangeJONSCulture(cultureReward)
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_CULTURE]", cultureReward))
			end
		end
	end
end

if isHenryEnglandCivActive then
	GameEvents.CityTrained.Add(JFD_JoustingGroundsCulture)
end
--==========================================================================================================================
-- CORE ELIZABETH FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationEnglandID 		= GameInfoTypes["CIVILIZATION_ENGLAND"]
local isElisabethEnglandCivActive	= JFD_IsCivilisationActive(civilisationEnglandID)

if isElisabethEnglandCivActive then
	print("Queen Elisabeth is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Playwright
----------------------------------------------------------------------------------------------------------------------------
local buildingPlayhouseID 			= GameInfoTypes["BUILDING_JFD_PLAYHOUSE"]
local unitPlaywrightID 				= GameInfoTypes["UNIT_JFD_ELIZABETHAN_WRITER"]
local unitMissionCreateGreatWorkID	= GameInfoTypes["MISSION_CREATE_GREAT_WORK"]

function JFD_Playwright(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationEnglandID) then 
		print("we're elizabeth")
		local playWrightsBorn = GetPersistentProperty("JFD_PlaywrightsBorn") or 0
		if (buildingID == buildingPlayhouseID and playWrightsBorn < 3) then
			local city = player:GetCityByID(cityID)
			player:InitUnit(unitPlaywrightID, city:GetX(), city:GetY()):PushMission(unitMissionCreateGreatWorkID)
			SetPersistentProperty("JFD_PlaywrightsBorn", playWrightsBorn+1)
		end
	end
end

if isElisabethEnglandCivActive then
	GameEvents.CityConstructed.Add(JFD_Playwright)
end
--==========================================================================================================================
--==========================================================================================================================