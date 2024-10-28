-- Server Script painikkeeseen, joka tappaa kohteen
local clickDetector = script.Parent:FindFirstChild("ClickDetector") -- Hakee ClickDetectorin

local debounce = false -- Estää moninkertaiset tappoyritykset lyhyessä ajassa

if clickDetector then
    clickDetector.MouseClick:Connect(function(player)
        if debounce then return end
        debounce = true

        -- Tarkistetaan pelaajan hahmo
        local character = player.Character
        if character then
            -- Hakee kohdepelaajan humanoidin ja tappaa sen
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.Health = 0
            end
        end

        -- Odottaa hetken ennen kuin voi tappaa uudestaan
        wait(1)
        debounce = false
    end)
end
