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
