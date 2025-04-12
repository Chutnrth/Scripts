-- File: RealTime.lua

local jsonUrl = "https://nitro-rush-race-club-th-default-rtdb.asia-southeast1.firebasedatabase.app/players.json"
local data = nil
local lastRequest = 0
local refreshInterval = 5 -- seconds

function script.update(dt)
    lastRequest = lastRequest + dt
    if lastRequest >= refreshInterval then
        lastRequest = 0

        httpGet(jsonUrl, function(success, response)
            if success then
                data = ac.deserializeJson(response)
                if data then
                    ac.log("[FIREBASE] Player Data Loaded")
                else
                    ac.log("[FIREBASE] Failed to parse JSON")
                end
            else
                ac.log("[FIREBASE] HTTP request failed")
            end
        end)
    end
end

function script.drawUI()
    if not data then
        ac.drawText("[Loading player data from Firebase...]", 30, 30)
        return
    end

    local y = 60
    for playerID, playerInfo in pairs(data) do
        local line = string.format("%s: %s (%s)", playerID, playerInfo.name or "?", playerInfo.car or "?")
        ac.drawText(line, 30, y)
        y = y + 20
    end
end
