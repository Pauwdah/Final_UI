

-- PLAYER FRAME
    _PlayerFrame = CreateFrame("Frame", "PlayerFrame", UIParent, "BackdropTemplate")
    _PlayerFrame:SetSize(580, 150)
    _PlayerFrame:SetPoint("CENTER", -50, -400)
    _PlayerFrame:SetMovable(false)
    _PlayerFrame:EnableMouse(false)
    _PlayerFrame:RegisterForDrag("LeftButton")
    _PlayerFrame:SetBackdropColor(0, 1, 0, 1)
    _PlayerFrame:SetBackdropBorderColor(0, 1, 0, 1)
    _PlayerFrame:SetFrameStrata("BACKGROUND")

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
    HealthBarColor = playerClassColor
    print (HealthBarColor.r, HealthBarColor.g, HealthBarColor.b)


-- PLAYER HEALTH BAR
    PlayerHealthBar = CreateFrame("StatusBar", "PlayerHealthBar", _PlayerFrame, "TextStatusBar")
    local playerTargetButton = CreateFrame("Button", "PlayerFrame", _PlayerFrame, "SecureUnitButtonTemplate")
    local healthPercent = (UnitHealth("player") / UnitHealthMax("player")) * 100
    local playerHealthBarSize = {550, 20}
    local playerHealthBarPosition = {0, 0}
    local playerHealthBarBorder = CreateFrame("Frame", "PlayerHealthBarBorder", PlayerHealthBar, "BackdropTemplate")

    PlayerHealthBar:SetMinMaxValues(0, 100)
    PlayerHealthBar:SetValue(100)
    PlayerHealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    PlayerHealthBar:SetStatusBarColor(0.17, 0.54, 0.18)
    PlayerHealthBar:SetOrientation("HORIZONTAL")
    PlayerHealthBar:SetSize(playerHealthBarSize[1], playerHealthBarSize[2])
    PlayerHealthBar:SetPoint("RIGHT", playerHealthBarPosition[1], playerHealthBarPosition[2])
    PlayerHealthBar:SetFrameStrata("BACKGROUND")


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
 
    

    PlayerHealthTextPercent = playerHealthBarBorder:CreateFontString("PlayerHealthText", "OVERLAY", "GameFontNormal")
    PlayerHealthTextPercent:SetPoint("CENTER", playerHealthBarBorder, "CENTER", 0, 0)
    PlayerHealthTextPercent:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    PlayerHealthTextPercent:SetTextColor(1, 1, 1)
    PlayerHealthTextPercent:SetText(healthPercent .. "%")

    local playerHealthTextValue = playerHealthBarBorder:CreateFontString("PlayerHealthTextValue", "OVERLAY", "GameFontNormal")
    playerHealthTextValue:SetPoint("CENTER", playerHealthBarBorder, "CENTER", -220, -12)
    playerHealthTextValue:SetFont("Fonts\\FRIZQT__.TTF", 24, "OUTLINE")
    playerHealthTextValue:SetTextColor(1, 1, 1)
    playerHealthTextValue:SetText(tostring(UnitHealth("player")))
    playerHealthTextValue:SetShadowOffset(3, -3)
    playerHealthTextValue:SetShadowColor(0, 0, 0)





    



-- PLAYER RESOURCE BAR
    local playerResourceBar = CreateFrame("StatusBar", "PlayerResourceBar", _PlayerFrame, "TextStatusBar")
    local playerResourceBarBorder = CreateFrame("Frame", "PlayerResourceBarBorder", playerResourceBar, "BackdropTemplate")
    local playerResourceBarSize = {480, 10}
    PlayerResourceText = playerResourceBarBorder:CreateFontString("PlayerResourceBarText", "OVERLAY", "GameFontNormal")
    PlayerResourceText:SetPoint("LEFT", playerResourceBarBorder, "LEFT", 0, -10)
    PlayerResourceText:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    PlayerResourceText:SetTextColor(1, 1, 1)
    
    PlayerResourceText:SetShadowOffset(3, -3)
    PlayerResourceText:SetShadowColor(0, 0, 0)
    
    local customResourceColors = { 
        ["MANA"] = {r = 0.25,g = 0, b= 1},
        ["RAGE"] = {r = 1,g = 0, b= 0},
        ["ENERGY"] = {r = 1,g =1, b= 0},
    }
    _, PlayerPowerToken, _, _, _ = UnitPowerType("player")
    local currentResourceColor = customResourceColors[PlayerPowerToken]
   

    PlayerResourceText:SetText(PlayerPowerToken)

    

    

    PlayerResourceTextValue = playerResourceBarBorder:CreateFontString("PlayerResourceTextValue", "OVERLAY", "GameFontNormal")
    PlayerResourceTextValue:SetPoint("CENTER", PlayerResourceText, "CENTER", 60, 2)
    PlayerResourceTextValue:SetFont("Fonts\\FRIZQT__.TTF", 24, "OUTLINE")
    PlayerResourceTextValue:SetTextColor(1, 1, 1)
    PlayerResourceTextValue:SetText(tostring(UnitPower("player")))
    PlayerResourceTextValue:SetShadowOffset(3, -3)
    PlayerResourceTextValue:SetShadowColor(0, 0, 0)

    

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
    local characterFrameButton = CreateFrame("Button", "CharacterFrameButton", PlayerHealthBar, "SecureActionButtonTemplate")
    CharacterFrameButtonPortrait3D = CreateFrame("PlayerModel", "CharacterFrameButtonPortrait3D", characterFrameButton)
    CharacterFrameButtonPortrait2D = CreateFrame("Frame", nil, characterFrameButton)
    local portraitTexture = CharacterFrameButtonPortrait2D:CreateTexture(nil, "BACKGROUND")
    local characterFrameButtonSize = {75, 75}
    local characterFrameButtonPosition = {-242, 30}

    characterFrameButton:SetSize(characterFrameButtonSize[1], characterFrameButtonSize[2])
    characterFrameButton:SetPoint("CENTER", characterFrameButtonPosition[1], characterFrameButtonPosition[2])
    characterFrameButton:SetAttribute("type", "click")
    characterFrameButton:SetAttribute("clickbutton", CharacterFrame)


    CharacterFrameButtonPortrait2D:SetSize(characterFrameButtonSize[1], characterFrameButtonSize[2])
    CharacterFrameButtonPortrait2D:SetPoint("CENTER", characterFrameButton, "CENTER")
    CharacterFrameButtonPortrait2D:SetFrameStrata("LOW")
    portraitTexture:SetAllPoints(CharacterFrameButtonPortrait2D)
    SetPortraitTexture(portraitTexture, "player")
    CharacterFrameButtonPortrait2D:SetFrameStrata("BACKGROUND")
    CharacterFrameButtonPortrait2D:SetFrameLevel(1)
    CharacterFrameButtonPortrait2D:Hide()




-- CHARACTER FRAME PORTRAIT 3D
    CharacterFrameButtonPortrait3D:SetSize(characterFrameButtonSize[1], characterFrameButtonSize[2])
    CharacterFrameButtonPortrait3D:SetPoint("CENTER", 3, 10)
    CharacterFrameButtonPortrait3D:SetUnit("player")
    CharacterFrameButtonPortrait3D:SetPortraitZoom(1)
    CharacterFrameButtonPortrait3D:SetCamDistanceScale(1)
    CharacterFrameButtonPortrait3D:SetPosition(0, 0, -0.05)
    CharacterFrameButtonPortrait3D:SetModelScale(1)
    CharacterFrameButtonPortrait3D:SetFrameLevel(1)
    CharacterFrameButtonPortrait3D:SetPortraitZoom(0.7)
    CharacterFrameButtonPortrait3D:SetFrameStrata("BACKGROUND")
    

-- OPTIONS FRAME


 -- LOGIC

    -- PLAYER FRAME
        _PlayerFrame:SetScript("OnDragStart", function(self)
            
                self:StartMoving()
        end)
    
        _PlayerFrame:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
        end)

    -- PLAYER HEALTH BAR
        PlayerHealthBar:SetScript("OnUpdate", function(self, elapsed)
            local health = UnitHealth("player")
            local maxHealth = UnitHealthMax("player")
            local healthPercent = (health / maxHealth) * 100
            PlayerHealthBar:SetValue(healthPercent)
            
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

        PlayerHealthBar:SetScript("OnValueChanged", function(self, value)
            PlayerHealthTextPercent:SetText(math.floor(value) .. "%")
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
                ToggleFrame(OptionFrame)
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

        
        _PlayerFrame:SetScript("OnUpdate", function(self, elapsed)
            if PlayerHealthBarDynamicHealthColorMode then
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
                PlayerHealthBar:SetStatusBarColor(r, g, b)
            
        end

    end)
  