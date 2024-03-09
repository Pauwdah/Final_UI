
 -- Create the options frame
    OptionFrame = CreateFrame("Frame", "OptionFrame", UIParent, "BasicFrameTemplateWithInset")
    OptionFrame:SetSize(300, 400)
    OptionFrame:SetPoint("CENTER", 0, 0)
    OptionFrame:SetMovable(true)
    OptionFrame:EnableMouse(true)
    OptionFrame:RegisterForDrag("LeftButton")
    OptionFrame:Hide()
-- Title
    local optionFrameTitle = OptionFrame:CreateFontString("OptionFrameTitle", "OVERLAY", "GameFontNormal")
    optionFrameTitle:SetPoint("CENTER", OptionFrame, "TOP", 0, -10)
    optionFrameTitle:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    optionFrameTitle:SetTextColor(1, 1, 1)
    optionFrameTitle:SetText("Options")

-- Tabs

    local optionFrameTabPlayer = CreateFrame("Button", "OptionFrameTab1", OptionFrame, "UIPanelButtonTemplate")
    optionFrameTabPlayer:SetSize(100, 30)
    optionFrameTabPlayer:SetPoint("TOPLEFT", OptionFrame, "TOPLEFT", 10, -30)
    optionFrameTabPlayer:SetText("Player")

    

    local optionFrameButtonUnlock = CreateFrame("Button", "OptionFrameButtonClose", OptionFrame, "UIPanelButtonTemplate")
    optionFrameButtonUnlock:SetSize(150, 30)
    optionFrameButtonUnlock:SetPoint("TOP", OptionFrame, "TOP", 0, -30)
    optionFrameButtonUnlock:SetText("Unlock Frames")

    local optionFrameButtonTogglePortrait = CreateFrame("Button", "OptionFrameButtonTogglePortrait", OptionFrame, "UIPanelButtonTemplate")
    optionFrameButtonTogglePortrait:SetSize(150, 30)
    optionFrameButtonTogglePortrait:SetPoint("TOPLEFT", OptionFrame, "TOPLEFT", 10, -60)
    optionFrameButtonTogglePortrait:SetText("Toggle Portrait 2D/3D")

    local optionFrameToggleBoxHPPercent = CreateFrame("CheckButton", "OptionFrameToggleBoxHPPercent", OptionFrame, "UICheckButtonTemplate")
    local optionFrameToggleBoxHPPercentText = OptionFrame:CreateFontString("OptionFrameToggleBoxHPPercentText", "OVERLAY", "GameFontNormal")
    optionFrameToggleBoxHPPercent:SetSize(30, 30)
    optionFrameToggleBoxHPPercent:SetPoint("TOPLEFT", OptionFrame, "TOPLEFT", 10, -90)
    optionFrameToggleBoxHPPercentText:SetPoint("TOPLEFT", OptionFrame, "TOPLEFT", 40, -97 )
    optionFrameToggleBoxHPPercentText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    optionFrameToggleBoxHPPercentText:SetTextColor(1, 1, 1)
    optionFrameToggleBoxHPPercentText:SetText("Show HP %")
    optionFrameToggleBoxHPPercent:SetChecked(true)

    local optionFrameToggleBoxHealthClassColor = CreateFrame("CheckButton", "OptionFrameToggleBoxHealthClassColor", OptionFrame, "UICheckButtonTemplate")
    local optionFrameToggleBoxHealthClassColorText = OptionFrame:CreateFontString("OptionFrameToggleBoxHealthClassColorText", "OVERLAY", "GameFontNormal")
    optionFrameToggleBoxHealthClassColor:SetSize(30, 30)
    optionFrameToggleBoxHealthClassColor:SetPoint("TOPLEFT", OptionFrame, "TOPLEFT", 10, -120)
    optionFrameToggleBoxHealthClassColorText:SetPoint("TOPLEFT", OptionFrame, "TOPLEFT", 40, -127)
    optionFrameToggleBoxHealthClassColorText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    optionFrameToggleBoxHealthClassColorText:SetTextColor(1, 1, 1)
    optionFrameToggleBoxHealthClassColorText:SetText("Use Class Color for Healthbar")

    local optionFrameToggleBoxDynamicHealthColor = CreateFrame("CheckButton", "OptionFrameToggleBoxDynamicHealthColor", OptionFrame, "UICheckButtonTemplate")
    local optionFrameToggleBoxDynamicHealthColorText = OptionFrame:CreateFontString("OptionFrameToggleBoxDynamicHealthColorText", "OVERLAY", "GameFontNormal")
    local dynamicHealthColorMode = false
    optionFrameToggleBoxDynamicHealthColor:SetSize(30, 30)
    optionFrameToggleBoxDynamicHealthColor:SetPoint("TOPLEFT", OptionFrame, "TOPLEFT", 10, -150)
    optionFrameToggleBoxDynamicHealthColorText:SetPoint("TOPLEFT", OptionFrame, "TOPLEFT", 40, -157)
    optionFrameToggleBoxDynamicHealthColorText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    optionFrameToggleBoxDynamicHealthColorText:SetTextColor(1, 1, 1)
    optionFrameToggleBoxDynamicHealthColorText:SetText("Use Dynamic Healthbar Color")

    local optionFrameToggleBoxShortenResourceText = CreateFrame("CheckButton", "OptionFrameToggleBoxShortenResourceText", OptionFrame, "UICheckButtonTemplate")
    local optionFrameToggleBoxShortenResourceTextText = OptionFrame:CreateFontString("OptionFrameToggleBoxShortenResourceTextText", "OVERLAY", "GameFontNormal")
    optionFrameToggleBoxShortenResourceText:SetSize(30, 30)
    optionFrameToggleBoxShortenResourceText:SetPoint("TOPLEFT", OptionFrame, "TOPLEFT", 10, -180)
    optionFrameToggleBoxShortenResourceTextText:SetPoint("TOPLEFT", OptionFrame, "TOPLEFT", 40, -187)
    optionFrameToggleBoxShortenResourceTextText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    optionFrameToggleBoxShortenResourceTextText:SetTextColor(1, 1, 1)
    optionFrameToggleBoxShortenResourceTextText:SetText("Shorten Resource Text")


    -- LOGIC

    optionFrameButtonTogglePortrait:SetScript("OnClick", function(self)
        if CharacterFrameButtonPortrait3D:IsShown() then
            CharacterFrameButtonPortrait3D:Hide()
            CharacterFrameButtonPortrait2D:Show()
        else
            CharacterFrameButtonPortrait3D:Show()
            CharacterFrameButtonPortrait2D:Hide()
        end
    end)
    OptionFrame:SetScript("OnDragStart", function(self)
            self:StartMoving()
    end)
    OptionFrame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)

    optionFrameToggleBoxHPPercent:SetScript("OnClick", function(self)
        if self:GetChecked() then
            PlayerHealthTextPercent:Show()
        else
            PlayerHealthTextPercent:Hide()
        end
    end)

    optionFrameButtonUnlock:SetScript("OnClick", function(self)
        if _PlayerFrame:IsMovable() then
            _PlayerFrame:SetMovable(false)
            _PlayerFrame:EnableMouse(false)
            _PlayerFrame:ClearBackdrop()
            optionFrameButtonUnlock:SetText("Unlock Frames")

        else
            _PlayerFrame:SetMovable(true)
            _PlayerFrame:EnableMouse(true)
            _PlayerFrame:SetBackdrop({
                bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                edgeSize = 12,
                insets = {left = 4, right = 4, top = 4, bottom = 4}
            })
            _PlayerFrame:SetBackdropColor(0, 1, 0, 1)
            _PlayerFrame:SetBackdropBorderColor(0, 1, 0, 1)
            optionFrameButtonUnlock:SetText("Lock Frames")

        end
    end)
    -- HEALTHBAR COLOR MODE
    
    optionFrameToggleBoxHealthClassColor:SetScript("OnClick", function(self)
        if not optionFrameToggleBoxDynamicHealthColor:GetChecked() then
            if self:GetChecked() then
                optionFrameToggleBoxDynamicHealthColor:Disable()
                PlayerHealthBar:SetStatusBarColor(HealthBarColor.r, HealthBarColor.g, HealthBarColor.b)
                optionFrameToggleBoxDynamicHealthColorText:SetTextColor(0.5, 0.5, 0.5)
            else
                optionFrameToggleBoxDynamicHealthColor:Enable()
                PlayerHealthBar:SetStatusBarColor(0.17, 0.54, 0.18)
                optionFrameToggleBoxDynamicHealthColorText:SetTextColor(1, 1, 1)
            end
            optionFrameToggleBoxDynamicHealthColor:Hide()
            optionFrameToggleBoxDynamicHealthColor:Show()
        end
    end)
    
    optionFrameToggleBoxDynamicHealthColor:SetScript("OnClick", function(self)
        if not optionFrameToggleBoxHealthClassColor:GetChecked() then
            if self:GetChecked() then
                optionFrameToggleBoxHealthClassColor:Disable()
                PlayerHealthBarDynamicHealthColorMode = true
                optionFrameToggleBoxHealthClassColorText:SetTextColor(0.5, 0.5, 0.5)
            else
                optionFrameToggleBoxHealthClassColor:Enable()
                PlayerHealthBar:SetStatusBarColor(0.17, 0.54, 0.18)
                PlayerHealthBarDynamicHealthColorMode = false
                optionFrameToggleBoxHealthClassColorText:SetTextColor(1, 1, 1)
            end
            optionFrameToggleBoxDynamicHealthColor:Hide()
            optionFrameToggleBoxDynamicHealthColor:Show()
        end
    end)

    optionFrameToggleBoxShortenResourceText:SetScript("OnClick", function(self)
        if self:GetChecked() then
            if PlayerPowerToken == "MANA" then
                PlayerResourceText:SetText("MP")
            elseif PlayerPowerToken == "RAGE" then
                PlayerResourceText:SetText("RAGE")
            elseif PlayerPowerToken == "ENERGY" then
                PlayerResourceText:SetText("NRG")
            end
            PlayerResourceTextValue:SetPoint("CENTER", PlayerResourceText, "CENTER", 50, 2)

        else
            PlayerResourceText:SetText(PlayerPowerToken)
            PlayerResourceTextValue:SetPoint("CENTER", PlayerResourceText, "CENTER", 60, 2)

        end
    end)