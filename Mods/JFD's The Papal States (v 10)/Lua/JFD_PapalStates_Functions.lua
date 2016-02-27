-- JFD_PapalStates_Functions
-- Author: JFD
-- DateCreated: 11/23/2013 12:54:04 PM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("IconSupport")
include("NewSaveUtils.lua"); MY_MOD_NAME = "PapalStates";
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetDiscipleCost
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetDiscipleCost()
	local speedMod = GameInfo.GameSpeeds[Game.GetGameSpeedType()].FaithPercent
	local baseDiscipleCost = (200 * (speedMod/100))
	local numTimesPurchased = GetPersistentProperty("JFD_PSNumTimesDisciplePurchased") or 0
	local discipleCost = baseDiscipleCost + ((100 * (speedMod/100)) * numTimesPurchased)
	return discipleCost
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
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
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local activePlayer = Players[Game.GetActivePlayer()]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_PAPAL_STATES"]
local isPapalStatesCivActive = JFD_IsCivilisationActive(civilisationID)
local isPapalStatesActivePlayer = activePlayer:GetCivilizationType() == civilisationID
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()
	
if isPapalStatesCivActive then
	print("Pope Pius IX is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_InitPapalStates
--------------------------------------------------------------------------------------------------------------------------
local policyPapalStatesID = GameInfoTypes["POLICY_JFD_PAPAL_STATES"]

function JFD_InitPapalStates(player)
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if player:GetCivilizationType() == civilisationID then
			if (not player:HasPolicy(policyPapalStatesID)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyPapalStatesID, true)	
			end
		end
	end 
end

if isPapalStatesCivActive then
	Events.LoadScreenClose.Add(JFD_InitPapalStates)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PapalDisciples
--------------------------------------------------------------------------------------------------------------------------
local unitDiscipleID = GameInfoTypes["UNIT_JFD_DISCIPLE"]

function JFD_BlockDisciples(playerID, unitID)
	if unitID == unitDiscipleID then return false end

	return true
end
GameEvents.PlayerCanTrain.Add(JFD_BlockDisciples)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SwissGuardTourism
--------------------------------------------------------------------------------------------------------------------------
local buildingSwissGuardTourism			= GameInfoTypes["BUILDING_JFD_SWISS_GUARD_TOURISM"]
local unitPromotionSwissGuardTourismID	= GameInfoTypes["PROMOTION_JFD_SWISS_GUARD_TOURISM"]

function JFD_SwissGuardTourism(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsMinorCiv()) and (not player:IsBarbarian())) then
		for city in player:Cities() do
			local garrison = city:GetGarrisonedUnit()
			if (garrison and garrison:IsHasPromotion(unitPromotionSwissGuardTourismID)) then
				city:SetNumRealBuilding(buildingSwissGuardTourism, 1)
			else
				if city:IsHasBuilding(buildingSwissGuardTourism) then
					city:SetNumRealBuilding(buildingSwissGuardTourism, 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_SwissGuardTourism)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SwissGuardCapitalHealing
--------------------------------------------------------------------------------------------------------------------------
local unitPromotionSwissGuardHealingID		= GameInfoTypes["PROMOTION_JFD_SWISS_GUARD_HEALING"]
local unitPromotionSwissGuardHealingInfoID	= GameInfoTypes["PROMOTION_JFD_SWISS_GUARD_HEALING_INFO"]

function JFD_SwissGuardCapitalHealing(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local adjacentToCapital = false
	local unit = player:GetUnitByID(unitID)
	if (unit:IsHasPromotion(unitPromotionSwissGuardHealingInfoID) or unit:IsHasPromotion(unitPromotionSwissGuardHealingID)) then
		local capitalX = player:GetCapitalCity():GetX()
		local capitalY = player:GetCapitalCity():GetY()
		if Map.PlotDistance(unitX, unitY, capitalX, capitalY) < 2 then
			adjacentToCapital = true
		end
			
		if adjacentToCapital then
			if unit:IsHasPromotion(unitPromotionSwissGuardHealingInfoID) then
				unit:SetHasPromotion(unitPromotionSwissGuardHealingID, true)
				unit:SetHasPromotion(unitPromotionSwissGuardHealingInfoID, false)
			end
		else
			if unit:IsHasPromotion(unitPromotionSwissGuardHealingID) then
				unit:SetHasPromotion(unitPromotionSwissGuardHealingID, false)
				unit:SetHasPromotion(unitPromotionSwissGuardHealingInfoID, true)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_SwissGuardCapitalHealing)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_BlockChapels
--------------------------------------------------------------------------------------------------------------------------
local buildingChapelArtID		= GameInfoTypes["BUILDING_JFD_CHAPEL_ART"]
local buildingChapelMusicID		= GameInfoTypes["BUILDING_JFD_CHAPEL_MUSIC"]
local buildingChapelWritingID	= GameInfoTypes["BUILDING_JFD_CHAPEL_WRITING"]

function JFD_BlockChapels(playerID, cityID, buildingID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if buildingID == buildingChapelArtID then
		if player:GetCivilizationType() ~= civilisationID then
			return false
		else
			if not city:IsHasBuilding(buildingChapelWritingID) then
				return false 
			end
			
			local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
			if city:GetNumFollowers(religionID) < 7 then
				return
			end
		end
	end

	if buildingID == buildingChapelMusicID then
		if player:GetCivilizationType() ~= civilisationID then
			return false
		else
			if not (city:IsHasBuilding(buildingChapelArtID)) then
				return false
			end
			
			local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
			if city:GetNumFollowers(religionID) < 14 then
				return
			end
		end
	end
	
	return true
end
GameEvents.CityCanConstruct.Add(JFD_BlockChapels)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ChapelFaith
--------------------------------------------------------------------------------------------------------------------------
local buildingClassChapelArtID = GameInfoTypes["BUILDINGCLASS_JFD_CHAPEL_ART"]
local buildingClassChapelMusicID = GameInfoTypes["BUILDINGCLASS_JFD_CHAPEL_MUSIC"]
local buildingClassTempleID = GameInfoTypes["BUILDINGCLASS_TEMPLE"]

function JFD_GetNumChapelGreatWorksFilled(playerID)
	local player = Players[playerID]
	local numChapelGreatWorksFilled = 0
	for city in player:Cities() do
		if city:GetNumGreatWorksInBuilding(buildingClassTempleID) > 0 then
			numChapelGreatWorksFilled = numChapelGreatWorksFilled + 1
		end

		if city:GetNumGreatWorksInBuilding(buildingClassChapelMusicID) > 0 then
			numChapelGreatWorksFilled = numChapelGreatWorksFilled + 1
		end

		if city:GetNumGreatWorksInBuilding(buildingClassChapelArtID) > 0 then
			numChapelGreatWorksFilled = numChapelGreatWorksFilled + 1
		end
	end

	return numChapelGreatWorksFilled
end

local buildingChapelFaithID = GameInfoTypes["BUILDING_JFD_CHAPEL_FAITH"]

function JFD_ChapelFaith(playerID)
	 local player = Players[playerID]
	 if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		 local capital = player:GetCapitalCity()
		 if capital then
			local numFaith = JFD_GetNumChapelGreatWorksFilled(playerID)
			capital:SetNumRealBuilding(buildingChapelFaithID, numFaith)
		end
	end
end

if isPapalStatesCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_ChapelFaith)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AIDisciplePurchases
----------------------------------------------------------------------------------------------------------------------------
function JFD_AIDisciplePurchases(playerID)
	local player = Players[playerID]	
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID and (not player:IsHuman()) and (not player:IsBarbarian())) then
		local capital = player:GetCapitalCity()
		local faithCost = JFD_GetDiscipleCost(Game.GetActivePlayer())
		if player:GetFaith() >= faithCost then
			if JFD_GetRandom(1,100) <= 70 then
				player:InitUnit(unitDiscipleID, city:GetX(), city:GetY())
				player:ChangeFaith(-faithCost)

				local numTimesPurchased = GetPersistentProperty("JFD_PSNumTimesDisciplePurchased") or 0
				SetPersistentProperty(JFD_PSNumTimesDisciplePurchased, numTimesPurchased+1)
			end
		end
	end
end

if isPapalStatesCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_AIDisciplePurchases)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SendCanPurchaseNotification
----------------------------------------------------------------------------------------------------------------------------
function JFD_SendCanPurchaseNotification(playerID)
	local player = Players[playerID]	
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local faithCost = JFD_GetDiscipleCost(Game.GetActivePlayer())
		if player:GetFaith() >= faithCost then
			local numTimesPurchased = GetPersistentProperty("JFD_PSNumTimesDisciplePurchased") or 0
			local numTimesNotificationSent = GetPersistentProperty("JFD_PSNumTimesNotificationSent") or 0
			if numTimesNotificationSent < numTimesPurchased then
				Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], Locale.ConvertTextKey("TXT_KEY_WORLD_EVENTS_JFD_PAPAL_STATES_CAN_PURCHASE_DISCIPLE_HELP"), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENTS_JFD_PAPAL_STATES_CAN_PURCHASE_DISCIPLE"))
				SetPersistentProperty("JFD_PSNumTimesNotificationSent", numTimesNotificationSent+1)
			end
		end
	end
end

if isPapalStatesCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_SendCanPurchaseNotification)
end
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
--Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayer = Players[Game.GetActivePlayer()]
local isCityViewOpen = false
----------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateDisciplePurchaseProgress
----------------------------------------------------------------------------------------------------------------------------
function JFD_UpdateDisciplePurchaseProgress()
	Controls.UnitBackground:SetHide(true)
	Controls.UnitImage:SetHide(true)
	Controls.UnitButton:SetDisabled(true)
	Controls.UnitButton:LocalizeAndSetToolTip(nil)
	local city = UI.GetHeadSelectedCity()
	if (city and (not city:IsPuppet())) then
		local disciple = GameInfo.Units[unitDiscipleID]
		Controls.UnitBackground:SetHide(false)
		
		local faithProgress = activePlayer:GetFaith()
		local faithCost = JFD_GetDiscipleCost()
		local buttonText = Locale.ConvertTextKey("TXT_KEY_JFD_DISCIPLE_PURCHASE", faithProgress, faithCost)
		local buttonToolTipDisabled = Locale.ConvertTextKey("TXT_KEY_JFD_DISCIPLE_PURCHASE_TT_DISABLED")
		IconHookup(disciple.PortraitIndex, 64, disciple.IconAtlas, Controls.UnitImage)
		Controls.UnitImage:SetHide(false)
		Controls.UnitButton:SetText(buttonText)
		Controls.UnitButton:LocalizeAndSetToolTip(buttonToolTipDisabled)
		if faithProgress >= faithCost then
			local buttonToolTip = Locale.ConvertTextKey("TXT_KEY_JFD_DISCIPLE_PURCHASE_TT")
			Controls.UnitButton:SetDisabled(false)
			Controls.UnitButton:LocalizeAndSetToolTip(buttonToolTip)
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnPurchase
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnPurchase()
	local city = UI.GetHeadSelectedCity();
	if city then
		local disciple = GameInfo.Units[unitDiscipleID]
		local playerID = city:GetOwner()
		local cityID = city:GetID()
		local player = Players[playerID]
		local faithCost = JFD_GetDiscipleCost()
		player:InitUnit(unitDiscipleID, city:GetX(), city:GetY())
		player:ChangeFaith(-faithCost)

		local numTimesPurchased = GetPersistentProperty("JFD_PSNumTimesDisciplePurchased") or 0
		SetPersistentProperty("JFD_PSNumTimesDisciplePurchased", numTimesPurchased+1)
	end
	JFD_UpdateDisciplePurchaseProgress()
end
Controls.UnitButton:RegisterCallback(Mouse.eLClick, JFD_OnPurchase)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnEnterCityScreen
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnEnterCityScreen()
	isCityViewOpen = true
	JFD_UpdateDisciplePurchaseProgress()
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnExitCityScreen
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnExitCityScreen()
	isCityViewOpen = false
	JFD_UpdateDisciplePurchaseProgress()
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnNextCityScren
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnNextCityScren()
	if isCityViewOpen then
		JFD_UpdateDisciplePurchaseProgress()
	end
end

if (isPapalStatesCivActive and isPapalStatesActivePlayer) then
	Events.SerialEventEnterCityScreen.Add(JFD_OnEnterCityScreen)
	Events.SerialEventExitCityScreen.Add(JFD_OnExitCityScreen)
	Events.SerialEventCityScreenDirty.Add(JFD_OnNextCityScren)
end
--==========================================================================================================================
--==========================================================================================================================