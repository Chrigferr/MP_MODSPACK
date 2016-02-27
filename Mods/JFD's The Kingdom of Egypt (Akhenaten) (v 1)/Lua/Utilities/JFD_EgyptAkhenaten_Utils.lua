-- JFD_EgyptAkhenaten_Utils
-- Author: JFD
-- DateCreated: 8/14/2015 9:23:10 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators.lua")
include("NewSaveUtils.lua"); MY_MOD_NAME = "JFD_EgyptAkhenaten";
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
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
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID				= Game.GetActivePlayer()
local activePlayer					= Players[activePlayerID]
local convertTextKey				= Locale.ConvertTextKey
local civilizationEgyptAkhenatenID 	= GameInfoTypes["CIVILIZATION_JFD_EGYPT_AKHENATEN"]
local mathCeil 						= math.ceil
local mathMin 						= math.min
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- UTILITIES
----------------------------------------------------------------------------------------------------------------------------
local buildingVerse1ID = GameInfoTypes["BUILDING_JFD_ATEN_VERSE_1"]
local buildingVerse2ID = GameInfoTypes["BUILDING_JFD_ATEN_VERSE_2"]
local buildingVerse3ID = GameInfoTypes["BUILDING_JFD_ATEN_VERSE_3"]
local buildingVerse4ID = GameInfoTypes["BUILDING_JFD_ATEN_VERSE_4"]

local improvementObeliskID	= GameInfoTypes["IMPROVEMENT_JFD_OBELISK"]
local resourceWheatID = GameInfoTypes["RESOURCE_JFD_WHEAT"]

-- JFD_PlaceObeliskWheat
function JFD_PlaceObeliskWheat(playerID, city)
	local cityX = city:GetX()
	local cityY = city:GetY()
	local cityPlot = Map.GetPlot(cityX, cityY)
	for adjacentPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if (adjacentPlot:GetImprovementType() == improvementObeliskID and adjacentPlot:GetResourceType() == -1) then
			local adjacentPlotX = adjacentPlot:GetX()
			local adjacentPlotY = adjacentPlot:GetY()
			local hex = ToHexFromGrid(Vector2(adjacentPlotX, adjacentPlotY))
			adjacentPlot:SetResourceType(resourceWheatID, 1)
			LuaEvents.SerialEventRawResourceIconRestored(hex.x, hex.y, adjacentPlotX, adjacentPlotY, resourceWheatID)
			local player = Players[playerID]
			if player:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+[ICON_RES_WHEAT]"), true)
				Events.GameplayFX(hex.x, hex.y, -1)
			end
		end
	end
end

-- JFD_RemoveObeliskWheat
function JFD_RemoveObeliskWheat(playerID, city)
	local cityX = city:GetX()
	local cityY = city:GetY()
	local cityPlot = Map.GetPlot(cityX, cityY)
	for adjacentPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if (adjacentPlot:GetImprovementType() == improvementObeliskID and adjacentPlot:GetResourceType() == resourceWheatID) then
			local hex = ToHexFromGrid(Vector2(adjacentPlot:GetX(), adjacentPlot:GetY()))
			adjacentPlot:SetResourceType(-1)
			LuaEvents.SerialEventRawResourceIconDestroyed(hex.x, hex.y)
			local player = Players[playerID]
			if player:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("-[ICON_RES_WHEAT]"), true)
				Events.GameplayFX(hex.x, hex.y, -1)
			end
		end
	end	
end

-- JFD_GetNumVersesAvailable
function JFD_GetNumVersesAvailable()
	return GetPersistentProperty("JFD_NumVersesAvailable") or 0
end

-- JFD_ChangeNumVersesAvailable
local unitProphetID = GameInfoTypes["UNIT_PROPHET"]
function JFD_ChangeNumVersesAvailable(playerID)
	local currentNumAtenVersesAvailable = JFD_GetNumVersesAvailable()
	local newNumAtenVersesAvailable = (currentNumAtenVersesAvailable+1)
	if newNumAtenVersesAvailable > 4 then return end
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	local numVerse = JFD_GetNumAtenVersesUsed(playerID)+1
	JFD_SetHasVerse(playerID, capital, numVerse, 1)
	if playerID == activePlayerID then
		activePlayer:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_ATEN_NEW_VERSE"), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_ATEN_NEW_VERSE_SHORT"), -1, -1, unitProphetID)
	end
	SetPersistentProperty("JFD_NumVersesAvailable", newNumAtenVersesAvailable)
end

-- JFD_FindCompleteVerseLocation
function JFD_FindCompleteVerseLocation(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if JFD_HasCompleteHymn(playerID, city) then
			return city
		end
	end
end

-- JFD_FindVerseLocation
function JFD_FindVerseLocation(playerID, verseNum)
	local player = Players[playerID]
	for city in player:Cities() do
		if JFD_HasVerse(playerID, city, verseNum) then
			return city
		end
	end
end

-- JFD_GetNumAtenVersesUsed
function JFD_GetNumAtenVersesUsed(playerID)
	local player = Players[playerID]
	local numAtenVersesUsed = 0
	for verseNum = 1, 4 do
		local buildingVerseID = GameInfoTypes["BUILDING_JFD_ATEN_VERSE_" .. verseNum]
		numAtenVersesUsed = numAtenVersesUsed + player:CountNumBuildings(buildingVerseID)
	end
	return numAtenVersesUsed
end

-- JFD_GetNumAtenVersesUsedThisCity
function JFD_GetNumAtenVersesUsedThisCity(playerID, city)
	local player = Players[playerID]
	local numAtenVersesUsed = 0
	for verseNum = 1, 4 do
		local buildingVerseID = GameInfoTypes["BUILDING_JFD_ATEN_VERSE_" .. verseNum]
		numAtenVersesUsed = numAtenVersesUsed + city:GetNumBuilding(buildingVerseID)
	end
	return numAtenVersesUsed
end

-- JFD_HasVerse
function JFD_HasVerse(playerID, city, verseNum)
	local buildingVerseID = GameInfoTypes["BUILDING_JFD_ATEN_VERSE_" .. verseNum]
	return city:GetNumBuilding(buildingVerseID) > 0
end

-- JFD_HasCompleteHymn
function JFD_HasCompleteHymn(playerID, city)
	if city then
		return JFD_GetNumAtenVersesUsedThisCity(playerID, city) >= 4
	else
		return JFD_GetNumAtenVersesUsed(playerID) >= 4
	end
end

-- JFD_SetHasVerse
function JFD_SetHasVerse(playerID, city, verseNum, num)
	local player = Players[playerID]
	local buildingVerseID = GameInfoTypes["BUILDING_JFD_ATEN_VERSE_" .. verseNum]
	city:SetNumRealBuilding(buildingVerseID, num)
	for otherCity in player:Cities() do
		if otherCity:GetID() ~= city:GetID() then
			otherCity:SetNumRealBuilding(buildingVerseID, 0)
		end
	end
end
--==========================================================================================================================
--==========================================================================================================================