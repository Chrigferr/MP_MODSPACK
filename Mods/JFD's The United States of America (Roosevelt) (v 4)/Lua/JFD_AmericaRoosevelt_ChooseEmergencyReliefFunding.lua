-- JFD_AmericaRoosevelt_ChooseEmergencyReliefFunding
-- Author: JFD
-- DateCreated: 5/28/2014 5:24:04 AM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("NewSaveUtils.lua"); MY_MOD_NAME = "JFD_AmericaRoosevelt";
--==========================================================================================================================
-- MapModData
--==========================================================================================================================
local MapModData		= MapModData
MapModData.g_Properties	= MapModData.g_Properties or {}
g_Properties			= MapModData.g_Properties;
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-- ShowPopup
------------------------------------------------------------------------------------------------------------------------
function ShowPopup()
	Controls.MainUIBG:SetHide(false)
	Controls.MainUI:SetHide(false)
	Controls.OK:SetDisabled(true)
end
LuaEvents.JFD_ShowChooseEmergencyReliefFundGoldPopup.Add(function() ShowPopup() end)
------------------------------------------------------------------------------------------------------------------------
-- OnCloseButton 
------------------------------------------------------------------------------------------------------------------------
function JFD_OnInvestment()
	local activePlayer = Players[Game.GetActivePlayer()]
	local goldInvested = Controls.GoldAmount:GetText()
	activePlayer:ChangeGold(-goldInvested)
	SetPersistentProperty("JFD_EmergencyReliefFund", goldInvested)
	ContextPtr:SetHide(true)
	activePlayer:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], Locale.ConvertTextKey("TXT_KEY_JFD_EMERGENCY_RELIEF_FUND_NOTIFICATION", goldInvested), Locale.ConvertTextKey("TXT_KEY_JFD_EMERGENCY_RELIEF_FUND_SHORT"), -1, -1)
end
Controls.OK:RegisterCallback(Mouse.eLClick, JFD_OnInvestment)
------------------------------------------------------------------------------------------------------------------------
-- JFD_Validate
------------------------------------------------------------------------------------------------------------------------
function JFD_Validate(sValue, control, bFire)
	local activePlayer = Players[Game.GetActivePlayer()]
	local goldInvested = tonumber(Controls.GoldAmount:GetText()) or 0
	local invalid = false
	if (goldInvested == 0 or goldInvested > activePlayer:GetGold()) then 
		invalid = true
	end

	Controls.OK:SetDisabled(invalid)
	Controls.OK:LocalizeAndSetToolTip("TXT_KEY_JFD_EMERGENCY_RELIEF_FUND_TT", goldInvested)
end
Controls.GoldAmount:RegisterCallback(JFD_Validate)
--==========================================================================================================================
--==========================================================================================================================
