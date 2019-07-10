local options = {
    x = 0.1,
    y = 0.25,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Compte Personnel",
    menu_subtitle = "CATEGORIES",
    color_r = 38,
    color_g = 182,
    color_b = 255,
}

RegisterNetEvent("mp:firstspawn")
AddEventHandler("mp:firstspawn",function()
	Main() -- Menu to draw
    Menu.hidden = not Menu.hidden -- Hide/Show the menu
    Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
end)


function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


function ATM()
    options.menu_subtitle = "CATEGORIES"
    ClearMenu()
    Menu.addButton("Retirer de l'argent", "withdraw", nil) 
    Menu.addButton("Retrait rapide (1000€)", "withdrawal", nil)
    Menu.addButton("Fermer", "closemenu", nil)       
  Citizen.CreateThread(function()
  end)
end


function Banque()
    options.menu_subtitle = "CATEGORIES"
    ClearMenu()
    Menu.addButton("Déposer de l'argent", "deposit", nil)
    Menu.addButton("Retirer de l'argent", "withdraw", nil)  
    Menu.addButton("Retrait rapide (1000€)", "withdrawal", nil)  
    Menu.addButton("Fermer", "closemenu", nil)
end


function deposit()
	DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 64)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0);
        
    end
    if (GetOnscreenKeyboardResult()) then
    	--if (assert(type(x) == "number"))then
        local result = GetOnscreenKeyboardResult()
       	TriggerServerEvent('bank:deposit',result)
       	--end


    end
	
end

function withdraw()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 64)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0);
        
    end
    if (GetOnscreenKeyboardResult()) then
    	--if (assert(type(x) == "number"))then
        local result = GetOnscreenKeyboardResult()
       	TriggerServerEvent('bank:withdraw',result)
       	--end


    end
	
end

function withdrawal()
   TriggerServerEvent('bank:withdrawal', 100)
end

function closemenu()
    Menu.hidden = not Menu.hidden
end


local banque = {
	{ ['x'] = 150.21324157715, ['y'] = -1039.4409179688, ['z'] = 29.367971420288 },
	{ ['x'] = -1213.0673828125, ['y'] = -330.29452514648, ['z'] = 37.78702545166 },
	{ ['x'] = -350.67395019531, ['y'] = -48.936996459961, ['z'] = 49.042346954346 },
	{ ['x'] = 242.07392883301, ['y'] = 223.74931335449, ['z'] = 106.28688049316 },
	{ ['x'] = -2964.1176757813, ['y'] = 482.82775878906, ['z'] = 15.697063446045 },
	{ ['x'] = -112.94868469238, ['y'] = 6470.0366210938, ['z'] = 31.626703262329 },
}

local atm = {
	{name="ATM", id=277, x=-386.733, y=6045.953, z=31.501},
	{name="ATM", colour=2, scale=0.8, id=431, x=-284.037, y=6224.385, z=31.187},
	{name="ATM", colour=2, scale=0.8, id=431, x=-284.037, y=6224.385, z=31.187},
	{name="ATM", colour=2, scale=0.8, id=431, x=-135.165, y=6365.738, z=31.101},
	{name="ATM", colour=2, scale=0.8, id=431, x=-110.753, y=6467.703, z=31.784},
	{name="ATM", colour=2, scale=0.8, id=431, x=-94.9690, y=6455.301, z=31.784},
	{name="ATM", colour=2, scale=0.8, id=431, x=155.4300, y=6641.991, z=31.784},
	{name="ATM", colour=2, scale=0.8, id=431, x=174.6720, y=6637.218, z=31.784},
	{name="ATM", colour=2, scale=0.8, id=431, x=1703.138, y=6426.783, z=32.730},
	{name="ATM", colour=2, scale=0.8, id=431, x=1735.114, y=6411.035, z=35.164},
	{name="ATM", colour=2, scale=0.8, id=431, x=1702.842, y=4933.593, z=42.051},
	{name="ATM", colour=2, scale=0.8, id=431, x=1967.333, y=3744.293, z=32.272},
	{name="ATM", colour=2, scale=0.8, id=431, x=1821.917, y=3683.483, z=34.244},
	{name="ATM", colour=2, scale=0.8, id=431, x=1174.532, y=2705.278, z=38.027},
	{name="ATM", colour=2, scale=0.8, id=431, x=540.0420, y=2671.007, z=42.177},
	{name="ATM", colour=2, scale=0.8, id=431, x=2564.399, y=2585.100, z=38.016},
	{name="ATM", colour=2, scale=0.8, id=431, x=2558.683, y=349.6010, z=108.050},
	{name="ATM", colour=2, scale=0.8, id=431, x=2558.051, y=389.4817, z=108.660},
	{name="ATM", colour=2, scale=0.8, id=431, x=1077.692, y=-775.796, z=58.218},
	{name="ATM", colour=2, scale=0.8, id=431, x=1139.018, y=-469.886, z=66.789},
	{name="ATM", colour=2, scale=0.8, id=431, x=1168.975, y=-457.241, z=66.641},
	{name="ATM", colour=2, scale=0.8, id=431, x=1153.884, y=-326.540, z=69.245},
	{name="ATM", colour=2, scale=0.8, id=431, x=381.2827, y=323.2518, z=103.270},
	{name="ATM", colour=2, scale=0.8, id=431, x=236.4638, y=217.4718, z=106.840},
	{name="ATM", colour=2, scale=0.8, id=431, x=265.0043, y=212.1717, z=106.780},
	{name="ATM", colour=2, scale=0.8, id=431, x=285.2029, y=143.5690, z=104.970},
	{name="ATM", colour=2, scale=0.8, id=431, x=157.7698, y=233.5450, z=106.450},
	{name="ATM", colour=2, scale=0.8, id=431, x=-164.568, y=233.5066, z=94.919},
	{name="ATM", colour=2, scale=0.8, id=431, x=-1827.04, y=785.5159, z=138.020},
	{name="ATM", colour=2, scale=0.8, id=431, x=-1409.39, y=-99.2603, z=52.473},
	{name="ATM", colour=2, scale=0.8, id=431, x=-1205.35, y=-325.579, z=37.870},
	{name="ATM", colour=2, scale=0.8, id=431, x=-2072.41, y=-316.959, z=13.345},
	{name="ATM", colour=2, scale=0.8, id=431, x=-2975.72, y=379.7737, z=14.992},
	{name="ATM", colour=2, scale=0.8, id=431, x=-2962.60, y=482.1914, z=15.762},
	{name="ATM", colour=2, scale=0.8, id=431, x=-2955.70, y=488.7218, z=15.486},
	{name="ATM", colour=2, scale=0.8, id=431, x=-3044.22, y=595.2429, z=7.595},
	{name="ATM", colour=2, scale=0.8, id=431, x=-3144.13, y=1127.415, z=20.868},
	{name="ATM", colour=2, scale=0.8, id=431, x=-3241.10, y=996.6881, z=12.500},
	{name="ATM", colour=2, scale=0.8, id=431, x=-3241.11, y=1009.152, z=12.877},
	{name="ATM", colour=2, scale=0.8, id=431, x=-1305.40, y=-706.240, z=25.352},
	{name="ATM", colour=2, scale=0.8, id=431, x=-538.225, y=-854.423, z=29.234},
	{name="ATM", colour=2, scale=0.8, id=431, x=-711.156, y=-818.958, z=23.768},
	{name="ATM", colour=2, scale=0.8, id=431, x=-717.614, y=-915.880, z=19.268},
	{name="ATM", colour=2, scale=0.8, id=431, x=-526.566, y=-1222.90, z=18.434},
	{name="ATM", colour=2, scale=0.8, id=431, x=-256.831, y=-719.646, z=33.444},
	{name="ATM", colour=2, scale=0.8, id=431, x=-203.548, y=-861.588, z=30.205},
	{name="ATM", colour=2, scale=0.8, id=431, x=112.4102, y=-776.162, z=31.427},
	{name="ATM", colour=2, scale=0.8, id=431, x=112.9290, y=-818.710, z=31.386},
	{name="ATM", colour=2, scale=0.8, id=431, x=119.9000, y=-883.826, z=31.191},
	{name="ATM", colour=2, scale=0.8, id=431, x=-846.304, y=-340.402, z=38.687},
	{name="ATM", colour=2, scale=0.8, id=431, x=-56.1935, y=-1752.53, z=29.452},
	{name="ATM", colour=2, scale=0.8, id=431, x=-261.692, y=-2012.64, z=30.121},
	{name="ATM", colour=2, scale=0.8, id=431, x=-273.001, y=-2025.60, z=30.197},
	{name="ATM", colour=2, scale=0.8, id=431, x=314.187, y=-278.621, z=54.170},
	{name="ATM", colour=2, scale=0.8, id=431, x=24.589, y=-946.056, z=29.357},
	{name="ATM", colour=2, scale=0.8, id=431, x=-254.112, y=-692.483, z=33.616},
	{name="ATM", colour=2, scale=0.8, id=431, x=-1570.197, y=-546.651, z=34.955},
	{name="ATM", colour=2, scale=0.8, id=431, x=-1415.909, y=-211.825, z=46.500},
	{name="ATM", colour=2, scale=0.8, id=431, x=-1430.112, y=-211.014, z=46.500},
	{name="ATM", colour=2, scale=0.8, id=431, x=33.232, y=-1347.849, z=29.497},
	{name="ATM", colour=2, scale=0.8, id=431, x=129.216, y=-1292.347, z=29.269},
	{name="ATM", colour=2, scale=0.8, id=431, x=287.645, y=-1282.646, z=29.659},
	{name="ATM", colour=2, scale=0.8, id=431, x=289.012, y=-1256.545, z=29.440},
	{name="ATM", colour=2, scale=0.8, id=431, x=295.839, y=-895.640, z=29.217},
	{name="ATM", colour=2, scale=0.8, id=431, x=1686.753, y=4815.809, z=42.008},
	{name="ATM", colour=2, scale=0.8, id=431, x=-302.408, y=-829.945, z=32.417},
	{name="ATM", colour=2, scale=0.8, id=431, x=5.134, y=-919.949, z=29.557},
}


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(banque) do
			if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 20.0)then
				if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 5.0)then
					DisplayHelpText("~s~Appuyez sur ~INPUT_PICKUP~ pour accéder à votre compte bancaire.")
					if IsControlJustPressed(1, 38) then
                        Banque()
                        Menu.hidden = not Menu.hidden
				    end
                  Menu.renderGUI(options)
                end
            end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(atm) do
			if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 20.0)then
				if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 2.0)then
					DisplayHelpText("~s~Appuyez sur ~INPUT_PICKUP~ pour accéder à votre compte bancaire.")
					if IsControlJustPressed(1, 38) then
                        ATM()
                        Menu.hidden = not Menu.hidden
				    end
                  Menu.renderGUI(options)
                end
            end
		end
	end
end)