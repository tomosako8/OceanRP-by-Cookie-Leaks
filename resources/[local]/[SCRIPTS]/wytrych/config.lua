MF_LockPicking = {}
local MFL = MF_LockPicking
TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj; end)

Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

MFL.Version = '1.0.10'

MFL.LockTolerance = 20.0
MFL.UsingLockpickItem = true
MFL.TextureDict = "MF_LockPicking"
MFL.AudioBank = "SAFE_CRACK"