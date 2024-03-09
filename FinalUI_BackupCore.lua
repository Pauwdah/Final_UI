_PlayerFrame:Hide()
TargetFrame:Hide()
local eventHandler = CreateFrame("Frame")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_ENTERING_WORLD" then
        _PlayerFrame:Hide()
        TargetFrame:Hide()
    end
end)
eventHandler:RegisterEvent("PLAYER_TARGET_CHANGED")
eventHandler:RegisterEvent("PLAYER_ENTERING_WORLD")



-- PLAYER FRAME
    local playerFrame = CreateFrame("Frame", "PlayerFrame", UIParent, "BackdropTemplate")
    playerFrame:SetSize(580, 150)
    playerFrame:SetPoint("CENTER", -50, -400)
    playerFrame:SetMovable(false)
    playerFrame:EnableMouse(false)
    playerFrame:RegisterForDrag("LeftButton")
    playerFrame:SetBackdropColor(0, 1, 0, 1)
    playerFrame:SetBackdropBorderColor(0, 1, 0, 1)
    playerFrame:SetFrameStrata("BACKGROUND")

    local classColors = {
        ["WARRIOR"] = {r = 0.78,g = 0.61, b= 0.43},
        ["MAGE"] = {r = 0.41,g = 0.8, b= 0.94},
        ["ROGUE"] = {r = 1,g = 0.96, b= 0.41},
        ["DRUID"] = {r = 1,g = 0.49, b= 0.04},
        ["HUNTER"] = {r = 0.67,g = 0.83, b= 0.45},
        ["SHAMAN"] = {r = 0.14,g = 0.35, b= 1},
        ["PRIEST"] = {r = 1,g = 1, b= 1},
        ["WARLOCK"] = {r = 0.58,g = 0.51, b= 0.79},
        ["PALADIN"] = {r = 0.96,g = 0.55, b= 0.73},
        ["DEATHKNIGHT"] = {r = 0.77,g = 0.12, b= 0.23},
        ["MONK"] = {r = 0, g = 1, b = 0.59},
        ["DEMONHUNTER"] = {r = 0.64, g = 0.19, b = 0.79}
    }
    local playerClass = select(2, UnitClass("player"))
    local playerClassColor = classColors[playerClass]
    local healthBarColor = playerClassColor
    print (healthBarColor.r, healthBarColor.g, healthBarColor.b)


-- PLAYER HEALTH BAR
    local playerHealthBar = CreateFrame("StatusBar", "PlayerHealthBar", playerFrame, "TextStatusBar")
    local playerTargetButton = CreateFrame("Button", "PlayerFrame", playerFrame, "SecureUnitButtonTemplate")
    local healthPercent = (UnitHealth("player") / UnitHealthMax("player")) * 100
    local playerHealthBarSize = {550, 20}
    local playerHealthBarPosition = {0, 0}
    local playerHealthBarBorder = CreateFrame("Frame", "PlayerHealthBarBorder", playerHealthBar, "BackdropTemplate")

    playerHealthBar:SetMinMaxValues(0, 100)
    playerHealthBar:SetValue(100)
    playerHealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    playerHealthBar:SetStatusBarColor(0.17, 0.54, 0.18)
    playerHealthBar:SetOrientation("HORIZONTAL")
    playerHealthBar:SetSize(playerHealthBarSize[1], playerHealthBarSize[2])
    playerHealthBar:SetPoint("RIGHT", playerHealthBarPosition[1], playerHealthBarPosition[2])
    playerHealthBar:SetFrameStrata("BACKGROUND")


    playerHealthBarBorder:SetSize(playerHealthBarSize[1] + 10, playerHealthBarSize[2] + 10)
    playerHealthBarBorder:SetPoint("CENTER", playerHealthBarPosition[1], playerHealthBarPosition[2])
    playerHealthBarBorder:SetBackdrop({
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = {left = 4, right = 4, top = 4, bottom = 4}
    })
    playerHealthBarBorder:SetBackdropColor(0, 0, 0, 1)
    playerHealthBarBorder:SetBackdropBorderColor(0, 0, 0, 1)
    playerHealthBarBorder:SetFrameStrata("BACKGROUND")
    playerHealthBarBorder:SetSize(playerHealthBarSize[1] + 5, playerHealthBarSize[2] +5 )
 

    playerTargetButton:SetSize(playerHealthBarSize[1], playerHealthBarSize[2])
    playerTargetButton:SetPoint("CENTER", playerHealthBarPosition[1], playerHealthBarPosition[2])
    playerTargetButton:SetAttribute("unit", "player")
    playerTargetButton:SetAttribute("type1", "target")
    playerTargetButton:SetAttribute("type2", "togglemenu")
    playerTargetButton:SetAttribute("unit2", "player")
    playerTargetButton:SetAttribute("menu", "SELF")
    playerTargetButton:SetAttribute("toggleForVehicle", true)
    playerTargetButton:SetFrameStrata("HIGH")

    local playerHealthTextHP = playerHealthBarBorder:CreateFontString("PlayerHealthTextHP", "OVERLAY", "GameFontNormal")
    playerHealthTextHP:SetPoint("CENTER", playerHealthBarBorder, "CENTER", -260, -15)
    playerHealthTextHP:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    playerHealthTextHP:SetTextColor(1, 1, 1)
    playerHealthTextHP:SetText("HP")
    playerHealthTextHP:SetShadowOffset(3, -3)
    playerHealthTextHP:SetShadowColor(0, 0, 0)
 
    

    local playerHealthTextPercent = playerHealthBarBorder:CreateFontString("PlayerHealthText", "OVERLAY", "GameFontNormal")
    playerHealthTextPercent:SetPoint("CENTER", playerHealthBarBorder, "CENTER", 0, 0)
    playerHealthTextPercent:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    playerHealthTextPercent:SetTextColor(1, 1, 1)
    playerHealthTextPercent:SetText(healthPercent .. "%")

    local playerHealthTextValue = playerHealthBarBorder:CreateFontString("PlayerHealthTextValue", "OVERLAY", "GameFontNormal")
    playerHealthTextValue:SetPoint("CENTER", playerHealthBarBorder, "CENTER", -220, -12)
    playerHealthTextValue:SetFont("Fonts\\FRIZQT__.TTF", 24, "OUTLINE")
    playerHealthTextValue:SetTextColor(1, 1, 1)
    playerHealthTextValue:SetText(tostring(UnitHealth("player")))
    playerHealthTextValue:SetShadowOffset(3, -3)
    playerHealthTextValue:SetShadowColor(0, 0, 0)





    



-- PLAYER RESOURCE BAR
    local playerResourceBar = CreateFrame("StatusBar", "PlayerResourceBar", playerFrame, "TextStatusBar")
    local playerResourceBarBorder = CreateFrame("Frame", "PlayerResourceBarBorder", playerResourceBar, "BackdropTemplate")
    local playerResourceBarSize = {480, 10}
    local playerResourceText = playerResourceBarBorder:CreateFontString("PlayerResourceBarText", "OVERLAY", "GameFontNormal")
    playerResourceText:SetPoint("LEFT", playerResourceBarBorder, "LEFT", 0, -10)
    playerResourceText:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    playerResourceText:SetTextColor(1, 1, 1)
    
    playerResourceText:SetShadowOffset(3, -3)
    playerResourceText:SetShadowColor(0, 0, 0)
    
    local customResourceColors = { 
        ["MANA"] = {r = 0.25,g = 0, b= 1},
        ["RAGE"] = {r = 1,g = 0, b= 0},
        ["ENERGY"] = {r = 1,g =1, b= 0},
    }
    local _, powerToken, _, _, _ = UnitPowerType("player")
    local currentResourceColor = customResourceColors[powerToken]
   

    playerResourceText:SetText(powerToken)

    

    

    local playerResourceTextValue = playerResourceBarBorder:CreateFontString("PlayerResourceTextValue", "OVERLAY", "GameFontNormal")
    playerResourceTextValue:SetPoint("CENTER", playerResourceText, "CENTER", 60, 2)
    playerResourceTextValue:SetFont("Fonts\\FRIZQT__.TTF", 24, "OUTLINE")
    playerResourceTextValue:SetTextColor(1, 1, 1)
    playerResourceTextValue:SetText(tostring(UnitPower("player")))
    playerResourceTextValue:SetShadowOffset(3, -3)
    playerResourceTextValue:SetShadowColor(0, 0, 0)

    

    playerResourceBar:SetMinMaxValues(0, 100)
    playerResourceBar:SetValue(100)
    playerResourceBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    playerResourceBar:SetStatusBarColor(currentResourceColor.r, currentResourceColor.g, currentResourceColor.b)
    playerResourceBar:SetOrientation("HORIZONTAL")
    playerResourceBar:SetSize( playerResourceBarSize[1] , playerResourceBarSize[2])
    playerResourceBar:SetPoint("RIGHT", 0, -40)

    playerResourceBarBorder:SetPoint("CENTER", 0, 0)
    playerResourceBarBorder:SetBackdrop({
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = {left = 4, right = 4, top = 4, bottom = 4}
    })
    playerResourceBarBorder:SetBackdropColor(0, 0, 0, 1)
    playerResourceBarBorder:SetBackdropBorderColor(0, 0, 0, 1)
    playerResourceBarBorder:SetFrameStrata("BACKGROUND")
    playerResourceBarBorder:SetSize(playerResourceBarSize[1] + 5, playerResourceBarSize[2] +5)
    

-- CHARACTER FRAME BUTTON
    local characterFrameButton = CreateFrame("Button", "CharacterFrameButton", playerHealthBar, "SecureActionButtonTemplate")
    local characterFrameButtonPortrait3D = CreateFrame("PlayerModel", "CharacterFrameButtonPortrait3D", characterFrameButton)
    local characterFrameButtonPortrait2D = CreateFrame("Frame", nil, characterFrameButton)
    local portraitTexture = characterFrameButtonPortrait2D:CreateTexture(nil, "BACKGROUND")
    local characterFrameButtonSize = {75, 75}
    local characterFrameButtonPosition = {-242, 30}

    characterFrameButton:SetSize(characterFrameButtonSize[1], characterFrameButtonSize[2])
    characterFrameButton:SetPoint("CENTER", characterFrameButtonPosition[1], characterFrameButtonPosition[2])
    characterFrameButton:SetAttribute("type", "click")
    characterFrameButton:SetAttribute("clickbutton", CharacterFrame)


    characterFrameButtonPortrait2D:SetSize(characterFrameButtonSize[1], characterFrameButtonSize[2])
    characterFrameButtonPortrait2D:SetPoint("CENTER", characterFrameButton, "CENTER")
    characterFrameButtonPortrait2D:SetFrameStrata("LOW")
    portraitTexture:SetAllPoints(characterFrameButtonPortrait2D)
    SetPortraitTexture(portraitTexture, "player")
    characterFrameButtonPortrait2D:SetFrameStrata("BACKGROUND")
    characterFrameButtonPortrait2D:SetFrameLevel(1)
    characterFrameButtonPortrait2D:Hide()




-- CHARACTER FRAME PORTRAIT 3D
    characterFrameButtonPortrait3D:SetSize(characterFrameButtonSize[1], characterFrameButtonSize[2])
    characterFrameButtonPortrait3D:SetPoint("CENTER", 3, 10)
    characterFrameButtonPortrait3D:SetUnit("player")
    characterFrameButtonPortrait3D:SetPortraitZoom(1)
    characterFrameButtonPortrait3D:SetCamDistanceScale(1)
    characterFrameButtonPortrait3D:SetPosition(0, 0, -0.05)
    characterFrameButtonPortrait3D:SetModelScale(1)
    characterFrameButtonPortrait3D:SetFrameLevel(1)
    characterFrameButtonPortrait3D:SetPortraitZoom(0.7)
    characterFrameButtonPortrait3D:SetFrameStrata("BACKGROUND")
    

-- OPTIONS FRAME

    local optionFrame = CreateFrame("Frame", "OptionFrame", UIParent, "BasicFrameTemplateWithInset")
    optionFrame:SetSize(300, 400)
    optionFrame:SetPoint("CENTER", 0, 0)
    optionFrame:SetMovable(true)
    optionFrame:EnableMouse(true)
    optionFrame:RegisterForDrag("LeftButton")
    optionFrame:Hide()

    local optionFrameTitle = optionFrame:CreateFontString("OptionFrameTitle", "OVERLAY", "GameFontNormal")
    optionFrameTitle:SetPoint("CENTER", optionFrame, "TOP", 0, -10)
    optionFrameTitle:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    optionFrameTitle:SetTextColor(1, 1, 1)
    optionFrameTitle:SetText("Options")

    local optionFrameButtonUnlock = CreateFrame("Button", "OptionFrameButtonClose", optionFrame, "UIPanelButtonTemplate")
    optionFrameButtonUnlock:SetSize(150, 30)
    optionFrameButtonUnlock:SetPoint("TOP", optionFrame, "TOP", 0, -30)
    optionFrameButtonUnlock:SetText("Unlock Frames")

    local optionFrameButtonTogglePortrait = CreateFrame("Button", "OptionFrameButtonTogglePortrait", optionFrame, "UIPanelButtonTemplate")
    optionFrameButtonTogglePortrait:SetSize(150, 30)
    optionFrameButtonTogglePortrait:SetPoint("TOPLEFT", optionFrame, "TOPLEFT", 10, -60)
    optionFrameButtonTogglePortrait:SetText("Toggle Portrait 2D/3D")

    local optionFrameToggleBoxHPPercent = CreateFrame("CheckButton", "OptionFrameToggleBoxHPPercent", optionFrame, "UICheckButtonTemplate")
    local optionFrameToggleBoxHPPercentText = optionFrame:CreateFontString("OptionFrameToggleBoxHPPercentText", "OVERLAY", "GameFontNormal")
    optionFrameToggleBoxHPPercent:SetSize(30, 30)
    optionFrameToggleBoxHPPercent:SetPoint("TOPLEFT", optionFrame, "TOPLEFT", 10, -90)
    optionFrameToggleBoxHPPercentText:SetPoint("TOPLEFT", optionFrame, "TOPLEFT", 40, -97 )
    optionFrameToggleBoxHPPercentText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    optionFrameToggleBoxHPPercentText:SetTextColor(1, 1, 1)
    optionFrameToggleBoxHPPercentText:SetText("Show HP %")
    optionFrameToggleBoxHPPercent:SetChecked(true)

    local optionFrameToggleBoxHealthClassColor = CreateFrame("CheckButton", "OptionFrameToggleBoxHealthClassColor", optionFrame, "UICheckButtonTemplate")
    local optionFrameToggleBoxHealthClassColorText = optionFrame:CreateFontString("OptionFrameToggleBoxHealthClassColorText", "OVERLAY", "GameFontNormal")
    optionFrameToggleBoxHealthClassColor:SetSize(30, 30)
    optionFrameToggleBoxHealthClassColor:SetPoint("TOPLEFT", optionFrame, "TOPLEFT", 10, -120)
    optionFrameToggleBoxHealthClassColorText:SetPoint("TOPLEFT", optionFrame, "TOPLEFT", 40, -127)
    optionFrameToggleBoxHealthClassColorText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    optionFrameToggleBoxHealthClassColorText:SetTextColor(1, 1, 1)
    optionFrameToggleBoxHealthClassColorText:SetText("Use Class Color for Healthbar")

    local optionFrameToggleBoxDynamicHealthColor = CreateFrame("CheckButton", "OptionFrameToggleBoxDynamicHealthColor", optionFrame, "UICheckButtonTemplate")
    local optionFrameToggleBoxDynamicHealthColorText = optionFrame:CreateFontString("OptionFrameToggleBoxDynamicHealthColorText", "OVERLAY", "GameFontNormal")
    local dynamicHealthColorMode = false
    optionFrameToggleBoxDynamicHealthColor:SetSize(30, 30)
    optionFrameToggleBoxDynamicHealthColor:SetPoint("TOPLEFT", optionFrame, "TOPLEFT", 10, -150)
    optionFrameToggleBoxDynamicHealthColorText:SetPoint("TOPLEFT", optionFrame, "TOPLEFT", 40, -157)
    optionFrameToggleBoxDynamicHealthColorText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    optionFrameToggleBoxDynamicHealthColorText:SetTextColor(1, 1, 1)
    optionFrameToggleBoxDynamicHealthColorText:SetText("Use Dynamic Healthbar Color")

    local optionFrameToggleBoxShortenResourceText = CreateFrame("CheckButton", "OptionFrameToggleBoxShortenResourceText", optionFrame, "UICheckButtonTemplate")
    local optionFrameToggleBoxShortenResourceTextText = optionFrame:CreateFontString("OptionFrameToggleBoxShortenResourceTextText", "OVERLAY", "GameFontNormal")
    optionFrameToggleBoxShortenResourceText:SetSize(30, 30)
    optionFrameToggleBoxShortenResourceText:SetPoint("TOPLEFT", optionFrame, "TOPLEFT", 10, -180)
    optionFrameToggleBoxShortenResourceTextText:SetPoint("TOPLEFT", optionFrame, "TOPLEFT", 40, -187)
    optionFrameToggleBoxShortenResourceTextText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    optionFrameToggleBoxShortenResourceTextText:SetTextColor(1, 1, 1)
    optionFrameToggleBoxShortenResourceTextText:SetText("Shorten Resource Text")


 -- LOGIC
    -- OPTIONS FRAME
        optionFrameButtonTogglePortrait:SetScript("OnClick", function(self)
            if characterFrameButtonPortrait3D:IsShown() then
                characterFrameButtonPortrait3D:Hide()
                characterFrameButtonPortrait2D:Show()
            else
                characterFrameButtonPortrait3D:Show()
                characterFrameButtonPortrait2D:Hide()
            end
        end)
        optionFrame:SetScript("OnDragStart", function(self)
            if IsShiftKeyDown() then
                self:StartMoving()
            end
        end)

        optionFrame:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
        end)

        optionFrameToggleBoxHPPercent:SetScript("OnClick", function(self)
            if self:GetChecked() then
                playerHealthTextPercent:Show()
            else
                playerHealthTextPercent:Hide()
            end
        end)

        optionFrameButtonUnlock:SetScript("OnClick", function(self)
            if playerFrame:IsMovable() then
                playerFrame:SetMovable(false)
                playerFrame:EnableMouse(false)
                playerFrame:ClearBackdrop()
                optionFrameButtonUnlock:SetText("Unlock Frames")

            else
                playerFrame:SetMovable(true)
                playerFrame:EnableMouse(true)
                playerFrame:SetBackdrop({
                    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    edgeSize = 12,
                    insets = {left = 4, right = 4, top = 4, bottom = 4}
                })
                playerFrame:SetBackdropColor(0, 1, 0, 1)
                playerFrame:SetBackdropBorderColor(0, 1, 0, 1)
                optionFrameButtonUnlock:SetText("Lock Frames")

            end
        end)
        -- HEALTHBAR COLOR MODE
        
        optionFrameToggleBoxHealthClassColor:SetScript("OnClick", function(self)
            if not optionFrameToggleBoxDynamicHealthColor:GetChecked() then
                if self:GetChecked() then
                    optionFrameToggleBoxDynamicHealthColor:Disable()
                    playerHealthBar:SetStatusBarColor(healthBarColor.r, healthBarColor.g, healthBarColor.b)
                    optionFrameToggleBoxDynamicHealthColorText:SetTextColor(0.5, 0.5, 0.5)
                else
                    optionFrameToggleBoxDynamicHealthColor:Enable()
                    playerHealthBar:SetStatusBarColor(0.17, 0.54, 0.18)
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
                    dynamicHealthColorMode = true
                    optionFrameToggleBoxHealthClassColorText:SetTextColor(0.5, 0.5, 0.5)
                else
                    optionFrameToggleBoxHealthClassColor:Enable()
                    playerHealthBar:SetStatusBarColor(0.17, 0.54, 0.18)
                    dynamicHealthColorMode = false
                    optionFrameToggleBoxHealthClassColorText:SetTextColor(1, 1, 1)
                end
                optionFrameToggleBoxDynamicHealthColor:Hide()
                optionFrameToggleBoxDynamicHealthColor:Show()
            end
        end)

        optionFrameToggleBoxShortenResourceText:SetScript("OnClick", function(self)
            if self:GetChecked() then
                if powerToken == "MANA" then
                    playerResourceText:SetText("MP")
                elseif powerToken == "RAGE" then
                    playerResourceText:SetText("RAGE")
                elseif powerToken == "ENERGY" then
                    playerResourceText:SetText("NRG")
                end
                playerResourceTextValue:SetPoint("CENTER", playerResourceText, "CENTER", 50, 2)

            else
                playerResourceText:SetText(powerToken)
                playerResourceTextValue:SetPoint("CENTER", playerResourceText, "CENTER", 60, 2)

            end
        end)


    -- PLAYER FRAME
        playerFrame:SetScript("OnDragStart", function(self)
            
                self:StartMoving()
        end)
    
        playerFrame:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
        end)

    -- PLAYER HEALTH BAR
        playerHealthBar:SetScript("OnUpdate", function(self, elapsed)
            local health = UnitHealth("player")
            local maxHealth = UnitHealthMax("player")
            local healthPercent = (health / maxHealth) * 100
            playerHealthBar:SetValue(healthPercent)
            
        end)
        
        playerTargetButton:RegisterForClicks("AnyDown")
        playerTargetButton:SetScript("OnEnter", function(self)
            GameTooltip_SetDefaultAnchor(GameTooltip, self)
            GameTooltip:SetUnit("player")
            GameTooltip:Show()
        end)
        playerTargetButton:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
        end)

        playerHealthBar:SetScript("OnValueChanged", function(self, value)
            playerHealthTextPercent:SetText(math.floor(value) .. "%")
            playerHealthTextValue:SetText(tostring(UnitHealth("player")))
        end)


    -- PLAYER RESOURCE BAR
        playerResourceBar:SetScript("OnUpdate", function(self, elapsed)
            local resource = UnitPower("player")
            local maxResource = UnitPowerMax("player")
            local resourcePercent = (resource / maxResource) * 100
            playerResourceBar:SetValue(resourcePercent)
        end)

    -- CHARACTER FRAME BUTTON
        characterFrameButton:SetScript("OnMouseDown", function(self, button)
            if button == "RightButton" then
                ToggleFrame(optionFrame)
            end
        end)
        
        characterFrameButton:SetScript("OnClick", function(self)
            ToggleCharacter("PaperDollFrame")
        end)
        
        characterFrameButton:SetScript("OnEnter", function(self)
            GameTooltip_SetDefaultAnchor(GameTooltip, self)
            GameTooltip:SetText("Character Frame")
            GameTooltip:Show()
        end)
        
        characterFrameButton:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
        end)

        -- DYNAMIC HEALTHBAR COLOR MODE

        
        playerFrame:SetScript("OnUpdate", function(self, elapsed)
            if dynamicHealthColorMode then
                local health = UnitHealth("player")
                local maxHealth = UnitHealthMax("player")
                local healthPercent = (health / maxHealth) * 100
                local r = 0
                local g = 0
                local b = 0
                if healthPercent > 50 then
                    r = (1 - (healthPercent / 100)) * 2
                    g = 1
                else
                    r = 1
                    g = (healthPercent / 100) * 2
                end
                playerHealthBar:SetStatusBarColor(r, g, b)
            
        end

    end)
  