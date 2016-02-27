-- JFD_FranceLouisXIV_Functions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("CommonBehaviors")
include("IconSupport.lua")
include("NewSaveUtils.lua"); MY_MOD_NAME = "LouisFrance";
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("UniqueDiplomacyUtilsV2.lua")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
--------------------------------------------------------------------------------------------------------------------------
-- UTILS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

-- JFD_GetNumPuppets
function JFD_GetNumPuppets(playerID)
	local player = Players[playerID]
	local numPuppets = 0 
	for city in player:Cities() do
		if city:IsPuppet() then
			numPuppets = numPuppets + 1
		end
	end
	return numPuppets*2
end

-- JFD_GetNumWonders
function JFD_GetNumWonders(playerID)
	local numWonders = 0
	for buildingClass in GameInfo.BuildingClasses() do
		if buildingClass.MaxGlobalInstances == 1 then
			local buildingID = GameInfoTypes[buildingClass.DefaultBuilding]
			if city:IsHasBuilding(buildingID) then
				numGPP = numGPP + 1
			end
		end
	end
	return numWonders*2
end
--------------------------------------------------------------------------------------------------------------------------
-- USER SETTINGS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
local civilizationID	   = GameInfoTypes["CIVILIZATION_FRANCE"]
local isFranceCivActive    = JFD_IsCivilisationActive(civilizationID)
local isFranceActivePlayer = activePlayer:GetCivilizationType() == civilizationID
local userSettingFranceUA  = JFD_GetUserSetting("JFD_CIVILIZATIONS_FRANCE_LOUIS_XIV_UA") == 1
if isFranceCivActive then
	print("King Majesty-Fabulous-Sexy-Marvellous Louis XIV is in this game")
end
--==========================================================================================================================
-- DIPLOMACY FUNCTIONS
--==========================================================================================================================
-- DIPLOMACY
----------------------------------------------------------------------------------------------------------------------------
local leaderAkhenatenID = GameInfoTypes["LEADER_JFD_AKHENATEN"]
local leaderFrederickAugustusID = GameInfoTypes["LEADER_JFD_FREDERICK_AUGUSTUS_I"]
local leaderGediminasID = GameInfoTypes["LEADER_JFD_GEDIMINAS"]
local leaderHenryVIIIID = GameInfoTypes["LEADER_JFD_HENRY_VIII"]
local leaderLudwigIIID = GameInfoTypes["LEADER_JFD_LUDWIG_II"]
local leaderPiusIXID = GameInfoTypes["LEADER_JFD_PIUS_IX"]
function JFD_LouisXIV_UniqueResponses()
	if (leaderFrederickAugustusID and activePlayer:GetLeaderType() == leaderFrederickAugustusID) then
		ChangeDiplomacyResponse("LEADER_JFD_LOUIS_XIV", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_LOUIS_XIV_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_LOUIS_XIV_FREDERICK_AUGUSTUS_I_FIRSTGREETING_1", 500)
	elseif(leaderAkhenatenID and activePlayer:GetLeaderType() == leaderAkhenatenID) then
		ChangeDiplomacyResponse("LEADER_JFD_LOUIS_XIV", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_LOUIS_XIV_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_LOUIS_XIV_AKHENATEN_FIRSTGREETING_1", 500)
	elseif(leaderPiusIXID and activePlayer:GetLeaderType() == leaderGediminasID) then
		ChangeDiplomacyResponse("LEADER_JFD_LOUIS_XIV", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_LOUIS_XIV_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_LOUIS_XIV_GEDIMINAS_FIRSTGREETING_1", 500)
	elseif(leaderPiusIXID and activePlayer:GetLeaderType() == leaderHenryVIIIID) then
		ChangeDiplomacyResponse("LEADER_JFD_LOUIS_XIV", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_LOUIS_XIV_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_LOUIS_XIV_HENRY_VIII_FIRSTGREETING_1", 500)
	elseif(leaderPiusIXID and activePlayer:GetLeaderType() == leaderLudwigIIID) then
		ChangeDiplomacyResponse("LEADER_JFD_LOUIS_XIV", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_LOUIS_XIV_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_LOUIS_XIV_LUDWIG_II_FIRSTGREETING_1", 500)
	elseif(leaderPiusIXID and activePlayer:GetLeaderType() == leaderPiusIXID) then
		ChangeDiplomacyResponse("LEADER_JFD_LOUIS_XIV", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_LOUIS_XIV_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_LOUIS_XIV_PIUS_IX_FIRSTGREETING_1", 500)
	end
end
for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
	local player = Players[playerID]
	if (player and player:IsAlive() and (not player:IsHuman()) and (player:GetCivilizationType() == civilizationID)) then
		Events.SequenceGameInitComplete.Add(JFD_LouisXIV_UniqueResponses)
		break
	end
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- THE SUN KING
----------------------------------------------------------------------------------------------------------------------------
-- JFD_France_CGPP
local specialistArtistID   = GameInfoTypes["SPECIALIST_ARTIST"]
local specialistMusicianID = GameInfoTypes["SPECIALIST_MUSICIAN"]
local specialistWriterID   = GameInfoTypes["SPECIALIST_WRITER"]
function JFD_France_CGPP(playerID)
	local player = Players[playerID];
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		local capital = player:GetCapitalCity() 
		if (capital and capital:GetWeLoveTheKingDayCounter() > 0) then
			local numPuppets = 0
			local numWonders = 0
			if isUsingCPDLL then
				numPuppets = player:GetNumPuppetCities()*2
				numWonders = player:GetNumWonders()*2
			else
				numPuppets = JFD_GetNumPuppets(playerID)
				numWonders = JFD_GetNumWonders(playerID)
			end
			local numGPPs = (numPuppets+numWonders)*100
			if numGPPs > 0 then
				local specialistID = GetPersistentProperty("JFD_France_SpecialistID") or specialistMusicianID
				capital:ChangeSpecialistGreatPersonProgressTimes100(specialistID, numGPPs)
			end
		end
	end
end
if (isFranceCivActive and userSettingFranceUA) then
	GameEvents.PlayerDoTurn.Add(JFD_France_CGPP)
end
---------------
-- UI
---------------
local isCityViewOpen = false
-- JFD_France_UpdateCGPOptions
function JFD_France_UpdateCGPOptions()
	Controls.FranceBox:SetHide(true)
	Controls.ArtistButton:LocalizeAndSetToolTip(nil)
	Controls.MusicianButton:LocalizeAndSetToolTip(nil)
	Controls.WriterButton:LocalizeAndSetToolTip(nil)
	local city = UI.GetHeadSelectedCity()
	if (city and city:IsCapital()) then
		Controls.FranceBox:SetHide(false)
		local isDisabled = true
		local numPuppets = 0
		local numWonders = 0
		if isUsingCPDLL then
			numPuppets = activePlayer:GetNumPuppetCities()
			numWonders = activePlayer:GetNumWonders()
		else
			numPuppets = JFD_GetNumPuppets(activePlayerID)
			numWonders = JFD_GetNumWonders(activePlayerID)
		end
		local numGPPs = (numPuppets+numWonders)
		local specialistID = GetPersistentProperty("JFD_France_SpecialistID") or specialistMusicianID
		IconHookup(6, 64, "EXPANSION2_UNIT_ATLAS", Controls.ArtistImage)
		IconHookup(7, 64, "EXPANSION2_UNIT_ATLAS", Controls.MusicianImage)
		IconHookup(8, 64, "EXPANSION2_UNIT_ATLAS", Controls.WriterImage)
		Controls.ArtistButton:LocalizeAndSetText("TXT_KEY_JFD_LOUIS_BUTTON", "TXT_KEY_UNIT_GREAT_ARTIST")
		Controls.MusicianButton:LocalizeAndSetText("TXT_KEY_JFD_LOUIS_BUTTON", "TXT_KEY_UNIT_GREAT_MUSICIAN")
		Controls.WriterButton:LocalizeAndSetText("TXT_KEY_JFD_LOUIS_BUTTON", "TXT_KEY_UNIT_GREAT_WRITER")
		if specialistID == specialistArtistID then
			Controls.ArtistButton:SetDisabled(true)
			Controls.ArtistButton:LocalizeAndSetText("TXT_KEY_JFD_LOUIS_BUTTON_HL", "TXT_KEY_UNIT_GREAT_ARTIST")
			Controls.ArtistButton:LocalizeAndSetToolTip("TXT_KEY_JFD_LOUIS_BUTTON_TT", numGPPs, "TXT_KEY_UNIT_GREAT_ARTIST")
			Controls.MusicianButton:SetDisabled(false)
			Controls.WriterButton:SetDisabled(false)
		elseif specialistID == specialistMusicianID then
			Controls.ArtistButton:SetDisabled(false)
			Controls.MusicianButton:SetDisabled(true)
			Controls.MusicianButton:LocalizeAndSetText("TXT_KEY_JFD_LOUIS_BUTTON_HL", "TXT_KEY_UNIT_GREAT_MUSICIAN")
			Controls.MusicianButton:LocalizeAndSetToolTip("TXT_KEY_JFD_LOUIS_BUTTON_TT", numGPPs, "TXT_KEY_UNIT_GREAT_MUSICIAN")
			Controls.WriterButton:SetDisabled(false)
		elseif specialistID == specialistWriterID then
			Controls.ArtistButton:SetDisabled(false)
			Controls.MusicianButton:SetDisabled(false)
			Controls.WriterButton:SetDisabled(true)
			Controls.WriterButton:LocalizeAndSetText("TXT_KEY_JFD_LOUIS_BUTTON_HL", "TXT_KEY_UNIT_GREAT_WRITER")
			Controls.WriterButton:LocalizeAndSetToolTip("TXT_KEY_JFD_LOUIS_BUTTON_TT", numGPPs, "TXT_KEY_UNIT_GREAT_WRITER")
		end
	end
end

-- JFD_France_OnArtistButton
function JFD_France_OnArtistButton()
	local city = UI.GetHeadSelectedCity()
	if city then
		SetPersistentProperty("JFD_France_SpecialistID", specialistArtistID)
		JFD_France_UpdateCGPOptions()
	end
end
if (isFranceCivActive and isFranceActivePlayer and userSettingFranceUA) then
	Controls.ArtistButton:RegisterCallback(Mouse.eLClick, JFD_France_OnArtistButton)
end

-- JFD_France_OnMusicianButton
function JFD_France_OnMusicianButton()
	local city = UI.GetHeadSelectedCity()
	if city then
		SetPersistentProperty("JFD_France_SpecialistID", specialistMusicianID)
		JFD_France_UpdateCGPOptions()
	end
end
if (isFranceCivActive and isFranceActivePlayer and userSettingFranceUA) then
	Controls.MusicianButton:RegisterCallback(Mouse.eLClick, JFD_France_OnMusicianButton)
end

-- JFD_France_OnWriterButton
function JFD_France_OnWriterButton()
	local city = UI.GetHeadSelectedCity()
	if city then
		SetPersistentProperty("JFD_France_SpecialistID", specialistWriterID)
		JFD_France_UpdateCGPOptions()
	end
end
if (isFranceCivActive and isFranceActivePlayer and userSettingFranceUA) then
	Controls.WriterButton:RegisterCallback(Mouse.eLClick, JFD_France_OnWriterButton)
end

-- JFD_OnEnterCityScreen
function JFD_OnEnterCityScreen()
	isCityViewOpen = true
	JFD_France_UpdateCGPOptions()
end

-- JFD_OnExitCityScreen
function JFD_OnExitCityScreen()
	isCityViewOpen = false
	JFD_France_UpdateCGPOptions()
end

-- JFD_OnNextCityScren
function JFD_OnNextCityScren()
	if isCityViewOpen then
		JFD_France_UpdateCGPOptions()
	end
end
if (isFranceCivActive and isFranceActivePlayer and userSettingFranceUA) then
	Events.SerialEventEnterCityScreen.Add(JFD_OnEnterCityScreen)
	Events.SerialEventExitCityScreen.Add(JFD_OnExitCityScreen)
	Events.SerialEventCityScreenDirty.Add(JFD_OnNextCityScren)
end
----------------------------------------------------------------------------------------------------------------------------
-- CHATEAU
----------------------------------------------------------------------------------------------------------------------------
--JFD_France_Chateau
local improvementChateauID = GameInfoTypes["IMPROVEMENT_CHATEAU"]
function JFD_France_Chateau(playerID, plotX, plotY, improvementID)
	if improvementID == improvementChateauID then
		local player = Players[playerID]
		player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(5)
	end
end
if isFranceCivActive then
	GameEvents.BuildFinished.Add(JFD_France_Chateau)
end
--==========================================================================================================================
--==========================================================================================================================