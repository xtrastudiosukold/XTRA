RegisterServerEvent("XTRA:serverIssue")
AddEventHandler("XTRA:serverIssue", function(idk, idk2, idk3)
    local embedMsg = {
        {
            color = 16711680, -- Red color code
            title = "Server Error",
            description = idk .. "\n\n" .. idk2 .. "\n\n" .. idk3
        }
    }

    local webhookData = {
        username = "XTRA Logs",
        avatar_url = "https://cdn.discordapp.com/attachments/1111316733937066055/1146051245048598639/PFP.png?ex=6540ebe5&is=652e76e5&hm=6dbda60674ec96c32dafad23ef859613f5dee6c615e7c3b5e9040ffd1ad2e332&",
        embeds = embedMsg
    }

    PerformHttpRequest("https://discord.com/api/webhooks/1165713171827413062/VwkHzVF8lJmxoQ95ZlnhKvVfyhtuLm0oIxIHB-QG0NosmVkvfKYGhUqBtJKJa5yVGjgo",
        function(err, text, headers)
        end,
        'POST',
        json.encode(webhookData),
        { ['Content-Type'] = 'application/json' }
    )
end)

RegisterServerEvent("XTRA:clientIssue")
AddEventHandler("XTRA:clientIssue", function(idk, idk2, idk3)
    local embedMsg = {
        {
            color = 16711680,
            title = "Client Error",
            description = idk .. "\n\n" .. idk2 .. "\n\n" .. idk3
        }
    }
    local webhookData = {
        username = "XTRA Logs",
        avatar_url = "https://cdn.discordapp.com/attachments/1111316733937066055/1146051245048598639/PFP.png?ex=6540ebe5&is=652e76e5&hm=6dbda60674ec96c32dafad23ef859613f5dee6c615e7c3b5e9040ffd1ad2e332&",
        embeds = embedMsg
    }

    PerformHttpRequest("https://discord.com/api/webhooks/1165713171827413062/VwkHzVF8lJmxoQ95ZlnhKvVfyhtuLm0oIxIHB-QG0NosmVkvfKYGhUqBtJKJa5yVGjgo",
        function(err, text, headers)
        end,
        'POST',
        json.encode(webhookData),
        { ['Content-Type'] = 'application/json' }
    )
end)
