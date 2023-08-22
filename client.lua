ESX = exports.es_extended:getSharedObject()
local display = false


RegisterNetEvent('SnkPopolari:setdisplay')
AddEventHandler('SnkPopolari:setdisplay', function(bool) 
    display = bool     
    SetNuiFocus(bool, bool)     
    SendNUIMessage({ type = "ui",  status = bool, })
end )


RegisterNUICallback('exit', function(data)
    TriggerEvent('SnkPopolari:setdisplay', false)
 end)

 RegisterNUICallback('acquista', function()
	TriggerServerEvent('snkpopolari:riscattachiavi', 'chiavidicasa', 1)
	TriggerServerEvent('snkpopolari:rimuovisoldi', 'money', 150)
	TriggerEvent('SnkPopolari:setdisplay', false)
 end)

 --inizio del codice asikhjdasgvhudgvsadgtasvdsajhldfgsvadhjklsavdsajghkdv--




--
Citizen.CreateThread(function()

	TriggerEvent('gridsystem:registerMarker', {
		name = "popolare entrata",
		pos = Popolari.EntrataCasa,
		size = vector3(1.2, 1.2, 1.2),
		scale = vector3(0.8, 0.8, 0.8),
		type = -1,
		control = 'E',
		rotate = 0.0,
		rotate2 = 0.0,
		shouldBob = false,
		shouldRotate = true,
		color = { r = 255, g = 255, b = 255 },
		trasparent = 255,
		texture = 'scuolaguida',
		msg = 'ENTRATA',
		action = function()
			DoScreenFadeOut(800)
			while not IsScreenFadedOut() do
				Citizen.Wait(0)
			end
			TriggerServerEvent('snkpopolari:joinPopolare')
			SetEntityCoords(PlayerPedId(), Popolari.TeleportEntrata)
			DoScreenFadeIn(800)
		end,
		onExit = function()
		end,
	})
    --
	TriggerEvent('gridsystem:registerMarker', {
		name = "popolare uscita",
		pos = Popolari.UscitaCasa,
		size = vector3(1.2, 1.2, 1.2),
		scale = vector3(0.8, 0.8, 0.8),
		type = -1,
		control = 'E',
		rotate = 0.0,
		rotate2 = 0.0,
		shouldBob = false,
		shouldRotate = true,
		color = { r = 255, g = 255, b = 255 },
		trasparent = 255,
		texture = 'scuolaguida',
		msg = 'USCITA',
		action = function()
			DoScreenFadeOut(800)
			while not IsScreenFadedOut() do
				Citizen.Wait(0)
			end
			TriggerServerEvent('snkpopolari:esciPopolare')
			SetEntityCoords(PlayerPedId(), Popolari.TeleportUscita)
			DoScreenFadeIn(800)
		end
	})
    --
	TriggerEvent('gridsystem:registerMarker', {
		name = 'Inventario Popolare',
		pos = Popolari.InventarioPopolare,
		size = vector3(1.2, 1.2, 1.2),
		scale = vector3(0.8, 0.8, 0.8),
		type = -1,
		control = 'E',
		rotate = 0.0,
		rotate2 = 0.0,
		shouldBob = false,
		shouldRotate = true,
		color = { r = 255, g = 255, b = 255 },
		trasparent = 255,
		msg = 'DEPOSITO',
		texture = 'inventario',
		action = function()
			ESX.TriggerServerCallback('snkpopolari:apriinv', function(isSuccessful)
				if(isSuccessful) then
					exports.ox_inventory:openInventory('stash', isSuccessful)
				end
			end)
		end
	})
    --
	TriggerEvent('gridsystem:registerMarker', {
		name = 'Guardaroba Popolare',
		pos = Popolari.Guardaroba,
		size = vector3(1.2, 1.2, 1.2),
		scale = vector3(0.8, 0.8, 0.8),
		type = -1,
		control = 'E',
		rotate = 0.0,
		rotate2 = 0.0,
		shouldBob = false,
		shouldRotate = true,
		color = { r = 255, g = 255, b = 255 },
		trasparent = 255,
		msg = 'GUARDAROBA',
		texture = 'vestiti',
		action = function()
			 exports['fivem-appearance']:startPlayerCustomization()
		end
	})


	TriggerEvent('gridsystem:registerMarker', {
		name = "riscatta chiavi",
		pos = vector3(299.23895263672,-995.00109863281,29.270666122437),
		size = vector3(1.2, 1.2, 1.2),
		scale = vector3(0.8, 0.8, 0.8),
		control = 'E',
		rotate = 0.0,
		rotate2 = 0.0,
		shouldBob = false,
		shouldRotate = true,
		color = { r = 255, g = 255, b = 255 },
		trasparent = 255,
		type = 21,
		msg = 'Casa Popolare',
		action = function()
			CreateThread(function()
				TriggerEvent('SnkPopolari:setdisplay', true)
				while display do 
					DisableControlAction(0,1, display)
    				DisableControlAction(0,142, display)
    				DisableControlAction(0,18, display)
    				DisableControlAction(0,322, display)
    				DisableControlAction(0,2, display)
    				DisableControlAction(0,106, display)
					Wait(0)
				end
			end)
		end
	})
end)





Citizen.CreateThread(function()
    if not HasModelLoaded('a_m_y_smartcaspat_01') then
       RequestModel('a_m_y_smartcaspat_01')
       while not HasModelLoaded('a_m_y_smartcaspat_01') do
          Citizen.Wait(5)
       end
    end

    Npc = CreatePed(4, 'a_m_y_smartcaspat_01',299.1887, -994.4012, 28.2919, 190.4582, false, true)
    FreezeEntityPosition(Npc, true)
    SetEntityInvincible(Npc, true)
    SetBlockingOfNonTemporaryEvents(Npc, true)
end)