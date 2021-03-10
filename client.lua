local show = false
function openGui()
  if show == false then
    show = true
    SetNuiFocus(true, true)

    SendNUIMessage(
      {
        show = true
      }
    )
  end
end

function closeGui()
  show = false
  SetNuiFocus(false)
  SendNUIMessage({show = false})
end

RegisterCommand('report', function(source)
	openGui()
end)

RegisterNetEvent("reportUI:openGui")
AddEventHandler("reportUI:openGui", function(user_id)
	user_id = user_id
    openGui()
end)

RegisterNUICallback("sendSuggestion", function(data)
  discord = data['data'][1]
  description = data['data'][2]
  if (discord == "" or description == "") then

  else
    TriggerServerEvent("reportUI:sendSuggestion", data)
  end

end)


RegisterNetEvent("reportUI:suggestionSent")
AddEventHandler("reportUI:suggestionSent", function(user_id)
	user_id = user_id
    closeGui()
end)


RegisterNUICallback("emptyFields", function()
  TriggerServerEvent("reportUI:emptyFields")
end)

RegisterNUICallback("close", function()
	closeGui()
end)
