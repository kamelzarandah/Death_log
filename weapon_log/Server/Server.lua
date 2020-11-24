RegisterServerEvent("DiscordBot:playerDied")
AddEventHandler("DiscordBot:playerDied", function(msg,Weapon)
    local webhook = Config.webhook
    local message
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