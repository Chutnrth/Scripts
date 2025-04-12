-- File: firebase.lua

-- Dummy example script for HUD without Firebase interaction

local data = {
    player1 = { name = "Takumi", car = "AE86 Trueno" },
    player2 = { name = "Keisuke", car = "FD3S RX-7" },
    player3 = { name = "Ryosuke", car = "FC3S RX-7" }
}

function script.update(dt)
    -- No remote call, static data only
end

function script.drawUI()
    local w, h = ac.getUI().width, ac.getUI().height
    local boxW, boxH = 400, 300
    local x = (w - boxW) / 2
    local y = (h - boxH) / 2

    ac.setColor(0, 0, 0, 180)
    ac.drawRect(x, y, boxW, boxH)

    ac.setColor(255, 255, 255, 255)
    ac.drawText("Sample Player Data", x + 20, y + 20)

    local offsetY = y + 60
    for playerID, playerInfo in pairs(data) do
        local line = string.format("%s: %s (%s)", playerID, playerInfo.name or "?", playerInfo.car or "?")
        ac.drawText(line, x + 20, offsetY)
        offsetY = offsetY + 20
    end
end
