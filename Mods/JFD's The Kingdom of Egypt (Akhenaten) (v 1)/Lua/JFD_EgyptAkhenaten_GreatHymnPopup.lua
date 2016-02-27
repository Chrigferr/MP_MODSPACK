--=======================================================================================================================
-- Includes
--=======================================================================================================================
include( "IconSupport" );
include( "InfoTooltipInclude" );
include( "CommonBehaviors" );
--==========================================================================================================================
-- GREAT HYMN POPUP
--==========================================================================================================================

local iconTextureOffsets = 
{
	GREAT_WORK_LITERATURE = {u = 128 ,v = 128 },
}

local g_PopupInfo = nil;

local gwsWidth, gwsHeight = Controls.GreatWorkSplash:GetSizeVal();
local windowWidth, windowHeight = Controls.Window:GetSizeVal();

local deltaWidth = windowWidth - gwsWidth;
local deltaHeight = windowHeight - gwsHeight;
------------------------------------------------------------------------------------------------------------------------
-- POPULATE INFO
------------------------------------------------------------------------------------------------------------------------
-- JFD_PopulateVersePopup
local verseSlotIndex = 1
function JFD_PopulateVersePopup()
	UI.incTurnTimerSemaphore()
	local textureOffset = iconTextureOffsets["GREAT_WORK_ART"]
	if(textureOffset ~= nil) then
		Controls.TopIcon:SetTextureOffsetVal(textureOffset.u, textureOffset.v);
	end
	Controls.GreatWorkSplash:SetTextureAndResize("EgyptAkhenatenVerseBG.dds")	
	m_fOriginalSizeX, m_fOriginalSizeY = Controls.GreatWorkSplash:GetSizeVal()
	Controls.Window:SetSizeVal(m_fOriginalSizeX + deltaWidth, m_fOriginalSizeY + deltaHeight)
	Controls.GreatWorkSplashClip:SetSizeVal(m_fOriginalSizeX, m_fOriginalSizeY)

	g_AnimUpdate = ZoomOutEffect{
		SplashControl = Controls.GreatWorkSplash, 
		ScaleFactor = 0.5,
		AnimSeconds = 5
	};
	
	ContextPtr:SetUpdate(function(dTime)
		if(g_AnimUpdate == nil or g_AnimUpdate(dTime) == true) then
			ContextPtr:ClearUpdate();
		end
	end);
			
	local lcMaxWidth = m_fOriginalSizeX + deltaWidth - 34;
	Controls.LowerCaption:SetWrapWidth(lcMaxWidth);
	    
   	local lcWidth, lcHeight = Controls.LowerCaption:GetSizeVal();
	local lbcWidth, lcbHeight = Controls.LowerCaptionFrame:GetSizeVal();

	local lcNewWidth = math.min(lcWidth + 100, lcMaxWidth);
	local lcNewHeight = lcHeight + 20;
	
	Controls.LowerCaptionFrame:SetSizeVal(lcNewWidth, lcNewHeight);
	Controls.LowerCaptionFrame:SetDisabled(true);

	Controls.LowerCaptionFrame:ReprocessAnchoring();
	
	Controls.GreatWorkSplashClip:ReprocessAnchoring();
	
	Controls.GreatWorkSplashContainer:SetSizeVal(m_fOriginalSizeX, m_fOriginalSizeY);
	Controls.GreatWorkSplashContainer:ReprocessAnchoring();
end
------------------------------------------------------------------------------------------------------------------------
-- SHOW/HIDE
------------------------------------------------------------------------------------------------------------------------
-- JFD_CloseVersePopup
function JFD_CloseVersePopup()
	ContextPtr:SetHide(true)
end

-- JFD_ShowHideHandler
function JFD_ShowHideHandler(bIsHide, bInitState)
	if (not bInitState and not bIsHide) then
		JFD_PopulateVersePopup()
	end
end
ContextPtr:SetShowHideHandler(JFD_ShowHideHandler)
ContextPtr:SetHide(true)

-- JFD_ShowVersePopup
function JFD_ShowVersePopup(verseSlotIndex)
	local verseText = "TXT_KEY_JFD_EGYPT_AKHEANTEN_VERSE_" .. verseSlotIndex
	Events.AudioPlay2DSound("AS2D_SOUND_JFD_ATENISM")
   	Controls.Quote:LocalizeAndSetText(verseText)
	Controls.Quote:SetHide(false)
	ContextPtr:SetHide(false)
end
LuaEvents.JFD_ShowVersePopup.Add(JFD_ShowVersePopup)

-- JFD_OnClose
function JFD_OnClose()
   JFD_CloseVersePopup()
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, JFD_OnClose)
Events.GameplaySetActivePlayer.Add(OnClose)

-- JFD_InputHandler
function JFD_InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            JFD_OnClose()
            return true
        end
    end
end
ContextPtr:SetInputHandler(JFD_InputHandler)
--==========================================================================================================================
--==========================================================================================================================

