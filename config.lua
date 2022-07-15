Config = {} -- Não mexa

--[[
    BY: Toddy#3191 - https://discord.gg/XCD4GXnWAV
    BY: Toddy#3191 - https://discord.gg/XCD4GXnWAV
    BY: Toddy#3191 - https://discord.gg/XCD4GXnWAV
    BY: Toddy#3191 - https://discord.gg/XCD4GXnWAV
    BY: Toddy#3191 - https://discord.gg/XCD4GXnWAV
    BY: Toddy#3191 - https://discord.gg/XCD4GXnWAV
    BY: Toddy#3191 - https://discord.gg/XCD4GXnWAV
    BY: Toddy#3191 - https://discord.gg/XCD4GXnWAV
    BY: Toddy#3191 - https://discord.gg/XCD4GXnWAV
    BY: Toddy#3191 - https://discord.gg/XCD4GXnWAV
    BY: Toddy#3191 - https://discord.gg/XCD4GXnWAV
]]

-- [ ITENS ] --

Config.itensList = { 									-- Itens randômicos que irá ganhar colhendo;
	[1] = "dollars2"
}

-- [ TEXTS ] --

Config.IniciarEmprego   = 		"~p~[E]~w~   INICIAR" 	-- Texto que aparece no BLIP para iniciar emprego
Config.FinalizarEmprego = 		"~p~[E]~w~   FINALIZAR" -- Texto que aparece no BLIP para finalizar emprego
Config.Coletar			=		"~p~[E]~w~   HACKEAR"	-- Texto que aparece no BLIP para finalizar emprego
Config.JobName			=		"hacker" 				-- Texto que aparece na notify

-- [ REQUESTS ] --

Config.RandQuant 		= 		math.random(1,5) 		-- Quantidade que será dada ao jogador
Config.HasStress 		= 		true 					-- Caso sua base tenha sistema de stresse e queira usa-lo
Config.HackTime 		=		10000					-- Tempo para coletar
Config.Creative 		=		true					-- Caso você use a base Creative (SummerZ)
Config.MaxDistance		= 		2						-- Distância para pode pegar o BLIP para iniciar o emprego
Config.ShowBlip			= 		150						-- Distância máxima para mostrar o BLIP de coleta
Config.HackDis			= 		50

-- [ POSITIONS ] --

Config.StartX	 		=		1275.35					-- Posição X para o BLIP
Config.StartY			=		-1710.75				-- Posição Y para o BLIP
Config.StartZ	 		=		54.78					-- Posição Z para o BLIP

Config.Locates = {
	{ 149.35,-1042.05,29.37 },
	{ 247.71,228.45,106.29  },
	{ 118.83,-231.84,54.58  },
	{ -80.8,-827.83,40.58	},
	{ 11.06,-1107.88,29.8 }
}





return Config -- Não mexa