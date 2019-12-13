local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_blips")

AddEventHandler('chatMessage', function(source, name, msg)
    sm = stringsplit(msg, " ");
	local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id, "admin.blips"}) then
		if sm[1] == "/blips" then
			CancelEvent()
			TriggerClientEvent('mostraBlips', source)
		end
	else
		CancelEvent()
		TriggerClientEvent('nopermsblips', source)
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
    sm = stringsplit(msg, " ");
	local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id, "admin.blips"}) then
		if sm[1] == "/names" then
			CancelEvent()
			TriggerClientEvent('mostraNomi', source)
		else
			CancelEvent()
		TriggerClientEvent('nopermsnames', source)
		end
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
