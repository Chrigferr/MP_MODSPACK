-- JFD_FranceLouisXIV_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's France (Louis XIV) Events: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
--=======================================================================================================================
-- EVENTS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_FRANCE"]
local mathCeil		 = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Colbert
--------------------------------------------------------------------------------------------------------------------------
local eraMedievalID			= GameInfoTypes["ERA_MEDIEVAL"]
local policyMercantilismID	= GameInfoTypes["POLICY_MERCANTILISM"]
local unitGreatMerchantID	= GameInfoTypes["UNIT_MERCHANT"]
local Event_JFD_France_Colbert = {}
	Event_JFD_France_Colbert.Name = "TXT_KEY_EVENT_JFD_FRANCE_COLBERT"
	Event_JFD_France_Colbert.Desc = "TXT_KEY_EVENT_JFD_FRANCE_COLBERT_DESC"
	Event_JFD_France_Colbert.EventImage = 'Event_France_Colbert.dds'
	Event_JFD_France_Colbert.Weight = 5
	Event_JFD_France_Colbert.CanFunc = (
		function(player)			
			if player:HasPolicy(policyMercantilismID) then return false end
			if player:GetCurrentEra() < eraMedievalID then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if load(player, "Event_JFD_France_Colbert") == true then return false end
			return true
		end
		)
	Event_JFD_France_Colbert.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_France_Colbert.Outcomes[1] = {}
	Event_JFD_France_Colbert.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FRANCE_COLBERT_OUTCOME_1"
	Event_JFD_France_Colbert.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FRANCE_COLBERT_OUTCOME_RESULT_1"
	Event_JFD_France_Colbert.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_France_Colbert.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_COLBERT_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_France_Colbert.Outcomes[1].DoFunc = (
		function(player) 
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyMercantilismID, true)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_COLBERT_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_COLBERT"))
			save(player, "Event_JFD_France_Colbert", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_France_Colbert.Outcomes[2] = {}
	Event_JFD_France_Colbert.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_FRANCE_COLBERT_OUTCOME_2"
	Event_JFD_France_Colbert.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_FRANCE_COLBERT_OUTCOME_RESULT_2"
	Event_JFD_France_Colbert.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFD_France_Colbert.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_COLBERT_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_France_Colbert.Outcomes[2].DoFunc = (
		function(player) 
			local capital = player:GetCapitalCity()
			player:InitUnit(unitGreatMerchantID, capital:GetX(), capital:GetY())
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_COLBERT_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_COLBERT"))
			save(player, "Event_JFD_France_Colbert", true)	
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_France_Colbert", Event_JFD_France_Colbert)
--------------------------------------------------------------------------------------------------------------------------
-- Vauban
--------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID		= GameInfoTypes["ERA_RENAISSANCE"]
local improvementCitadelID	= GameInfoTypes["IMPROVEMENT_CITADEL"]
local improvementFortID		= GameInfoTypes["IMPROVEMENT_FORT"]
local Event_JFD_France_Vauban = {}
	Event_JFD_France_Vauban.Name = "TXT_KEY_EVENT_JFD_FRANCE_VAUBAN"
	Event_JFD_France_Vauban.Desc = "TXT_KEY_EVENT_JFD_FRANCE_VAUBAN_DESC"
	Event_JFD_France_Vauban.EventImage = 'Event_France_Vauban.dds'
	Event_JFD_France_Vauban.Weight = 5
	Event_JFD_France_Vauban.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_France_Vauban") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			local numForts = player:GetImprovementCount(improvementFortID)
			if numForts == 0 then return false end
			local goldCost = mathCeil((233*iMod)*numForts)
			if player:GetGold() < goldCost then return false end
			return true
		end
		)
	Event_JFD_France_Vauban.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_France_Vauban.Outcomes[1] = {}
	Event_JFD_France_Vauban.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FRANCE_VAUBAN_OUTCOME_1"
	Event_JFD_France_Vauban.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FRANCE_VAUBAN_OUTCOME_RESULT_1"
	Event_JFD_France_Vauban.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_France_Vauban.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_VAUBAN_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_France_Vauban.Outcomes[1].DoFunc = (
		function(player) 
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_VAUBAN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_VAUBAN"))
			save(player, "Event_JFD_France_Vauban", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_France_Vauban.Outcomes[2] = {}
	Event_JFD_France_Vauban.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_FRANCE_VAUBAN_OUTCOME_2"
	Event_JFD_France_Vauban.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_FRANCE_VAUBAN_OUTCOME_RESULT_2"
	Event_JFD_France_Vauban.Outcomes[2].CanFunc = (
		function(player)			
			local numForts = player:GetImprovementCount(improvementFortID)
			local goldCost = mathCeil((233*iMod)*numForts)
			Event_JFD_France_Vauban.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_VAUBAN_OUTCOME_RESULT_2", goldCost)
			return true
		end
		)
	Event_JFD_France_Vauban.Outcomes[2].DoFunc = (
		function(player) 
			local numForts = player:GetImprovementCount(improvementFortID)
			local goldCost = mathCeil((233*iMod)*numForts)
			player:ChangeGold(-goldCost)
			for city in player:Cities() do
				local plot = Map.GetPlot(city:GetX(), city:GetY())
				for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if loopPlot:GetImprovementType() == improvementFortID then
						loopPlot:SetImprovementType(improvementCitadelID)
						if player:IsHuman() then 
							local hex = ToHexFromGrid(Vector2(loopPlot:GetX(), loopPlot:GetY()))
							Events.GameplayFX(hex.x, hex.y, -1) 
						end
					end
				end	
			end
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_VAUBAN_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_VAUBAN"))
			save(player, "Event_JFD_France_Vauban", true)	
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_France_Vauban", Event_JFD_France_Vauban)
--=======================================================================================================================
--=======================================================================================================================


