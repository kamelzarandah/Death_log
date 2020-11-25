local dead 
RegisterServerEvent("DiscordBot:playerDied")
AddEventHandler("DiscordBot:playerDied", function(msg,Weapon)
    local webhook = Config.webhook
    local message
    dead = 1
    if Weapon ~= nil then
         message = msg.." Weapon: "..Weapon
    else
         message = msg
    end
    SendWebhookMessage(webhook,message)
end)
function SendWebhookMessage(webhook,message)
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end 
AddEventHandler('playerDropped', function(reason) 
    if dead == 1 and Config.combatlog then
        local webhook = Config.webhook
        message = GetPlayerName(source) .. " Combat logged"
        SendWebhookMessage(webhook,message)
        dead = nil
    end
end)
