-- JFD_EgyptAkhenaten_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("JFD_EgyptAkhenaten_Utils.lua")
include("NewSaveUtils.lua"); MY_MOD_NAME = "JFD_EgyptAkhenaten";
include("PlotIterators.lua")
include("UniqueDiplomacyUtilsV2.lua")
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

-- JFD_IsUsingPiety
function JFD_IsUsingPiety()
	local pietyModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	for _, mod in pairs(Modding.GetActivatedMods()) do
	   if (mod.ID == pietyModID) then
	      return true
	   end
	end
	return false
end
local isUsingPiety = JFD_IsUsingPiety()
--------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ConvertPlayerReligion
function JFD_ConvertPlayerReligion(player, religionID, percent)
	for city in player:Cities() do
		city:ConvertPercentFollowers(religionID, -1, percent)
		for row in GameInfo.Religions() do
			local otherReligionID = row.ID
			city:ConvertPercentFollowers(religionID, otherReligionID, percent)
		end
	end
end

-- JFD_GetMainReligionID
function JFD_GetMainReligionID(playerID)
	local player = Players[playerID]
	local religionID = -1
	if isUsingPiety then
		religionID = JFD_GetStateReligion(playerID)
	end
	if religionID == -1 then
		religionID = player:GetReligionCreatedByPlayer()
	end
	if religionID == -1 then
		religionID = player:GetCapitalCity():GetReligiousMajority()
	end
	return religionID
end

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID				= Game.GetActivePlayer()
local activePlayer					= Players[activePlayerID]
local civilizationID 				= GameInfoTypes["CIVILIZATION_JFD_EGYPT_AKHENATEN"]
local isEgyptAkhenatenCivActive		= JFD_IsCivilisationActive(civilizationID)
local isEgyptAkhenatenActivePlayer	= activePlayer:GetCivilizationType() == civilizationID
local isUsingPiety					= JFD_IsUsingPiety()
local mathCeil 						= math.ceil
if isEgyptAkhenatenCivActive then
	print("Pharaoh Akhenaten is in this game")
end
if isUsingPiety then
	include("JFD_PietyUtils.lua")
end
--==========================================================================================================================
-- DIPLOMACY FUNCTIONS
--==========================================================================================================================
-- DIPLOMACY
----------------------------------------------------------------------------------------------------------------------------
local civilizationNubiaID = GameInfoTypes["CIVILIZATION_MC_LITE_NUBIA"]
local leaderRamessesID 	  = GameInfoTypes["LEADER_RAMESSES"]
function JFD_Akhenaten_UniqueResponses()
	if (leaderRamessesID and activePlayer:GetLeaderType() == leaderRamessesID) then
		ChangeDiplomacyResponse("LEADER_JFD_AKHENATEN", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_AKHENATEN_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_AKHENATEN_FIRSTGREETING_RAMESSES_1", 500)
	-- If the player is MC's Nubia
	elseif (civilizationNubiaID and activePlayer:GetCivilizationType() == civilizationNubiaID) then
		ChangeDiplomacyResponse("LEADER_JFD_AKHENATEN", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_AKHENATEN_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_AKHENATEN_FIRSTGREETING_NUBIA_1", 500)
	end
end
for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
	local player = Players[playerID]
	if (player and player:IsAlive() and (not player:IsHuman()) and (player:GetCivilizationType() == civilizationID)) then
		Events.SequenceGameInitComplete.Add(JFD_Akhenaten_UniqueResponses)
		break
	end
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GREAT HYMN TO THE ATEN
----------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID	 = GameInfoTypes["ERA_RENAISSANCE"]
local unitGreatProphetID = GameInfoTypes["UNIT_PROPHET"]
-- JFD_EgyptAkhenaten_OnGreatProphetCreated
local promotionGreatProphetID = GameInfoTypes["PROMOTION_JFD_ATEN"]
function JFD_EgyptAkhenaten_OnGreatProphetCreated(playerID, unitID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local currentNumAtenVersesAvailable = JFD_GetNumVersesAvailable()
		if currentNumAtenVersesAvailable < 4 then
			local unit = player:GetUnitByID(unitID)
			local unitTypeID = unit:GetUnitType()
			if (unitTypeID == unitGreatProphetID and (not unit:IsHasPromotion(promotionGreatProphetID))) then
				unit:SetHasPromotion(promotionGreatProphetID, true)
				JFD_ChangeNumVersesAvailable(playerID)
			end
		end
    end
end
if isEgyptAkhenatenCivActive then
	Events.SerialEventUnitCreated.Add(JFD_EgyptAkhenaten_OnGreatProphetCreated)
end
----------------
-- UI
----------------
local addVerseToSlot = true
local currentCity	 = nil
local verseSlotIndex = 1

-- JFD_UpdateCitySizeValY
function JFD_UpdateCitySizeValY()
	if (not citySizeY) then
		if ContextPtr:LookUpControl("/InGame/CityView/CityInfoBG") then
			local cityInfoBG = ContextPtr:LookUpControl("/InGame/CityView/CityInfoBG")
			local cityInfoBGsizeY = cityInfoBG:GetSizeY()
			local newSizeY = cityInfoBGsizeY + 28
			SetPersistentProperty("JFD_CitySizeY", newSizeY)
		else
			local topLeftPanel = ContextPtr:LookUpControl("/InGame/CityView/TopLeft")
			local topLeftPanelSizeY = topLeftPanel:GetSizeY()
			local newSizeY = topLeftPanelSizeY + 34
			SetPersistentProperty("JFD_CitySizeY", newSizeY)
		end
	end
end

-- JFD_UpdateCapitalHymnBox
function JFD_UpdateCapitalHymnBox()
	local city = UI.GetHeadSelectedCity()
	if city then
		currentCity = city
		if Controls.VerseBox:IsHidden() then
			local cultureBox = ContextPtr:LookUpControl("/InGame/CityView/CultureBox")
			Controls.VerseBox:ChangeParent(cultureBox)
			Controls.VerseBox:SetHide(false)
			if ContextPtr:LookUpControl("/InGame/CityView/CityInfoBG") then
				local cityInfoBG = ContextPtr:LookUpControl("/InGame/CityView/CityInfoBG")
				local cityInfoBGSizeY = cityInfoBG:GetSizeY()
				local cityInfoBGNewSizeY = GetPersistentProperty("JFD_CitySizeY")
				if cityInfoBGSizeY < cityInfoBGNewSizeY then
					cityInfoBG:SetSizeY(cityInfoBGNewSizeY) 
				end
			else
				local topLeftPanel = ContextPtr:LookUpControl("/InGame/CityView/TopLeft")
				local topLeftPanelSizeY = topLeftPanel:GetSizeY()
				local topLeftPanelNewSizeY = GetPersistentProperty("JFD_CitySizeY")
				if topLeftPanelSizeY < topLeftPanelNewSizeY then
					topLeftPanel:SetSizeY(topLeftPanelNewSizeY) 
				end
			end
			if (not OptionsManager.GetSmallUIAssets()) then
				Controls.VerseBox:SetSizeVal(240,32)
				Controls.VerseLine:SetSizeVal(240,32)
			end
		end
		local numVersesAvailable = JFD_GetNumVersesAvailable()
		local numVersesUsed = JFD_GetNumAtenVersesUsed(activePlayerID)
		local numVersesUsedThisCity = JFD_GetNumAtenVersesUsedThisCity(activePlayerID, city)
		local numVersesUnassigned = (numVersesAvailable - numVersesUsed)
		Controls.VerseCount:LocalizeAndSetText("TXT_KEY_JFD_EGYPT_AKHEANTEN_VERSE_COUNT", numVersesUsedThisCity, numVersesUnassigned)
		Controls.VerseCount:LocalizeAndSetToolTip("TXT_KEY_JFD_EGYPT_AKHEANTEN_VERSE_COUNT_TT", numVersesUsedThisCity, numVersesUnassigned)
		for verseNum = 1, 4 do
			local numString = tostring(verseNum)
			local controlName = "VerseGreatWork"..numString
			local thisVerse = Controls[controlName]
			local hasVerse = JFD_HasVerse(activePlayerID, city, verseNum)
			if hasVerse then
				thisVerse:SetTexture("GreatWorks_Hymn.dds")
				thisVerse:LocalizeAndSetToolTip("TXT_KEY_JFD_EGYPT_AKHEANTEN_VERSE_FILLED_TT")
				if verseNum == 1 then
					thisVerse:RegisterCallback(Mouse.eRClick, JFD_ShowVersePopup1)
					thisVerse:RegisterCallback(Mouse.eLClick, JFD_RemoveVerse1)
					thisVerse:SetDisabled(false)
				elseif verseNum == 2 then
					thisVerse:RegisterCallback(Mouse.eRClick, JFD_ShowVersePopup2)
					thisVerse:RegisterCallback(Mouse.eLClick, JFD_RemoveVerse2)
					thisVerse:SetDisabled(false)
				elseif verseNum == 3 then
					thisVerse:RegisterCallback(Mouse.eRClick, JFD_ShowVersePopup3)
					thisVerse:RegisterCallback(Mouse.eLClick, JFD_RemoveVerse3)
					thisVerse:SetDisabled(false)
				elseif verseNum == 4 then
					thisVerse:RegisterCallback(Mouse.eRClick, JFD_ShowVersePopup4)
					thisVerse:RegisterCallback(Mouse.eLClick, JFD_RemoveVerse4)
					thisVerse:SetDisabled(false)
				end
			else
				thisVerse:SetTexture("GreatWorks_Hymn_Empty.dds")
				thisVerse:SetDisabled(true)
				thisVerse:LocalizeAndSetToolTip("TXT_KEY_JFD_EGYPT_AKHEANTEN_VERSE_DISABLED_TT_".. verseNum)
				local verseLocation = JFD_FindVerseLocation(activePlayerID, verseNum)
				if (not verseLocation) then
					if numVersesAvailable >= verseNum then
						thisVerse:LocalizeAndSetToolTip("TXT_KEY_JFD_EGYPT_AKHEANTEN_VERSE_UNFILLED_TT_".. verseNum)
						thisVerse:SetDisabled(false)
					end
				else
					local cityName = verseLocation:GetName()
					thisVerse:LocalizeAndSetToolTip("TXT_KEY_JFD_EGYPT_AKHEANTEN_VERSE_UNFILLED_OTHER_CITY_TT_".. verseNum, cityName)
				end
				if numVersesUnassigned > 0 then
					if verseNum == 1 then
						thisVerse:RegisterCallback(Mouse.eLClick, JFD_AddVerse1)
						thisVerse:ClearCallback(Mouse.eRClick)
					elseif verseNum == 2 then
						thisVerse:RegisterCallback(Mouse.eLClick, JFD_AddVerse2)
						thisVerse:ClearCallback(Mouse.eRClick)
					elseif verseNum == 3 then
						thisVerse:RegisterCallback(Mouse.eLClick, JFD_AddVerse3)
						thisVerse:ClearCallback(Mouse.eRClick)
					elseif verseNum == 4 then
						thisVerse:RegisterCallback(Mouse.eLClick, JFD_AddVerse4)
						thisVerse:ClearCallback(Mouse.eRClick)
					end
					if numVersesAvailable >= verseNum then
						thisVerse:SetDisabled(false)
					end
				end
			end
			local hasCompleteHymn = JFD_HasCompleteHymn(playerID, city)
			if hasCompleteHymn then
				Controls.VerseGreatWorkHL1:SetHide(false)
				Controls.VerseGreatWorkHL2:SetHide(false)
				Controls.VerseGreatWorkHL3:SetHide(false)
				Controls.VerseGreatWorkHL4:SetHide(false)
				Controls.VerseCount:LocalizeAndSetToolTip("TXT_KEY_JFD_EGYPT_AKHEANTEN_VERSE_COUNT_COMPLETE_TT")
				JFD_PlaceObeliskWheat(activePlayerID, city)
			else
				Controls.VerseGreatWorkHL1:SetHide(true)
				Controls.VerseGreatWorkHL2:SetHide(true)
				Controls.VerseGreatWorkHL3:SetHide(true)
				Controls.VerseGreatWorkHL4:SetHide(true)
				JFD_RemoveObeliskWheat(activePlayerID, city)
			end
		end
	else
		Controls.VerseBox:SetHide(true)
	end
end
if isEgyptAkhenatenActivePlayer then
	Events.LoadScreenClose.Add(JFD_UpdateCitySizeValY)
	Events.SerialEventEnterCityScreen.Add(JFD_UpdateCapitalHymnBox)
	Events.SerialEventCityScreenDirty.Add(JFD_UpdateCapitalHymnBox)
end
----------------
-- ASSIGN VERSE
----------------
-- JFD_AddVerse1
function JFD_AddVerse1()
	addVerseToSlot = true
	verseSlotIndex = 1
	Controls.ChooseConfirm:SetHide(false)
	Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_JFD_EGYPT_AKHEANTEN_CONFIRM_TEXT_ADD")
end

-- JFD_AddVerse2
function JFD_AddVerse2()
	addVerseToSlot = true
	verseSlotIndex = 2
	Controls.ChooseConfirm:SetHide(false)
	Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_JFD_EGYPT_AKHEANTEN_CONFIRM_TEXT_ADD")
end

-- JFD_AddVerse3
function JFD_AddVerse3()
	addVerseToSlot = true
	verseSlotIndex = 3
	Controls.ChooseConfirm:SetHide(false)
	Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_JFD_EGYPT_AKHEANTEN_CONFIRM_TEXT_ADD")
end

-- JFD_AddVerse4
function JFD_AddVerse4()
	addVerseToSlot = true
	verseSlotIndex = 4
	Controls.ChooseConfirm:SetHide(false)
	Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_JFD_EGYPT_AKHEANTEN_CONFIRM_TEXT_ADD")
end

-- JFD_RemoveVerse1
function JFD_RemoveVerse1()
	addVerseToSlot = false
	verseSlotIndex = 1
	Controls.ChooseConfirm:SetHide(false)
	Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_JFD_EGYPT_AKHEANTEN_CONFIRM_TEXT_REMOVE")
end

-- JFD_RemoveVerse2
function JFD_RemoveVerse2()
	addVerseToSlot = false
	verseSlotIndex = 2
	Controls.ChooseConfirm:SetHide(false)
	Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_JFD_EGYPT_AKHEANTEN_CONFIRM_TEXT_REMOVE")
end

-- JFD_RemoveVerse3
function JFD_RemoveVerse3()
	addVerseToSlot = false
	verseSlotIndex = 3
	Controls.ChooseConfirm:SetHide(false)
	Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_JFD_EGYPT_AKHEANTEN_CONFIRM_TEXT_REMOVE")
end

-- JFD_RemoveVerse4
function JFD_RemoveVerse4()
	addVerseToSlot = false
	verseSlotIndex = 4
	Controls.ChooseConfirm:SetHide(false)
	Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_JFD_EGYPT_AKHEANTEN_CONFIRM_TEXT_REMOVE")
end

-- JFD_ShowVersePopup1
function JFD_ShowVersePopup1()
	LuaEvents.JFD_ShowVersePopup(1)
end
-- JFD_ShowVersePopup2
function JFD_ShowVersePopup2()
	LuaEvents.JFD_ShowVersePopup(2)
end
-- JFD_ShowVersePopup3
function JFD_ShowVersePopup3()
	LuaEvents.JFD_ShowVersePopup(3)
end
-- JFD_ShowVersePopup4
function JFD_ShowVersePopup4()
	LuaEvents.JFD_ShowVersePopup(4)
end
----------------
-- CONFIRMATION
----------------
-- JFD_OnConfirmYes
function JFD_OnConfirmYes()
	local city = currentCity
	if addVerseToSlot then
		JFD_SetHasVerse(activePlayerID, city, verseSlotIndex, 1)
		local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
		Events.GameplayFX(hex.x, hex.y, -1)
	else
		JFD_SetHasVerse(activePlayerID, city, verseSlotIndex, 0)
	end
	Controls.ChooseConfirm:SetHide(true)
	JFD_UpdateCapitalHymnBox()
end
Controls.ConfirmYes:RegisterCallback(Mouse.eLClick, JFD_OnConfirmYes)

-- JFD_OnConfirmNo
function JFD_OnConfirmNo()
	Controls.ChooseConfirm:SetHide(true)
end
Controls.ConfirmNo:RegisterCallback(Mouse.eLClick, JFD_OnConfirmNo)

-- JFD_EgyptAkhenaten_CityCaptured
function JFD_EgyptAkhenaten_CityCaptured(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[oldOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local capturedCity = Map.GetPlot(plotX, plotY):GetPlotCity()
		JFD_RemoveObeliskWheat(activePlayerID, capturedCity)
	end
end
if isEgyptAkhenatenCivActive then
	GameEvents.CityCaptureComplete.Add(JFD_EgyptAkhenaten_CityCaptured)
end
----------------------------------------------------------------------------------------------------------------------------
-- OBELISK
----------------------------------------------------------------------------------------------------------------------------
-- JFD_EgyptAkhenaten_OnObeliskConstructed
local improvementObeliskID = GameInfoTypes["IMPROVEMENT_JFD_OBELISK"]
local resourceWheatID = GameInfoTypes["RESOURCE_JFD_WHEAT"]
function JFD_EgyptAkhenaten_OnObeliskConstructed(playerID, plotX, plotY, improvementID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		if improvementID == improvementObeliskID then
			if JFD_HasCompleteHymn(playerID) then
				for city in player:Cities() do
					local hasCompleteHymn = JFD_HasCompleteHymn(playerID, city)
					if hasCompleteHymn then
						JFD_PlaceObeliskWheat(playerID, city)
						break
					end
				end
			end
		else
			local plot = Map.GetPlot(plotX, plotY)
			if plot:GetResourceType() == resourceWheatID then
				adjacentPlot:SetResourceType(-1)
				local hex = ToHexFromGrid(Vector2(adjacentPlot:GetX(), adjacentPlot:GetY()))
				LuaEvents.SerialEventRawResourceIconDestroyed(hex.x, hex.y)
			end
		end 
	end
end
if isEgyptAkhenatenCivActive then
	GameEvents.BuildFinished.Add(JFD_EgyptAkhenaten_OnObeliskConstructed)
end
----------------------------------------------------------------------------------------------------------------------------
-- KOPESH
----------------------------------------------------------------------------------------------------------------------------
local unitPromotionKhopeshID = GameInfoTypes["PROMOTION_JFD_KHOPESH"] 
local unitPromotionKhopeshDoubleID = GameInfoTypes["PROMOTION_JFD_KHOPESH_DOUBLE"] 

function JFD_EgyptAkhenaten_Khopesh(playerID, unitID, plotX, plotY)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian()) and (not player:IsMinorCiv())) then
		local unit = player:GetUnitByID(unitID)
		if (unit:IsHasPromotion(unitPromotionKhopeshID) or unit:IsHasPromotion(unitPromotionKhopeshDoubleID)) then
			local isUnitNearToObelisk = false
			if isUsingCPDLL then
				isUnitNearToObelisk = unit:IsWithinDistanceOfImprovement(improvementObeliskID, 2)
			else
				local unitPlot = unit:GetPlot()
				for adjacentPlot in PlotAreaSweepIterator(unitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
					isUnitNearToObelisk = (adjacentPlot:GetImprovementType() == improvementObeliskID)
					if isUnitNearToObelisk == true then 
						break
					end
				end
			end
			if isUnitNearToObelisk then
				if unit:IsHasPromotion(unitPromotionKhopeshID) then
					unit:SetHasPromotion(unitPromotionKhopeshID, false)
					unit:SetHasPromotion(unitPromotionKhopeshDoubleID, true)
				end
			else
				if unit:IsHasPromotion(unitPromotionKhopeshDoubleID) then
					unit:SetHasPromotion(unitPromotionKhopeshID, true)
					unit:SetHasPromotion(unitPromotionKhopeshDoubleID, false)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_EgyptAkhenaten_Khopesh)
--==========================================================================================================================
--==========================================================================================================================