ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj)
	ESX = obj
	Config.check()
end)