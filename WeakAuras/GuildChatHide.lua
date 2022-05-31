-- WAGO: https://wago.io/9b0TGIk7h
function(event,addonName)    
    if event == "ADDON_LOADED" and addonName == "Blizzard_Communities" then
        --create overlay
        local f = CreateFrame("Button",nil,UIParent)
        f:SetFrameStrata("HIGH")
        f.tex = f:CreateTexture(nil, "BACKGROUND")
        f.tex:SetAllPoints()
        f.tex:SetColorTexture(0.1,0.1,0.1,1)
        f.text = f:CreateFontString()
        f.text:SetFontObject("GameFontNormalMed3")
        f.text:SetText("Chat Hidden. Click to show")
        f.text:SetTextColor(1, 1, 1, 1)
        f.text:SetJustifyH("CENTER")
        f.text:SetJustifyV("CENTER")
        f.text:SetHeight(20)
        f.text:SetPoint("CENTER",f,"CENTER",0,0)
        f:EnableMouse(true)
        f:RegisterForClicks("AnyUp")
        f:SetScript("OnClick",function(...)
                f:Hide()
        end)
        --toggle
        local function toggleOverlay()
            if CommunitiesFrame:GetDisplayMode() == COMMUNITIES_FRAME_DISPLAY_MODES.CHAT then
                f:SetAllPoints(CommunitiesFrame.Chat.InsetFrame)
                f:Show()
            elseif CommunitiesFrame:GetDisplayMode() == COMMUNITIES_FRAME_DISPLAY_MODES.MINIMIZED then
                f:SetAllPoints(CommunitiesFrameInset)
                f:Show()
            else                
                f:Hide()
            end
        end
        local function hideOverlay()
            f:Hide()  
        end        
        toggleOverlay() --run once
        
        --hook        
        hooksecurefunc(CommunitiesFrame,"SetDisplayMode", toggleOverlay)
        hooksecurefunc(CommunitiesFrame,"Show",toggleOverlay)
        hooksecurefunc(CommunitiesFrame,"Hide",hideOverlay)
        hooksecurefunc(CommunitiesFrame,"OnClubSelected", toggleOverlay)        
    end
end