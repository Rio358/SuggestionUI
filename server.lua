function GetPlayerNeededIdentifiers(source)
		local ids = GetPlayerIdentifiers(source)
		for i,theIdentifier in ipairs(ids) do
			if string.find(theIdentifier,"license:") or -1 > -1 then
				license = theIdentifier
			elseif string.find(theIdentifier,"steam:") or -1 > -1 then
				steam = theIdentifier
			elseif string.find(theIdentifier,"discord:") or -1 > -1 then
				discord2 = theIdentifier
			end
		end
		if not steam then
			steam = "Not found"
		end
		if not discord2 then
			discord2 = "Not found"
		end
		return license, steam, discord2
	end


RegisterNetEvent("SuggestionUI:sendSuggestion")
AddEventHandler("SuggestionUI:sendSuggestion", function(data)

  discord = data['data'][1]
  description = data['data'][2]

	  local license, steam, discord2 = GetPlayerNeededIdentifiers(source)

if Config.displayidentifiers then
  PerformHttpRequest(Config.discordwebhooklink, function(err, text, headers) end, 'POST', json.encode(
    {
      username = "Reports",
      --avatar_url = Image,
      embeds = {
        {
          title = "New Report",
          color = 16754176,
          description = "**User:** ".. GetPlayerName(source) .. " **[ID:** ".. source .."**]**\n**Suggestion:** ".. description .."\n**Steam:** ".. steam:gsub('steam:', '') .."\n**GameLicense:** ".. license:gsub('license:', '') .."\n**Discord UID:** ".. discord2:gsub('discord:', '') .."\n**Discord Tag:** <@!"..  discord2:gsub('discord:', '') .. ">",
        }
      },
    }), { ['Content-Type'] = 'application/json' })


  TriggerClientEvent("SuggestionUI:suggestionSent", source)
  TriggerClientEvent("mythic_notify:client:SendNotification", source, {type = "inform", text = "Your Report was successfully sent to our Administrators", length = 7000})
else
  PerformHttpRequest(Config.discordwebhooklink, function(err, text, headers) end, 'POST', json.encode(
    {
      username = "Suggestions",
      --avatar_url = Image,
      embeds = {
        {
          title = "New Suggestion",
          color = 16754176,
          description = "**User:** ".. GetPlayerName(source) .. " **[ID:** ".. source .."**]**\n**Suggestion:** ".. description .."",
        }
      },
    }), { ['Content-Type'] = 'application/json' })


  TriggerClientEvent("SuggestionUI:suggestionSent", source)
  TriggerClientEvent("mythic_notify:client:SendNotification", source, {type = "inform", text = "Your Report was successfully sent to our Administrators", length = 7000})
  end
end)

RegisterNetEvent("SuggestionUI:emptyFields")
AddEventHandler("SuggestionUI:emptyFields", function(data)
	TriggerClientEvent("mythic_notify:client:SendNotification", source, {type = "inform", text = "Please fill out the required fields.", length = 7000})
end)

Citizen.CreateThread(function()
	if (GetCurrentResourceName() ~= "reports") then 
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named reports for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named reports for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named reports for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named reports for it to work properly!");
	end
end)

Citizen.CreateThread(function()
    if Config.discordwebhooklink == "WEBHOOK_HERE" then
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
    end
end)