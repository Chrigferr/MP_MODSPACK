-- JFD_Saxony_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Saxony Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
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
--------------------------------------------------------------------------------------------------------------------------
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingClaimsColonies
function JFD_IsUsingClaimsColonies()
	local claimsColoniesEraModID = "10e9728f-d61c-4317-be4f-7d52d6bae6f4"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == claimsColoniesEraModID) then
			return true
		end
	end
	return false
end
local isUsingClaimsColonies = JFD_IsUsingClaimsColonies()
--=======================================================================================================================
-- EVENTS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_SAXONY"]
--------------------------------------------------------------------------------------------------------------------------
-- Saxony: AnimalTossing Festival
--------------------------------------------------------------------------------------------------------------------------
local resourceBisonID = GameInfoTypes["RESOURCE_BISON"]
local resourceCowID = GameInfoTypes["RESOURCE_COW"]
local resourceCrabID = GameInfoTypes["RESOURCE_CRAB"]
local resourceDeerID = GameInfoTypes["RESOURCE_DEER"]
local resourceElephantID = GameInfoTypes["RESOURCE_IVORY"]
local resourceHorseID = GameInfoTypes["RESOURCE_HORSE"]
local resourceFishID = GameInfoTypes["RESOURCE_FISH"]
local resourceFoxID = GameInfoTypes["RESOURCE_FUR"]
local resourcePigID = GameInfoTypes["RESOURCE_TRUFFLES"]
local resourceSheepID = GameInfoTypes["RESOURCE_SHEEP"]
local resourceWhaleID = GameInfoTypes["RESOURCE_WHALE"]
local animalResources = {resourceFoxID, resourceElephantID, resourceCrabID, resourceDeerID, resourceHorseID, resourcePigID, resourceWhaleID, resourceFishID, resourceCowID, resourceSheepID}
local bigAnimalResources = {resourceElephantID, resourceWhaleID}
local bigAnimalResource = {}
	bigAnimalResource[resourceElephantID] = "an [ICON_RES_IVORY] Elephant"
	bigAnimalResource[resourceWhaleID] = "a [ICON_RES_WHALE] Whale"
local bigAnimalResourceID = nil
local mediumAnimalResources = {resourceBisonID, resourceDeerID, resourceHorseID, resourceCowID, resourceSheepID, resourcePigID}
local mediumAnimalResource = {}
	mediumAnimalResource[resourceBisonID] = "a [ICON_RES_BISON] Bison"
	mediumAnimalResource[resourceDeerID] = "a [ICON_RES_DEER] Deer"
	mediumAnimalResource[resourceHorseID] = "a [ICON_RES_HORSE] Horse"
	mediumAnimalResource[resourceCowID] = "a [ICON_RES_COW] Cow"
	mediumAnimalResource[resourceSheepID] = "a [ICON_RES_SHEEP] Sheep"
	mediumAnimalResource[resourcePigID] = "a [ICON_RES_TRUFFLES] Pig"
local mediumAnimalResourceID = nil
local smallAnimalResources = {resourceFoxID, resourceCrabID, resourceFishID}
local smallAnimalResourceID = nil
local smallAnimalResource = {}
	smallAnimalResource[resourceCrabID] = "a [ICON_RES_CRAB] Crab"
	smallAnimalResource[resourceFishID] = "a [ICON_RES_FISH] Fish"
	smallAnimalResource[resourceFoxID] = "a [ICON_RES_FUR] Fox"
local Event_JFD_Saxony_AnimalTossing = {}
	Event_JFD_Saxony_AnimalTossing.Name = "TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING"
	Event_JFD_Saxony_AnimalTossing.Desc = "TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_DESC"
	Event_JFD_Saxony_AnimalTossing.EventImage = 'Event_Saxony_AnimalTossing.dds'
	Event_JFD_Saxony_AnimalTossing.Weight = 10
	Event_JFD_Saxony_AnimalTossing.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			for	 _, resourceID in pairs(animalResources) do
				if player:GetNumResourceAvailable(resourceID, false) > 0 then
					return true
				end
			end
			return false
		end
		)
	Event_JFD_Saxony_AnimalTossing.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Saxony_AnimalTossing.Outcomes[1] = {}
	Event_JFD_Saxony_AnimalTossing.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_1"
	Event_JFD_Saxony_AnimalTossing.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_RESULT_1"
	Event_JFD_Saxony_AnimalTossing.Outcomes[1].Weight = 5
	Event_JFD_Saxony_AnimalTossing.Outcomes[1].CanFunc = (
		function(player)			
			local resources = {}
			local count = 1
			for	 _, resourceID in pairs(smallAnimalResources) do
				if player:GetNumResourceAvailable(resourceID, false) > 0 then
					resources[count] = resourceID
					count = count + 1
				end
			end
			smallAnimalResourceID = resources[GetRandom(1,#resources)]
			if (not smallAnimalResourceID) then return false end
			Event_JFD_Saxony_AnimalTossing.Outcomes[1].Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_1", smallAnimalResource[smallAnimalResourceID])
			Event_JFD_Saxony_AnimalTossing.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_Saxony_AnimalTossing.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(5)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SAXONY_ANIMAL_TOSSING_1", player:GetName(), player:GetCivilizationShortDescription(), smallAnimalResource[smallAnimalResourceID])) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Saxony_AnimalTossing.Outcomes[2] = {}
	Event_JFD_Saxony_AnimalTossing.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_2"
	Event_JFD_Saxony_AnimalTossing.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_RESULT_2"
	Event_JFD_Saxony_AnimalTossing.Outcomes[2].Weight = 5
	Event_JFD_Saxony_AnimalTossing.Outcomes[2].CanFunc = (
		function(player)			
			local resources = {}
			local count = 1
			for	 _, resourceID in pairs(mediumAnimalResources) do
				if player:GetNumResourceAvailable(resourceID, false) > 0 then
					resources[count] = resourceID
					count = count + 1
				end
			end
			mediumAnimalResourceID = resources[GetRandom(1,#resources)]
			if (not mediumAnimalResourceID) then return false end
			Event_JFD_Saxony_AnimalTossing.Outcomes[2].Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_2", mediumAnimalResource[mediumAnimalResourceID])
			Event_JFD_Saxony_AnimalTossing.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_Saxony_AnimalTossing.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if GetRandom(1,10) <= 6 then 
				for city in player:Cities() do
					city:ChangeWeLoveTheKingDayCounter(10)
				end
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SAXONY_ANIMAL_TOSSING_2", player:GetName(), player:GetCivilizationShortDescription(), mediumAnimalResource[mediumAnimalResourceID])) 
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_RESULT_2_ALT_NOTIFICATION", mediumAnimalResource[mediumAnimalResourceID]), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SAXONY_ANIMAL_TOSSING_2", player:GetName(), player:GetCivilizationShortDescription(), mediumAnimalResource[mediumAnimalResourceID])) 
			end
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_Saxony_AnimalTossing.Outcomes[3] = {}
	Event_JFD_Saxony_AnimalTossing.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_3"
	Event_JFD_Saxony_AnimalTossing.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_RESULT_3"
	Event_JFD_Saxony_AnimalTossing.Outcomes[3].Weight = 5
	Event_JFD_Saxony_AnimalTossing.Outcomes[3].CanFunc = (
		function(player)			
			local resources = {}
			local count = 1
			for	 _, resourceID in pairs(bigAnimalResources) do
				if player:GetNumResourceAvailable(resourceID, false) > 0 then
					resources[count] = resourceID
					count = count + 1
				end
			end
			bigAnimalResourceID = resources[GetRandom(1,#resources)]
			if (not bigAnimalResourceID) then return false end
			Event_JFD_Saxony_AnimalTossing.Outcomes[3].Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_3", bigAnimalResource[bigAnimalResourceID])
			Event_JFD_Saxony_AnimalTossing.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFD_Saxony_AnimalTossing.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if GetRandom(1,10) <= 2 then 
				for city in player:Cities() do
					city:ChangeWeLoveTheKingDayCounter(25)
				end
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SAXONY_ANIMAL_TOSSING_2", player:GetName(), player:GetCivilizationShortDescription(), bigAnimalResource[bigAnimalResourceID])) 
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SAXONY_ANIMAL_TOSSING_OUTCOME_RESULT_3_ALT_NOTIFICATION", bigAnimalResource[bigAnimalResourceID]), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_ANIMAL_TOSSING"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SAXONY_ANIMAL_TOSSING_2", player:GetName(), player:GetCivilizationShortDescription(), bigAnimalResource[bigAnimalResourceID])) 
			end
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Saxony_AnimalTossing", Event_JFD_Saxony_AnimalTossing)
--------------------------------------------------------------------------------------------------------------------------
--  Saxony: Bastard Child
--------------------------------------------------------------------------------------------------------------------------
local gender = "boy"
local qualities = {}
	qualities[1] = "ugly"
	qualities[2] = "stupid"
	qualities[3] = "homosexual"
	qualities[4] = "adorable"
	qualities[5] = "intelligent"
local resourceDignitariesID = GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
local resourceMagistrateID = GameInfoTypes["RESOURCE_MAGISTRATES"]
local Event_JFD_Saxony_BastardChild = {}
	Event_JFD_Saxony_BastardChild.Name = "TXT_KEY_EVENT_JFD_SAXONY_BASTARD_CHILD"
	Event_JFD_Saxony_BastardChild.Desc = "TXT_KEY_EVENT_JFD_SAXONY_BASTARD_CHILD_DESC"
	Event_JFD_Saxony_BastardChild.EventImage = 'Event_Saxony_BastardChild.dds'
	Event_JFD_Saxony_BastardChild.Weight = 50
	Event_JFD_Saxony_BastardChild.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if GetRandom(1,2) == 2 then
				gender = "girl"
			end
			Event_JFD_Saxony_BastardChild.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_BASTARD_CHILD_DESC", gender, qualities[GetRandom(1,5)])
			return true
		end
		)
	Event_JFD_Saxony_BastardChild.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Saxony_BastardChild.Outcomes[1] = {}
	Event_JFD_Saxony_BastardChild.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SAXONY_BASTARD_CHILD_OUTCOME_1"
	Event_JFD_Saxony_BastardChild.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SAXONY_BASTARD_CHILD_OUTCOME_RESULT_1"
	Event_JFD_Saxony_BastardChild.Outcomes[1].Weight = 5
	Event_JFD_Saxony_BastardChild.Outcomes[1].CanFunc = (
		function(player)	
			local resourceType = "[ICON_MAGISTRATES] Magistrate"
			if (isUsingClaimsColonies and gender == "girl") then
				resourceType = "[ICON_JFD_DIGNITARY] Dignitary"
			end
			Event_JFD_Saxony_BastardChild.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_BASTARD_CHILD_OUTCOME_RESULT_1", resourceType)
			return true
		end
		)
	Event_JFD_Saxony_BastardChild.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local resourceID = resourceMagistrateID
			if (isUsingClaimsColonies and gender == "girl") then
				resourceID = resourceDignitariesID
			end
			player:ChangeNumResourceTotal(resourceID, 1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SAXONY_BASTARD_CHILD_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_BASTARD_CHILD"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SAXONY_BASTARD_CHILD_1", player:GetName(), player:GetCivilizationShortDescription())) 
			save(player, "Event_JFD_Saxony_BastardChild", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Saxony_BastardChild.Outcomes[2] = {}
	Event_JFD_Saxony_BastardChild.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_SAXONY_BASTARD_CHILD_OUTCOME_2"
	Event_JFD_Saxony_BastardChild.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_SAXONY_BASTARD_CHILD_OUTCOME_RESULT_2"
	Event_JFD_Saxony_BastardChild.Outcomes[2].Weight = 5
	Event_JFD_Saxony_BastardChild.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil((player:GetGoldenAgeProgressMeter()*15)/100)
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(70*iMod))
			Event_JFD_Saxony_BastardChild.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_BASTARD_CHILD_OUTCOME_RESULT_2", goldenAgeCost, cultureReward)
			return true
		end
		)
	Event_JFD_Saxony_BastardChild.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil((player:GetGoldenAgeProgressMeter()*15)/100)
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(70*iMod))
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SAXONY_BASTARD_CHILD_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAXONY_BASTARD_CHILD"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SAXONY_BASTARD_CHILD_2", player:GetName(), player:GetCivilizationShortDescription())) 
		end)
		
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Saxony_BastardChild", Event_JFD_Saxony_BastardChild)
--=======================================================================================================================
--=======================================================================================================================


