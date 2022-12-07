local Player = {}
local SignList = {}

RegisterNetEvent('cookie_sign:signs')
AddEventHandler('cookie_sign:signs', function(signs)
	SignList = signs
end)

Citizen.CreateThread(function()
	Player.Ped = GetPlayerPed(-1)
	while true do
		Citizen.Wait(10)
		local playerCoords = GetEntityCoords(Player.Ped)
		for k,v in ipairs(SignList) do
			local distance = GetDistanceBetweenCoords(playerCoords, v.location.x, v.location.y, v.location.z, true)
			if distance < 30.0 then
				DrawText3Ds(v.location.x, v.location.y, v.location.z, v.text)
				--ESX.Game.Utils.DrawText3D({v.location.x, v.location.y, v.location.z}, v.text, 1.0, 1)
			end
		end
	end
end)

RegisterNetEvent('cookie_sign:deleteSign')
AddEventHandler('cookie_sign:deleteSign', function()
	for k,v in pairs(SignList) do
		local playerCoords = GetEntityCoords(Player.Ped)
		local distance = GetDistanceBetweenCoords(playerCoords, v.location.x, v.location.y, v.location.z, true)
		if distance < 3.0 then
			table.remove(SignList, k)
			TriggerServerEvent('cookie_sign:removeSign', k, v)
			ESX.ShowNotification("Usuwanie tabliczki")
		end
	end
end)

function DrawText3Ds(x,y,z, text)

    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    if onScreen then

        SetTextScale(0.35, 0.35)

        SetTextFont(0)

        SetTextProportional(1)

        SetTextColour(255, 255, 255, 255)

        SetTextDropshadow(0, 0, 0, 0, 55)

        SetTextEdge(2, 0, 0, 0, 150)

        SetTextDropShadow()

        SetTextOutline()

        SetTextEntry("STRING")

        SetTextCentre(1)

        AddTextComponentString(text)

        DrawText(_x, _y)

    end

end
