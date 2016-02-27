-- JFD_OttomanDTP
-- Author: JFD
-- DateCreated: 6/5/2015 2:42:50 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCommunityPatchDLL
function JFD_IsCommunityPatchDLL()
	local communityPatchDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == communityPatchDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsCommunityPatchDLL()

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
local isPietyActive = JFD_IsUsingPiety()
--------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetMajorityReligionID
function JFD_GetMajorityReligionID(playerID)
	local player = Players[playerID]
	if isPietyActive then
		return player:GetStateReligion()
	else
		local religionCreatedID = player:GetReligionCreatedByPlayer()
		if religionCreatedID > 0 then
			return religionCreatedID
		else
			local capital = player:GetCapitalCity()
			if capital then
				return capital:GetReligiousMajority()
			end
		end
	end
	return -1
end

-- JFD_Ottomans_GetGoldFromPuppets
function JFD_Ottomans_GetGoldFromPuppets(playerID)
	local player = Players[playerID]
	local numGoldFromPuppets = 0
	if isUsingCPDLL then
		for city in player:Cities() do
			if city:HasAnyDomesticTradeRoute() then
				numGoldFromPuppets = numGoldFromPuppets + 4
			end
		end
	else
		for city in player:Cities() do
			if city:IsPuppet() then
			for _,v in ipairs(player:GetTradeRoutes()) do
				if v.FromCivilizationTyp == v.ToCivilizationType then
					if (v.FromCity == city or v.ToCity == city) then
						numGoldFromPuppets = numGoldFromPuppets + 4
					end
				end
			end
			end
		end
	end
	return numGoldFromPuppets
end

-- JFD_Ottomans_GetFaithFromPuppets
function JFD_Ottomans_GetFaithFromPuppets(playerID)
	local player = Players[playerID]
	local numFaithFromPuppets = 0
	local religionID = JFD_GetMajorityReligionID(playerID)
	if isUsingCPDLL then
		for city in player:Cities() do
			if city:GetReligiousMajority() ~= religionID then
				numFaithFromPuppets = numFaithFromPuppets + 5
			end
		end
	else
		for city in player:Cities() do
			if city:IsPuppet() then
			for _,v in ipairs(player:GetTradeRoutes()) do
				if v.FromCivilizationType == v.ToCivilizationType then
					if (v.FromCity == city or v.ToCity == city) then
						if city:GetReligiousMajority() ~= religionID then
							numFaithFromPuppets = numFaithFromPuppets + 5
						end
					end
				end
			end
			end
		end
	end
	return numFaithFromPuppets
end
--=======================================================================================================================
--=======================================================================================================================


