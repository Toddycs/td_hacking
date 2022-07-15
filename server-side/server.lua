-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("td_hacking",cRP)
vCLIENT = Tunnel.getInterface("td_hacking")
vTASKBAR = Tunnel.getInterface("vrp_taskbar")

src = {}
Tunnel.bindInterface("td_hacking",src)
local cfg = module('td_hacking', 'config')

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.hack()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not Config.Creative then
			print('Not Summerz')
		else
            print('')
		end

		vRP.giveInventoryItem(user_id,Config.itensList[math.random(#Config.itensList)],Config.RandQuant,true)

		if Config.HasStress then
			vRP.upgradeStress(user_id,0.5)
		end
	end
end

function cRP.callPolice()
    local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if math.random(100) >= 50 then
            local x,y,z = vRPclient.getPositions(source)
            local copAmount = vRP.numPermission("Police")
            local root = math.random(1,4)
            local motivo = ""

            if root == 1 then
                motivo = "Nosso firewall encontrou alguém nos invadindo."
            end
            if root == 2 then
                motivo = "Alguém está invadindo nossos servidores."
            end
            if root == 3 then
                motivo = "O sistema encontrou alguém invadindo."
            end
            if root == 4 then
                motivo = "Nosso sistema está sendo invadido."
            end

            print(root)
            TriggerClientEvent('Notify', source, 'aviso', 'A Policia foi alertada sobre a invasão.', 5000)
            for k,v in pairs(copAmount) do
                async(function()
                    print('Alerta Hack')
                    TriggerClientEvent("NotifyPush",v,{ time = os.date("%H:%M"), code = "QRU", title = "Invasão ao Sistema", vehicle = motivo, x = x, y = y, z = z, rgba = {140,35,35} })
                end)
            end
        end
	end
end
