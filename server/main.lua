ESX = nil

local give = false
local usedRope = false

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/podnies' then
        TriggerClientEvent('esx_barbie_lyftupp:start', player)
        CancelEvent()
    end
end)

RegisterServerEvent('esx_barbie_lyftupp:checkRope')
AddEventHandler('esx_barbie_lyftupp:checkRope', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local ropeQuantity = xPlayer.getInventoryItem('rope').count
	
	if ropeQuantity > 0 then
		TriggerClientEvent('esx_barbie_lyftupp:trueRope', source) -- true
	else
		TriggerClientEvent('esx_barbie_lyftupp:falseRope', source) -- false
	end
end)

RegisterServerEvent('esx_barbie_lyftupp:removeRope')
AddEventHandler('esx_barbie_lyftupp:removeRope', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.removeInventoryItem('rope', 1)
	TriggerClientEvent('esx_barbie_lyftupp:trueUsedRope', source)
	
end)

RegisterServerEvent('esx_barbie_lyftupp:lyfter')
AddEventHandler('esx_barbie_lyftupp:lyfter', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent('esx_barbie_lyftupp:upplyft', targetPlayer.source, source)
end)

RegisterServerEvent('esx_barbie_lyftupp:sendInfo')
AddEventHandler('esx_barbie_lyftupp:sendInfo', function(source)
	TriggerClientEvent('esx:showNotification', source, ('Ktos probuje cie podnies...'))
end)

