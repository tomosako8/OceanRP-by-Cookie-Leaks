local tryb = 'Zrównoważony'
local desire_performance = {
    ['qHud'] = {
        wait = 250,
		wait2 = 500,
		wait3 = 700,
    }
}

RegisterCommand('lowpc', function()
	ESX.UI.Menu.CloseAll()
	local elements = {
		{label = 'Aktualny tryb: '.. tryb, value = nil},
		{label = "Zmień aktualny wydajności", value = 'desire'},
	}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lowpc', {
		title = 'LOWPC SETTINGS',
		align = 'center',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'desire' then
			performanceEditor()
		end
	end, function(data, menu)
		menu.close()
	end)
end)

function performanceEditor()
	ESX.UI.Menu.CloseAll()
	local elements = {
		{label = "Wysoka wydajność", value = 'Wydajnościowy'},
		{label = "Zrównoważona wydajność", value = 'Zrównoważony'}
	}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lowpc_tryb', {
		title = 'LOWPC | Aktualny tryb: '.. tryb,
		align = 'center',
		elements = elements
	}, function(data, menu)
		savePerformance(data.current.value)
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

function savePerformance(value)
	tryb = value
	ESX.ShowAdvancedNotification('~o~PERFORMANCE', '', '~o~Pomyślnie zmieniono tryb na: ~w~'.. tryb)
	if tryb == 'Wydajnościowy' then
		TriggerEvent('desire_lowpc:loadPerformance', desire_performance)
	end
end