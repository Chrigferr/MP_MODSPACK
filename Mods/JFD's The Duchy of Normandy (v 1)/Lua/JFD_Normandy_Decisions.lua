-- JFD_Normandy_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Normandy Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsHasConqueredMajorCapital
function JFD_IsHasConqueredMajorCapital(playerID)
	local player = Players[playerID]
	local numConqueredCapitals = 0
	for city in player:Cities() do
		if city:GetOriginalOwner() ~= playerID then
			if city:IsOriginalCapital() then
				return true
			end
		end
	end
end

-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_NORMANDY"]
local eraMedievalID	= GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Normandy: Confirm Norman Aristocracy
-------------------------------------------------------------------------------------------------------------------------
local buildingCastleID = GameInfoTypes["BUILDING_CASTLE"]
local Decisions_JFD_Normandy_Aristocracy = {}
	Decisions_JFD_Normandy_Aristocracy.Name = "TXT_KEY_DECISIONS_JFD_NORMANDY_NORMAN_ARISTOCRACY"
	Decisions_JFD_Normandy_Aristocracy.Desc = "TXT_KEY_DECISIONS_JFD_NORMANDY_NORMAN_ARISTOCRACY_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Normandy_Aristocracy, "CIVILIZATION_JFD_NORMANDY")
	Decisions_JFD_Normandy_Aristocracy.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_JFD_Normandy_Aristocracy") == true then
			Decisions_JFD_Normandy_Aristocracy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NORMANDY_NORMAN_ARISTOCRACY_ENACTED_DESC")
			return false, false, true
		end
		local playerID = player:GetID()
		local numCastles = player:CountNumBuildings(buildingCastleID)+1
		local goldCost = mathCeil((200*numCastles)*iMod)
		Decisions_JFD_Normandy_Aristocracy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NORMANDY_NORMAN_ARISTOCRACY_DESC", goldCost)
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if (not JFD_IsHasConqueredMajorCapital(playerID)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Normandy_Aristocracy.DoFunc = (
	function(player)
		local numCastles = player:CountNumBuildings(buildingCastleID)+1
		local goldCost = mathCeil((200*numCastles)*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		save(player, "Decisions_JFD_Normandy_Aristocracy", true)
	end
	)

	Decisions_JFD_Normandy_Aristocracy.Monitors = {}
	Decisions_JFD_Normandy_Aristocracy.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilizationID then return end
		if load(player, "Decisions_JFD_Normandy_Aristocracy") == true then
			for city in player:Cities() do
				if city:GetResistanceTurns() > 0 then
					if city:IsHasBuilding(buildingCastleID) then
						local newResistanceTurns = (city:GetResistanceTurns()*50)/100
						city:ChangeResistanceTurns(-newResistanceTurns)
					end
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Normandy_Aristocracy", Decisions_JFD_Normandy_Aristocracy)
-------------------------------------------------------------------------------------------------------------------------
-- Normandy: Construct the Doomsday Book
-------------------------------------------------------------------------------------------------------------------------
local policyNormandyDoomsdayBookID = GameInfoTypes["POLICY_DECISIONS_JFD_NORMANDY_DOOMSDAY_BOOK"]
local Decisions_JFD_Normandy_DoomsdayBook = {}
	Decisions_JFD_Normandy_DoomsdayBook.Name = "TXT_KEY_DECISIONS_JFD_NORMANDY_DOOMSDAY_BOOK"
	Decisions_JFD_Normandy_DoomsdayBook.Desc = "TXT_KEY_DECISIONS_JFD_NORMANDY_DOOMSDAY_BOOK_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Normandy_DoomsdayBook, "CIVILIZATION_JFD_NORMANDY")
	Decisions_JFD_Normandy_DoomsdayBook.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyNormandyDoomsdayBookID) then
			Decisions_JFD_Normandy_DoomsdayBook.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NORMANDY_DOOMSDAY_BOOK_ENACTED_DESC")
			return false, false, true 
		end
		local playerID = player:GetID()
		local numCourthouses = player:CountNumBuildings(buildingCourthouseID)+1
		local goldCost = mathCeil((50*numCourthouses)*iMod)
		Decisions_JFD_Normandy_DoomsdayBook.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NORMANDY_DOOMSDAY_BOOK_DESC", goldCost)
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if (not JFD_IsHasConqueredMajorCapital(playerID)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Normandy_DoomsdayBook.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local numCourthouses = player:CountNumBuildings(buildingCourthouseID)+1
		local goldCost = mathCeil((50*numCourthouses)*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeGold(-goldCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyNormandyDoomsdayBookID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NORMANDY_DOOMSDAY_BOOK", player:GetName())) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Normandy_DoomsdayBook", Decisions_JFD_Normandy_DoomsdayBook)
--=======================================================================================================================
--=======================================================================================================================
