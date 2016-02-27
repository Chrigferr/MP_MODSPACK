-- JFD_PapalStates_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Papal States Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
-------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_PAPAL_STATES"]
local isUsingPietyPrestige	= JFD_IsUsingPietyPrestige()
local mathCeil				= math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Papal States: Declare the Kingdom of God
-------------------------------------------------------------------------------------------------------------------------
local unitDiscipleID = GameInfoTypes["UNIT_JFD_DISCIPLE"]

local Decisions_KingdomofGod = {}
	Decisions_KingdomofGod.Name = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD"
	Decisions_KingdomofGod.Desc = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC"
	HookDecisionCivilizationIcon(Decisions_KingdomofGod, "CIVILIZATION_JFD_PAPAL_STATES")
	Decisions_KingdomofGod.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_KingdomofGod") == true then
			Decisions_KingdomofGod.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD_ENACTED_DESC")
			return false, false, true
		end
		
		local religionID = player:GetReligionCreatedByPlayer()
		local religiousUnity = (GetReligiousUnity(player, religionID) or 0) * 100
		if religionID <= 0 then unity = 0 end
		
		local goldCost = mathCeil(300 * iMod)
		local faithCost = mathCeil(700 * iMod)
		Decisions_KingdomofGod.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC", religiousUnity, goldCost, faithCost)
		
		if religiousUnity < 90 							then return true, false end
		if player:GetGold()  < goldCost 				then return true, false end
		if player:GetFaith() < faithCost			    then return true, false end
		if player:GetReligionCreatedByPlayer() <= 0 	then return true, false end

		return true, true
	end
	)
	
	Decisions_KingdomofGod.DoFunc = (
	function(player)
		local goldCost = mathCeil(300 * iMod)
		local faithCost = mathCeil(900 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, 2)
		Events.AudioPlay2DSound("AS2D_DISCIPLE_ARTIST_WRITER")
		player:InitUnit(unitDiscipleID, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())
		player:InitUnit(unitDiscipleID, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())

		local description =  Locale.ConvertTextKey("TXT_KEY_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC");
		PreGame.SetCivilizationDescription(player:GetID(), "TXT_KEY_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC")
		PreGame.SetCivilizationShortDescription(player:GetID(), "TXT_KEY_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC")
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PAPAL_KINGDOM_OF_GOD")) 
		save(player, "Decisions_KingdomofGod", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_KingdomofGod", Decisions_KingdomofGod)
-------------------------------------------------------------------------------------------------------------------------
-- Papal States: Institute the Societas Jesu
-------------------------------------------------------------------------------------------------------------------------
local Decisions_SocietasJesu = {}
	Decisions_SocietasJesu.Name = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU"
	Decisions_SocietasJesu.Desc = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU_DESC"
	HookDecisionCivilizationIcon(Decisions_SocietasJesu, "CIVILIZATION_JFD_PAPAL_STATES")
	Decisions_SocietasJesu.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		
		local religionType = "majority religion"
		if isUsingPietyPrestige then religionType = "State Religion" end
		
		if load(player, "Decisions_SocietasJesu") == true then
			Decisions_SocietasJesu.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU_ENACTED_DESC", religionType)
			return false, false, true
		end
		
		local faithCost = mathCeil(350 * iMod)
		Decisions_SocietasJesu.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU_DESC", faithCost, religionType)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 		then return true, false end
		if player:GetFaith() < faithCost								then return true, false end
		if Game.GetNumReligionsStillToFound()  > 0 						then return true, false end
		if player:GetReligionCreatedByPlayer() <= 0 					then return true, false end

		return true, true
	end
	)
	
	Decisions_SocietasJesu.DoFunc = (
	function(player)
		local faithCost = mathCeil(350 * iMod)
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PAPAL_JESUITS")) 
		save(player, "Decisions_SocietasJesu", true)
	end
	)
	
	Decisions_SocietasJesu.Monitors = {}
	Decisions_SocietasJesu.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilisationID then return end
		if load(player, "Decisions_SocietasJesu") == true then
			local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
			if isUsingPietyPrestige then religionID = JFD_GetStateReligion(playerID) end
			
			if religionID then
				ConvertPlayerReligion(player, religionID, 50)
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(civilisationID, "Decisions_SocietasJesu", Decisions_SocietasJesu)
--=======================================================================================================================
--=======================================================================================================================