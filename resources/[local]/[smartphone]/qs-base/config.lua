Config = {}

Config.getSharedObject = 'exilerp:getSharedObject'  -- Configure your framework here.
Config.CustomFrameworkExport = false -- Do you want to add your own export?
function CustomFrameworkExport() -- Add the export here, as in the following example.
    -- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    -- QBCore = exports['qb-core']:GetCoreObject()
end

Config.playerLoaded = 'esx:playerLoaded'    -- Configure your framework here.

Config.IbanPrefix = "CRP_"
Config.WalletPrefix = "CRP_"

Config.NumberPrefix = "553" -- Prefix of the number
Config.NumberDigits =  6 -- Amount of digits after the prefix