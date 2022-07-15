-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("td_hacking",cRP)
vSERVER = Tunnel.getInterface("td_hacking")
vTASKBAR = Tunnel.getInterface("vrp_taskbar")

src = {}
Tunnel.bindInterface("td_hacking",src)
local cfg = module('td_hacking', 'config')

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local inService = false
local inSelect = 1
local inTimer = 0
local timeDeath = 0

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD-START
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			local distance = #(coords - vector3(Config.StartX,Config.StartY,Config.StartZ))
			if distance <= Config.MaxDistance then
				timeDistance = 4
				TriggerEvent("cancelando",false)
				if inService then
					DrawText3D(Config.StartX,Config.StartY,Config.StartZ,Config.FinalizarEmprego)
				else
					DrawText3D(Config.StartX,Config.StartY,Config.StartZ,Config.IniciarEmprego)
				end

				if IsControlJustPressed(1,38) then
					if inService then
						inService = false
						TriggerEvent("Notify","sucesso","Você terminou o emprego de <b>"..Config.JobName.."</b>.",5000)

					else
						inService = true
						TriggerEvent("Notify","sucesso","Você iniciou o emprego de <b>"..Config.JobName.."</b>.",5000)
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYSTEMTREAD
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local timeDistance = 500
        local ped = PlayerPedId()
        if inService then
            local coords = GetEntityCoords(ped)
            local distance = #(coords - vector3(Config.Locates[inSelect][1],Config.Locates[inSelect][2],Config.Locates[inSelect][3]))
			makeBlipsPosition()
            if distance <= Config.ShowBlip then
                timeDistance = 4
                DrawText3D(Config.Locates[inSelect][1],Config.Locates[inSelect][2],Config.Locates[inSelect][3],Config.Coletar)
				DrawLine(coords, Config.Locates[inSelect][1],Config.Locates[inSelect][2],Config.Locates[inSelect][3], 148, 148, 148,255.0)
                if distance <= Config.HackDis and inTimer <= 0 and IsControlJustPressed(1,38) then

					-- [ HACKEANDO ] --
					TriggerEvent("cancelando",true)
					vRP.createObjects("cellphone@","f_cellphone_text_in","prop_amb_phone",50,28422)

					TriggerEvent('Notify', 'aviso', 'Invadindo sistema...', Config.HackTime)		
				
					vSERVER.callPolice()
					TriggerEvent("Progress",Config.HackTime)
					Citizen.Wait(Config.HackTime)                        

					-- [ PÓS HACKING ] --
					TriggerEvent("cancelando",false)
					vRP.removeObjects()
					cRP.startCollet(k)
					vSERVER.hack()
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        if inTimer > 0 then
            inTimer = inTimer - 1
        end
        Citizen.Wait(1000)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESSPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.startCollet(i)
    inSelect = 1
    inSelect = math.random(#Config.Locates)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	SetTextFont(4)
	SetTextCentre(1)
	SetTextEntry("STRING")
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z,0)
	DrawText(0.0,0.0)
	local factor = (string.len(text) / 450) + 0.01
	DrawRect(0.0,0.0125,factor,0.03,38,42,56,200)
	ClearDrawOrigin()
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKEBLIPSPOSITION
-----------------------------------------------------------------------------------------------------------------------------------------
function makeBlipsPosition()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
		blip = nil
	end

	if not DoesBlipExist(blip) then
		blip = AddBlipForCoord(Config.Locates[inSelect][1],Config.Locates[inSelect][2],Config.Locates[inSelect][3])
		SetBlipSprite(blip,1)
		SetBlipColour(blip,84)
		SetBlipScale(blip,0.4)
		SetBlipAsShortRange(blip,false)
		SetBlipRoute(blip,true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Rota")
		EndTextCommandSetBlipName(blip)
	end
end