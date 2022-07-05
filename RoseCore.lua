--[[

"You can call me anything that you want
Don’t ever, ever call me a self-made man
It gives the wrong impression, that we can do it alone
None of us can, the whole concept of the self made man or woman is a myth
To accept that credit, that mantle, would discount every single person who has helped me get here"
- Arnold Schwarzenegger

This project was originally created by Qwert, I took it over and has been constantly changing it and evolving it ever
since. I have been working day and night to build something that everyone could use, and have it work as good or if not
better than the other paid ones. It all started when Rikudou would tell me to just reuse QwertCore if I wanted a good
healing system, so after a year of hoping something better would release, I started working on this. I started knowing
nothing about coding and after just a few months, started learning more and more about Lua. I still have much to learn,
but I would like to thank a lot of people for making this possible.

nil-go
Kali
Madao
mushroom
Dating Simulator
Rhakin
and countless others

But most of all, Rikudou and his gang. Its people that tell me that I can't do something that motivates me. It gave me a
hunger, a passion, something that will never be satisfied until it is better than the rest. And I hope that if you're
reading this, you get inspired to do whatever it is that you want to do. I want to thank each and every one of you for
your help in making this the best healing system out there, and for making me happy doing what I love. Thank you.

https://discord.gg/BM9MBERbA9

]]

RoseCore = {}

RoseCore.version = "0.05.15"

RoseCore.GUI = {
    open = true,
    visible = true,
}

RoseCore.Data = {}

RoseCore.Tabs = {
	["General"] = true,
	["Ast"] = false,
	["Sch"] = false,
	["Whm"] = false,
	["Sge"] = false,
}

local RoseCoreLinks = {
	discord = [[https://discord.gg/BM9MBERbA9]],
	trello = [[https://trello.com/b/jiAMiYGM/project-remedy]],
	kofi = [[https://ko-fi.com/rosecore1000]],
}

RoseCore.WindowStyle = {
	["Text"] = { [1] = 255, [2] = 255, [3] = 255, [4] = 0.8 },
	["TextDisabled"] = { [1] = 255, [2] = 255, [3] = 255, [4] = 0.8 },
	["WindowBg"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 1 },
	["ChildWindowBg"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["Border"] = { [1] = 255, [2] = 255, [3] = 255, [4] = 0.8 },
	["BorderShadow"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["FrameBg"] = { [1] = 100, [2] = 100, [3] = 100, [4] = 0.8 },
	["FrameBgHovered"] = { [1] = 100, [2] = 100, [3] = 100, [4] = 0.8 },
	["FrameBgActive"] = { [1] = 100, [2] = 100, [3] = 100, [4] = 0.8 },
	["TitleBg"] = { [1] = 135, [2] = 117, [3] = 0, [4] = 1 },
	["TitleBgCollapsed"] = { [1] = 135, [2] = 117, [3] = 0, [4] = 1 },
	["TitleBgActive"] = { [1] = 135, [2] = 117, [3] = 0, [4] = 1 },
	["MenuBarBg"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["ScrollbarBg"] = { [1] = 100, [2] = 100, [3] = 100, [4] = 0.8 },
	["ScrollbarGrab"] = { [1] = 255, [2] = 255, [3] = 255, [4] = 0.8 },
	["ScrollbarGrabHovered"] = { [1] = 255, [2] = 255, [3] = 255, [4] = 0.8 },
	["ScrollbarGrabActive"] = { [1] = 255, [2] = 255, [3] = 255, [4] = 1 },
	["ComboBg"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["CheckMark"] = { [1] = 255, [2] = 255, [3] = 255, [4] = 0.8 },
	["SliderGrab"] = { [1] = 255, [2] = 255, [3] = 255, [4] = 0.8 },
	["SliderGrabActive"] = { [1] = 255, [2] = 255, [3] = 255, [4] = 1 },
	["Button"] =  { [1] = 135, [2] = 117, [3] = 0, [4] = 1 },
	["ButtonHovered"] = { [1] = 135, [2] = 117, [3] = 0, [4] = 1 },
	["ButtonActive"] = { [1] = 135, [2] = 117, [3] = 0, [4] = 1 },
	["Header"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["HeaderHovered"] = { [1] = 100, [2] = 100, [3] = 100, [4] = 0.8 },
	["HeaderActive"] = { [1] = 100, [2] = 100, [3] = 100, [4] = 0.8 },
	["Column"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["ColumnHovered"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["ColumnActive"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["ResizeGrip"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["ResizeGripHovered"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["ResizeGripActive"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["CloseButton"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["CloseButtonHovered"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["CloseButtonActive"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["PlotLines"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["PlotLinesHovered"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["PlotHistogram"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["PlotHistogramHovered"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["TextSelectedBg"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["TooltipBg"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0.8 },
	["ModalWindowDarkening"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["NavHighlight"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["NavWindowingHighlight"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
	["DragDropTarget"] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
}

local LuaPath = GetLuaModsPath()
local ModulePath = LuaPath .. [[RoseCore\]]
local ModuleSettings = ModulePath .. [[Settings.lua]]
local ImageFolder = ModulePath .. [[Images\]]
local ImageSize = 55
local ImageSpacing = 2

RoseCore.Settings = {

	--Reactions
	ReactionVerLocal = "0.0.0",

	--Active
	Active = true,

	--[AST] Savages
	AstSavHotbarButColOn = {
		R = 135/255,
		G = 117/255,
		B = 0/255,
		T = 255/255,
	},
	AstSavHotbarButColOff = {
		R = 50/255,
		G = 50/255,
		B = 50/255,
		T = 255/255,
	},
	AstSavHotbarBgT = 255,
	AstSavHotbarButtonSizeX = 103,
	AstSavHotbarButtonSizeY = 30,
	AstSavHotbarColumns = 1,
	AstSavHotbarLocked = false,
	AstSavHotbarEnabled = true,	
	
	AstSavTankOverheal = 5,
	AstSavPartyOverhealAoe = 5,
	AstSavPartyOverhealSingle = 5,
	
	-- Fight Specific

	AstSavHotbar = {
		Heal = {
			index = 1,
			name = "Heal",
			visible = true,
			bool = true,
			menu = "Heal",
			tooltip = "Enable/Disable Heals",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[heal_on.png]],
			imageoff = ImageFolder..[[heal_off.png]],
		},
		UsePrepull = {
			index = 2,
			name = "Prepull",
			visible = false,
			bool = true,
			menu = "Prepull",
			tooltip = "Enable/Disable prepull abilities",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[prepull_on.png]],
			imageoff = ImageFolder..[[prepull_off.png]],
		},
		Sprint = {
			index = 3,
			name = "Sprint",
			visible = false,
			bool = true,
			menu = "Sprint",
			tooltip = "Enable/Disable Sprint",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[sprint_on.png]],
			imageoff = ImageFolder..[[sprint_off.png]],
		},
		TankHeal = {
			index = 4,
			name = "Heal (T)",
			visible = false,
			bool = true,
			menu = "Heal Tank",
			tooltip = "Enable/Disable Heals for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_heal_on.png]],
			imageoff = ImageFolder..[[tank_heal_off.png]],
		},
		TankGcd = {
			index = 5,
			name = "GCD (T)",
			visible = false,
			bool = true,
			menu = "GCD Tank",
			tooltip = "Enable/Disable GCD abilities for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_gcd_on.png]],
			imageoff = ImageFolder..[[tank_gcd_off.png]],
		},
		TankCi = {
			index = 6,
			name = "CI (T)",
			visible = false,
			bool = true,
			menu = "C. Intersection",
			tooltip = "Enable/Disable Celestial Intersection for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[celestial_intersection_on.png]],
			imageoff = ImageFolder..[[celestial_intersection_off.png]],
		},
		TankEd = {
			index = 7,
			name = "ED (T)",
			visible = false,
			bool = true,
			menu = "E. Dignity",
			tooltip = "Enable/Disable Essential Dignity for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[essential_dignity_on.png]],
			imageoff = ImageFolder..[[essential_dignity_off.png]],
		},
		TankAb = {
			index = 8,
			name = "AB (T)",
			visible = false,
			bool = true,
			menu = "Asp. Benefic",
			tooltip = "Enable/Disable Aspected Benefic for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[aspected_benefic_on.png]],
			imageoff = ImageFolder..[[aspected_benefic_off.png]],
		},
		TankBII = {
			index = 9,
			name = "BII (T)",
			visible = false,
			bool = true,
			menu = "Benefic II",
			tooltip = "Enable/Disable Benefic II for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[benefic_ii_on.png]],
			imageoff = ImageFolder..[[benefic_ii_off.png]],
		},
		TankB = {
			index = 10,
			name = "B (T)",
			visible = false,
			bool = true,
			menu = "Benefic",
			tooltip = "Enable/Disable Benefic for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[benefic_on.png]],
			imageoff = ImageFolder..[[benefic_off.png]],
		},
		PartyHeal = {
			index = 11,
			name = "Heals (P)",
			visible = false,
			bool = true,
			menu = "Heal Party",
			tooltip = "Enable/Disable Heals for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_heal_on.png]],
			imageoff = ImageFolder..[[party_heal_off.png]],
		},
		PartyGcd = {
			index = 12,
			name = "GCD (P)",
			visible = false,
			bool = true,
			menu = "GCD Party",
			tooltip = "Enable/Disable GCD abilities for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_gcd_on.png]],
			imageoff = ImageFolder..[[party_gcd_off.png]],
		},		
		PartyHo = {
			index = 13,
			name = "Horoscope (P)",
			visible = false,
			bool = true,
			menu = "Horoscope",
			tooltip = "Enable/Disable Horoscope",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[horoscope_on.png]],
			imageoff = ImageFolder..[[horoscope_off.png]],
		},
		PartyCu = {
			index = 14,
			name = "CU (P)",
			visible = false,
			bool = true,
			menu = "C. Unconscious",
			tooltip = "Enable/Disable Collective Unconscious",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[collective_unconscious_on.png]],
			imageoff = ImageFolder..[[collective_unconscious_off.png]],
		},
		PartyCo = {
			index = 15,
			name = "CO (P)",
			visible = false,
			bool = true,
			menu = "C. Opposition",
			tooltip = "Enable/Disable Celestial Opposition",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[celestial_opposition_on.png]],
			imageoff = ImageFolder..[[celestial_opposition_off.png]],
		},
		PartyAh = {
			index = 16,
			name = "AH (P)",
			visible = false,
			bool = true,
			menu = "Asp. Helios",
			tooltip = "Enable/Disable Aspected Helios",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[aspected_helios_on.png]],
			imageoff = ImageFolder..[[aspected_helios_off.png]],
		},
		PartyH = {
			index = 17,
			name = "Helios (P)",
			visible = false,
			bool = true,
			menu = "Helios",
			tooltip = "Enable/Disable Helios",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[helios_on.png]],
			imageoff = ImageFolder..[[helios_off.png]],
		},
		PartyEd = {
			index = 18,
			name = "ED (P)",
			visible = false,
			bool = true,
			menu = "E. Dignity",
			tooltip = "Enable/Disable Essential Dignity for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[essential_dignity_on.png]],
			imageoff = ImageFolder..[[essential_dignity_off.png]],
		},
		PartyAb = {
			index = 19,
			name = "AB (P)",
			visible = false,
			bool = true,
			menu = "Asp. Benefic",
			tooltip = "Enable/Disable Aspected Benefic for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[aspected_benefic_on.png]],
			imageoff = ImageFolder..[[aspected_benefic_off.png]],
		},
		PartyBII = {
			index = 20,
			name = "BII (P)",
			visible = false,
			bool = true,
			menu = "Benefic II",
			tooltip = "Enable/Disable Benefic II for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[benefic_ii_on.png]],
			imageoff = ImageFolder..[[benefic_ii_off.png]],
		},
		PartyB = {
			index = 21,
			name = "B (P)",
			visible = false,
			bool = true,
			menu = "Benefic",
			tooltip = "Enable/Disable Benefic for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[benefic_on.png]],
			imageoff = ImageFolder..[[benefic_off.png]],
		},
		PartyStar = {
			index = 22,
			name = "Earthly Star",
			visible = false,
			bool = true,
			menu = "Earthly Star",
			tooltip = "Enable/Disable Earthly Star",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[earthly_star_on.png]],
			imageoff = ImageFolder..[[earthly_star_off.png]],
		},
		PartyNeutral = {
			index = 23,
			name = "Neutral Sect",
			visible = false,
			bool = true,
			menu = "Neutral Sect",
			tooltip = "Enable/Disable Neutral Sect",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[neutral_sect_on.png]],
			imageoff = ImageFolder..[[neutral_sect_off.png]],
		},
		Lightspeed = {
			index = 24,
			name = "Lightspeed",
			visible = false,
			bool = true,
			menu = "Lightspeed",
			tooltip = "Enable/Disable Lightspeed",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[lightspeed_on.png]],
			imageoff = ImageFolder..[[lightspeed_off.png]],
		},
		Macrocosmos = {
			index = 25,
			name = "Macrocosmos",
			visible = false,
			bool = true,
			menu = "Macrocosmos",
			tooltip = "Enable/Disable Macrocosmos",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[macrocosmos_on.png]],
			imageoff = ImageFolder..[[macrocosmos_off.png]],
		},
		Exaltation = {
			index = 26,
			name = "Exaltation",
			visible = false,
			bool = true,
			menu = "Exaltation",
			tooltip = "Enable/Disable Exaltation",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[exaltation_on.png]],
			imageoff = ImageFolder..[[exaltation_off.png]],
		},
		Synastry = {
			index = 27,
			name = "Synastry",
			visible = false,
			bool = true,
			menu = "Synastry",
			tooltip = "Enable/Disable Synastry",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[synastry_on.png]],
			imageoff = ImageFolder..[[synastry_off.png]],
		},
	},
	
	--[AST] Everywhere
	AstEvHotbarButColOn = {
		R = 135/255,
		G = 117/255,
		B = 0/255,
		T = 255/255,
	},
	AstEvHotbarButColOff = {
		R = 50/255,
		G = 50/255,
		B = 50/255,
		T = 255/255,
	},
	AstEvHotbarBgT = 255,
	AstEvHotbarButtonSizeX = 103,
	AstEvHotbarButtonSizeY = 30,
	AstEvHotbarColumns = 1,
	AstEvHotbarLocked = false,
	AstEvHotbarEnabled = true,	

	AstEvTankOverhealSingle = 90,
	AstEvPartyOverhealAOE = 75,
	AstEvPartyOverhealSingle = 75,

	AstSavTankOverhealSingle = 100,
	AstSavPartyOverhealAOE = 100,
	AstSavPartyOverhealSingle = 100,

	AstEvHotbar = {
		Heal = {
			index = 1,
			name = "Heal",
			visible = true,
			bool = true,
			menu = "Heal",
			tooltip = "Enable/Disable Heals",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[heal_on.png]],
			imageoff = ImageFolder..[[heal_off.png]],
		},
		UsePrepull = {
			index = 2,
			name = "Prepull",
			visible = false,
			bool = true,
			menu = "Prepull",
			tooltip = "Enable/Disable abilities before a pull (min Lvl 80)",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[prepull_on.png]],
			imageoff = ImageFolder..[[prepull_off.png]],
		},
		Sprint = {
			index = 3,
			name = "Sprint",
			visible = false,
			bool = true,
			menu = "Sprint",
			tooltip = "Enable/Disable Sprint",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[sprint_on.png]],
			imageoff = ImageFolder..[[sprint_off.png]],
		},
		TankHeal = {
			index = 4,
			name = "Heal (T)",
			visible = false,
			bool = true,
			menu = "Heal Tank",
			tooltip = "Enable/Disable Heals for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_heal_on.png]],
			imageoff = ImageFolder..[[tank_heal_off.png]],
		},
		TankGcd = {
			index = 5,
			name = "GCD (T)",
			visible = false,
			bool = true,
			menu = "GCD",
			tooltip = "Enable/Disable GCD abilities for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_gcd_on.png]],
			imageoff = ImageFolder..[[tank_gcd_off.png]],
		},
		TankCi = {
			index = 6,
			name = "CI (T)",
			visible = false,
			bool = true,
			menu = "C. Intersection",
			tooltip = "Enable/Disable Celestial Intersection for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[celestial_intersection_on.png]],
			imageoff = ImageFolder..[[celestial_intersection_off.png]],
		},
		TankEd = {
			index = 7,
			name = "ED (T)",
			visible = false,
			bool = true,
			menu = "E. Dignity",
			tooltip = "Enable/Disable Essential Dignity for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[essential_dignity_on.png]],
			imageoff = ImageFolder..[[essential_dignity_off.png]],
		},
		TankAb = {
			index = 8,
			name = "AB (T)",
			visible = false,
			bool = true,
			menu = "Asp. Benefic",
			tooltip = "Enable/Disable Aspected Benefic for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[aspected_benefic_on.png]],
			imageoff = ImageFolder..[[aspected_benefic_off.png]],
		},
		TankBII = {
			index = 9,
			name = "BII (T)",
			visible = false,
			bool = true,
			menu = "Benefic II",
			tooltip = "Enable/Disable Benefic II for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[benefic_ii_on.png]],
			imageoff = ImageFolder..[[benefic_ii_off.png]],
		},
		TankB = {
			index = 10,
			name = "B (T)",
			visible = false,
			bool = true,
			menu = "Benefic",
			tooltip = "Enable/Disable Benefic for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[benefic_on.png]],
			imageoff = ImageFolder..[[benefic_off.png]],
		},
		PartyHeal = {
			index = 11,
			name = "Heals (P)",
			visible = false,
			bool = true,
			menu = "Heal Party",
			tooltip = "Enable/Disable Heals for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_heal_on.png]],
			imageoff = ImageFolder..[[party_heal_off.png]],
		},
		PartyGcd = {
			index = 12,
			name = "GCD (P)",
			visible = false,
			bool = true,
			menu = "GCD",
			tooltip = "Enable/Disable GCD abilities for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_gcd_on.png]],
			imageoff = ImageFolder..[[party_gcd_off.png]],
		},
		PartyHo = {
			index = 13,
			name = "Horoscope (P)",
			visible = false,
			bool = true,
			menu = "Horoscope",
			tooltip = "Enable/Disable Horoscope",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[horoscope_on.png]],
			imageoff = ImageFolder..[[horoscope_off.png]],
		},
		PartyCu = {
			index = 14,
			name = "Cu (P)",
			visible = false,
			bool = true,
			menu = "C. Unconscious",
			tooltip = "Enable/Disable Collective Unconscious",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[collective_unconscious_on.png]],
			imageoff = ImageFolder..[[collective_unconscious_off.png]],
		},
		PartyCo = {
			index = 15,
			name = "CO (P)",
			visible = false,
			bool = true,
			menu = "C. Opposition",
			tooltip = "Enable/Disable Celestial Opposition",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[celestial_opposition_on.png]],
			imageoff = ImageFolder..[[celestial_opposition_off.png]],
		},
		PartyAh = {
			index = 16,
			name = "AH (P)",
			visible = false,
			bool = true,
			menu = "Asp. Helios",
			tooltip = "Enable/Disable Aspected Helios",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[aspected_helios_on.png]],
			imageoff = ImageFolder..[[aspected_helios_off.png]],
		},
		PartyH = {
			index = 17,
			name = "Helios (P)",
			visible = false,
			bool = true,
			menu = "Helios",
			tooltip = "Enable/Disable Helios",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[helios_on.png]],
			imageoff = ImageFolder..[[helios_off.png]],
		},
		PartyEd = {
			index = 18,
			name = "ED (P)",
			visible = false,
			bool = true,
			menu = "E. Dignity",
			tooltip = "Enable/Disable Essential Dignity for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[essential_dignity_on.png]],
			imageoff = ImageFolder..[[essential_dignity_off.png]],
		},
		PartyAb = {
			index = 19,
			name = "AB (P)",
			visible = false,
			bool = true,
			menu = "Asp. Benefic",
			tooltip = "Enable/Disable Aspected Benefic for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[aspected_benefic_on.png]],
			imageoff = ImageFolder..[[aspected_benefic_off.png]],
		},
		PartyBII = {
			index = 20,
			name = "BII (P)",
			visible = false,
			bool = true,
			menu = "Benefic II",
			tooltip = "Enable/Disable Benefic II for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[benefic_ii_on.png]],
			imageoff = ImageFolder..[[benefic_ii_off.png]],
		},
		PartyB = {
			index = 21,
			name = "B (P)",
			visible = false,
			bool = true,
			menu = "Benefic",
			tooltip = "Enable/Disable Benefic for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[benefic_on.png]],
			imageoff = ImageFolder..[[benefic_off.png]],
		},
		Star = {
			index = 22,
			name = "Earthly Star",
			visible = false,
			bool = true,
			menu = "Earthly Star",
			tooltip = "Enable/Disable Earthly Star",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[earthly_star_on.png]],
			imageoff = ImageFolder..[[earthly_star_off.png]],
		},
		Neutral = {
			index = 23,
			name = "Neutral Sect",
			visible = false,
			bool = true,
			menu = "Neutral Sect",
			tooltip = "Enable/Disable Neutral Sect",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[neutral_sect_on.png]],
			imageoff = ImageFolder..[[neutral_sect_off.png]],
		},
		Esuna = {
			index = 24,
			name = "Esuna",
			visible = false,
			bool = true,
			menu = "Esuna",
			tooltip = "Enable/Disable Esuna",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[esuna_on.png]],
			imageoff = ImageFolder..[[esuna_off.png]],
		},
		Lightspeed = {
			index = 25,
			name = "Lightspeed",
			visible = false,
			bool = true,
			menu = "Lightspeed",
			tooltip = "Enable/Disable Lightspeed",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[lightspeed_on.png]],
			imageoff = ImageFolder..[[lightspeed_off.png]],
		},
		Macrocosmos = {
			index = 26,
			name = "Macrocosmos",
			visible = false,
			bool = true,
			menu = "Macrocosmos",
			tooltip = "Enable/Disable Macrocosmos",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[macrocosmos_on.png]],
			imageoff = ImageFolder..[[macrocosmos_off.png]],
		},
		Exaltation = {
			index = 27,
			name = "Exaltation",
			visible = false,
			bool = true,
			menu = "Exaltation",
			tooltip = "Enable/Disable Exaltation",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[exaltation_on.png]],
			imageoff = ImageFolder..[[exaltation_off.png]],
		},
		Synastry = {
			index = 27,
			name = "Synastry",
			visible = false,
			bool = true,
			menu = "Synastry",
			tooltip = "Enable/Disable Synastry",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[synastry_on.png]],
			imageoff = ImageFolder..[[synastry_off.png]],
		},
	},
	
	--[Sch] Savage
	SchSavHotbarButColOn = {
		R = 135/255,
		G = 117/255,
		B = 0/255,
		T = 255/255,
	},
	SchSavHotbarButColOff = {
		R = 50/255,
		G = 50/255,
		B = 50/255,
		T = 255/255,
	},
	SchSavHotbarBgT = 255,
	SchSavHotbarButtonSizeX = 103,
	SchSavHotbarButtonSizeY = 30,
	SchSavHotbarColumns = 1,
	SchSavHotbarLocked = false,
	SchSavHotbarEnabled = true,

	SchSavTankOverhealSingle = 100,
	SchSavPartyOverhealAOE = 100,
	SchSavPartyOverhealSingle = 100,
	
	-- Fight Specific

	SchSavHotbar = {
		Heal = {
			index = 1,
			name = "Heal",
			visible = true,
			bool = true,
			menu = "Heal",
			tooltip = "Enable/Disable Heals",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[heal_on.png]],
			imageoff = ImageFolder..[[heal_off.png]],
		},
		UsePrepull = {
			index = 2,
			name = "Prepull",
			visible = false,
			bool = true,
			menu = "Prepull",
			tooltip = "Enable/Disable prepull abilities",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[prepull_on.png]],
			imageoff = ImageFolder..[[prepull_off.png]],
		},
		Sprint = {
			index = 3,
			name = "Sprint",
			visible = false,
			bool = true,
			menu = "Sprint",
			tooltip = "Enable/Disable Sprint",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[sprint_on.png]],
			imageoff = ImageFolder..[[sprint_off.png]],
		},
		TankHeal = {
			index = 4,
			name = "Heal (T)",
			visible = false,
			bool = true,
			menu = "Heal Tank",
			tooltip = "Enable/Disable Heals for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_heal_on.png]],
			imageoff = ImageFolder..[[tank_heal_off.png]],
		},
		TankGcd = {
			index = 5,
			name = "GCD (T)",
			visible = false,
			bool = true,
			menu = "GCD",
			tooltip = "Enable/Disable GCD abilities for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_gcd_on.png]],
			imageoff = ImageFolder..[[tank_gcd_off.png]],
		},
		TankExco = {
			index = 6,
			name = "Exco (T)",
			visible = false,
			bool = true,
			menu = "Excogitation",
			tooltip = "Enable/Disable Excogitation for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[excogitation_on.png]],
			imageoff = ImageFolder..[[excogitation_off.png]],
		},
		TankAp = {
			index = 7,
			name = "Aetherpact (T)",
			visible = false,
			bool = true,
			menu = "Aetherpact",
			tooltip = "Enable/Disable Aetherpact for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[aetherpact_on.png]],
			imageoff = ImageFolder..[[aetherpact_off.png]],
		},
		TankLustrate = {
			index = 8,
			name = "Lustrate (T)",
			visible = false,
			bool = true,
			menu = "Lustrate",
			tooltip = "Enable/Disable Lustrate for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[lustrate_on.png]],
			imageoff = ImageFolder..[[lustrate_off.png]],
		},
		TankEt = {
			index = 9,
			name = "ET (T)",
			visible = false,
			bool = true,
			menu = "E. Tactics",
			tooltip = "Enable/Disable Emergency Tactics for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[emergency_tactics_on.png]],
			imageoff = ImageFolder..[[emergency_tactics_off.png]],
		},
		TankAdlo = {
			index = 10,
			name = "Adlo (T)",
			visible = false,
			bool = true,
			menu = "Adloquium",
			tooltip = "Enable/Disable Adloquium for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[adloquium_on.png]],
			imageoff = ImageFolder..[[adloquium_off.png]],
		},
		TankPhysick = {
			index = 11,
			name = "Physick (T)",
			visible = false,
			bool = true,
			menu = "Physick",
			tooltip = "Enable/Disable Physick for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[physick_on.png]],
			imageoff = ImageFolder..[[physick_off.png]],
		},
		TankProtraction = {
			index = 12,
			name = "Protraction (T)",
			visible = false,
			bool = true,
			menu = "Protraction",
			tooltip = "Enable/Disable Protraction for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[protraction_on.png]],
			imageoff = ImageFolder..[[protraction_off.png]],
		},
		PartyHeal = {
			index = 13,
			name = "Heal (P)",
			visible = false,
			bool = true,
			menu = "Heal Party",
			tooltip = "Enable/Disable Heals for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_heal_on.png]],
			imageoff = ImageFolder..[[party_heal_off.png]],
		},
		PartyGcd = {
			index = 14,
			name = "GCD (P)",
			visible = false,
			bool = true,
			menu = "GCD",
			tooltip = "Enable/Disable GCD abilities for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_gcd_on.png]],
			imageoff = ImageFolder..[[party_gcd_off.png]],
		},
		PartyConsolation = {
			index = 15,
			name = "Consolation (P)",
			visible = false,
			bool = true,
			menu = "Consolation",
			tooltip = "Enable/Disable Consolation for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[consolation_on.png]],
			imageoff = ImageFolder..[[consolation_off.png]],
		},
		PartyIndom = {
			index = 16,
			name = "Indom (P)",
			visible = false,
			bool = true,
			menu = "Indom",
			tooltip = "Enable/Disable Indomitability for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[indomitability_on.png]],
			imageoff = ImageFolder..[[indomitability_off.png]],
		},
		PartyWhisp = {
			index = 17,
			name = "WD (P)",
			visible = false,
			bool = true,
			menu = "Whisp. Dawn",
			tooltip = "Enable/Disable Whispering Dawn for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[whispering_dawn_on.png]],
			imageoff = ImageFolder..[[whispering_dawn_off.png]],
		},
		PartyFeyB = {
			index = 18,
			name = "FB (P)",
			visible = false,
			bool = true,
			menu = "Fey Blessing",
			tooltip = "Enable/Disable Fey Blessing for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[fey_blessing_on.png]],
			imageoff = ImageFolder..[[fey_blessing_off.png]],
		},
		PartySuccor = {
			index = 19,
			name = "Succor (P)",
			visible = false,
			bool = true,
			menu = "Succor",
			tooltip = "Enable/Disable Succor for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[succor_on.png]],
			imageoff = ImageFolder..[[succor_off.png]],
		},
		PartyAp = {
			index = 20,
			name = "Ap (P)",
			visible = false,
			bool = true,
			menu = "Aetherpact",
			tooltip = "Enable/Disable Aetherpact for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[aetherpact_on.png]],
			imageoff = ImageFolder..[[aetherpact_off.png]],
		},
		PartyLustrate = {
			index = 21,
			name = "Lustrate (P)",
			visible = false,
			bool = true,
			menu = "Lustrate",
			tooltip = "Enable/Disable Lustrate for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[lustrate_on.png]],
			imageoff = ImageFolder..[[lustrate_off.png]],
		},
		PartyAdlo = {
			index = 22,
			name = "Adlo (P)",
			visible = false,
			bool = true,
			menu = "Adloquium",
			tooltip = "Enable/Disable Adloquium for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[adloquium_on.png]],
			imageoff = ImageFolder..[[adloquium_off.png]],
		},
		PartyPhysick = {
			index = 23,
			name = "Physick (P)",
			visible = false,
			bool = true,
			menu = "Physick",
			tooltip = "Enable/Disable Physick for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[physick_on.png]],
			imageoff = ImageFolder..[[physick_off.png]],
		},
		Seraph = {
			index = 24,
			name = "Seraph",
			visible = false,
			bool = true,
			menu = "Summon Seraph",
			tooltip = "Enable/Disable Seraph",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[seraph_on.png]],
			imageoff = ImageFolder..[[seraph_off.png]],
		},
		Soil = {
			index = 25,
			name = "Sacred Soil",
			visible = false,
			bool = true,
			menu = "Sacred Soil",
			tooltip = "Enable/Disable Sacred Soil",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[sacred_soil_on.png]],
			imageoff = ImageFolder..[[sacred_soil_off.png]],
		},
		FeyIllu = {
			index = 26,
			name = "Illumination",
			visible = false,
			bool = true,
			menu = "Illumination",
			tooltip = "Enable/Disable Fey Illumination",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[fey_illumination_on.png]],
			imageoff = ImageFolder..[[fey_illumination_off.png]],
		},
		DeploymentTact = {
			index = 27,
			name = "D. Tactics",
			visible = false,
			bool = true,
			menu = "D. Tactics",
			tooltip = "Enable/Disable Deployment Tactics",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[deployment_tactics_on.png]],
			imageoff = ImageFolder..[[deployment_tactics_off.png]],
		},
		Expedient = {
			index = 28,
			name = "Expedient",
			visible = false,
			bool = true,
			menu = "Expedient",
			tooltip = "Enable/Disable Expedient",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[expedient_on.png]],
			imageoff = ImageFolder..[[expedient_off.png]],
		},
	},
	
	--[Sch] Everywhere
	SchEvHotbarButColOn = {
		R = 135/255,
		G = 117/255,
		B = 0/255,
		T = 255/255,
	},
	SchEvHotbarButColOff = {
		R = 50/255,
		G = 50/255,
		B = 50/255,
		T = 255/255,
	},
	SchEvHotbarBgT = 255,
	SchEvHotbarButtonSizeX = 103,
	SchEvHotbarButtonSizeY = 30,
	SchEvHotbarColumns = 1,
	SchEvHotbarLocked = false,
	SchEvHotbarEnabled = true,

	SchEvTankOverhealSingle = 90,
	SchEvPartyOverhealAOE = 75,
	SchEvPartyOverhealSingle = 75,

	SchEvHotbar = {
		Heal = {
			index = 1,
			name = "Heal",
			visible = true,
			bool = true,
			menu = "Heal",
			tooltip = "Enable/Disable Heals",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[heal_on.png]],
			imageoff = ImageFolder..[[heal_off.png]],
		},
		UsePrepull = {
			index = 2,
			name = "Prepull",
			visible = false,
			bool = true,
			menu = "Prepull",
			tooltip = "Enable/Disable abilities before a pull (min Lvl 80)",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[prepull_on.png]],
			imageoff = ImageFolder..[[prepull_off.png]],
		},
		Sprint = {
			index = 3,
			name = "Sprint",
			visible = false,
			bool = true,
			menu = "Sprint",
			tooltip = "Enable/Disable Sprint",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[sprint_on.png]],
			imageoff = ImageFolder..[[sprint_off.png]],
		},
		TankHeal = {
			index = 4,
			name = "Heal (T)",
			visible = false,
			bool = true,
			menu = "Heal Tank",
			tooltip = "Enable/Disable Heals for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_heal_on.png]],
			imageoff = ImageFolder..[[tank_heal_off.png]],
		},
		TankGcd = {
			index = 5,
			name = "GCD (T)",
			visible = false,
			bool = true,
			menu = "GCD",
			tooltip = "Enable/Disable GCD abilities for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_gcd_on.png]],
			imageoff = ImageFolder..[[tank_gcd_off.png]],
		},
		TankExco = {
			index = 6,
			name = "Exco (T)",
			visible = false,
			bool = true,
			menu = "Excogitation",
			tooltip = "Enable/Disable Excogitation for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[excogitation_on.png]],
			imageoff = ImageFolder..[[excogitation_off.png]],
		},
		TankAp = {
			index = 7,
			name = "Aetherpact (T)",
			visible = false,
			bool = true,
			menu = "Aetherpact",
			tooltip = "Enable/Disable Aetherpact for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[aetherpact_on.png]],
			imageoff = ImageFolder..[[aetherpact_off.png]],
		},
		TankLustrate = {
			index = 8,
			name = "Lustrate (T)",
			visible = false,
			bool = true,
			menu = "Lustrate",
			tooltip = "Enable/Disable Lustrate for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[lustrate_on.png]],
			imageoff = ImageFolder..[[lustrate_off.png]],
		},
		TankEt = {
			index = 9,
			name = "ET (T)",
			visible = false,
			bool = true,
			menu = "E. Tactics",
			tooltip = "Enable/Disable Emergency Tactics for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[emergency_tactics_on.png]],
			imageoff = ImageFolder..[[emergency_tactics_off.png]],
		},
		TankAdlo = {
			index = 10,
			name = "Adlo (T)",
			visible = false,
			bool = true,
			menu = "Adloquium",
			tooltip = "Enable/Disable Adloquium for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[adloquium_on.png]],
			imageoff = ImageFolder..[[adloquium_off.png]],
		},
		TankPhysick = {
			index = 11,
			name = "Physick (T)",
			visible = false,
			bool = true,
			menu = "Physick",
			tooltip = "Enable/Disable Physick for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[physick_on.png]],
			imageoff = ImageFolder..[[physick_off.png]],
		},
		TankProtraction = {
			index = 12,
			name = "Protraction (T)",
			visible = false,
			bool = true,
			menu = "Protraction",
			tooltip = "Enable/Disable Protraction for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[protraction_on.png]],
			imageoff = ImageFolder..[[protraction_off.png]],
		},
		PartyHeal = {
			index = 13,
			name = "Heal (P)",
			visible = false,
			bool = true,
			menu = "Heal Party",
			tooltip = "Enable/Disable Heals for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_heal_on.png]],
			imageoff = ImageFolder..[[party_heal_off.png]],
		},
		PartyGcd = {
			index = 14,
			name = "GCD (P)",
			visible = false,
			bool = true,
			menu = "GCD",
			tooltip = "Enable/Disable GCD abilities for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_gcd_on.png]],
			imageoff = ImageFolder..[[party_gcd_off.png]],
		},
		PartyConsolation = {
			index = 15,
			name = "Consolation (P)",
			visible = false,
			bool = true,
			menu = "Consolation",
			tooltip = "Enable/Disable Consolation for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[consolation_on.png]],
			imageoff = ImageFolder..[[consolation_off.png]],
		},
		PartyIndom = {
			index = 16,
			name = "Indom (P)",
			visible = false,
			bool = true,
			menu = "Indom",
			tooltip = "Enable/Disable Indomitability for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[indomitability_on.png]],
			imageoff = ImageFolder..[[indomitability_off.png]],
		},
		PartyWhisp = {
			index = 17,
			name = "WD (P)",
			visible = false,
			bool = true,
			menu = "Whisp. Dawn",
			tooltip = "Enable/Disable Whispering Dawn for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[whispering_dawn_on.png]],
			imageoff = ImageFolder..[[whispering_dawn_off.png]],
		},
		PartyFeyB = {
			index = 18,
			name = "FB (P)",
			visible = false,
			bool = true,
			menu = "Fey Blessing",
			tooltip = "Enable/Disable Fey Blessing for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[fey_blessing_on.png]],
			imageoff = ImageFolder..[[fey_blessing_off.png]],
		},
		PartySuccor = {
			index = 19,
			name = "Succor (P)",
			visible = false,
			bool = true,
			menu = "Succor",
			tooltip = "Enable/Disable Succor for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[succor_on.png]],
			imageoff = ImageFolder..[[succor_off.png]],
		},
		PartyAp = {
			index = 20,
			name = "Ap (P)",
			visible = false,
			bool = true,
			menu = "Aetherpact",
			tooltip = "Enable/Disable Aetherpact for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[aetherpact_on.png]],
			imageoff = ImageFolder..[[aetherpact_off.png]],
		},
		PartyLustrate = {
			index = 21,
			name = "Lustrate (P)",
			visible = false,
			bool = true,
			menu = "Lustrate",
			tooltip = "Enable/Disable Lustrate for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[lustrate_on.png]],
			imageoff = ImageFolder..[[lustrate_off.png]],
		},
		PartyAdlo = {
			index = 22,
			name = "Adlo (P)",
			visible = false,
			bool = true,
			menu = "Adloquium",
			tooltip = "Enable/Disable Adloquium for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[adloquium_on.png]],
			imageoff = ImageFolder..[[adloquium_off.png]],
		},
		PartyPhysick = {
			index = 23,
			name = "Physick (P)",
			visible = false,
			bool = true,
			menu = "Physick",
			tooltip = "Enable/Disable Physick for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[physick_on.png]],
			imageoff = ImageFolder..[[physick_off.png]],
		},
		Seraph = {
			index = 24,
			name = "Seraph",
			visible = false,
			bool = true,
			menu = "Summon Seraph",
			tooltip = "Enable/Disable Seraph",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[seraph_on.png]],
			imageoff = ImageFolder..[[seraph_off.png]],
		},
		Soil = {
			index = 25,
			name = "Sacred Soil",
			visible = false,
			bool = true,
			menu = "Sacred Soil",
			tooltip = "Enable/Disable Sacred Soil",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[sacred_soil_on.png]],
			imageoff = ImageFolder..[[sacred_soil_off.png]],
		},
		Esuna = {
			index = 26,
			name = "Esuna",
			visible = false,
			bool = true,
			menu = "Esuna",
			tooltip = "Enable/Disable Esuna",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[esuna_on.png]],
			imageoff = ImageFolder..[[esuna_off.png]],
		},
		Expedient = {
			index = 27,
			name = "Expedient",
			visible = false,
			bool = true,
			menu = "Expedient",
			tooltip = "Enable/Disable Expedient",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[expedient_on.png]],
			imageoff = ImageFolder..[[expedient_off.png]],
		},
		FeyIllumination = {
			index = 28,
			name = "Illumination",
			visible = false,
			bool = true,
			menu = "Illumination",
			tooltip = "Enable/Disable Fey Illumination",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[fey_illumination_on.png]],
			imageoff = ImageFolder..[[fey_illumination_off.png]],
		},
		DeploymentTactics = {
			index = 29,
			name = "Deployment Tactics",
			visible = false,
			bool = true,
			menu = "D. Tactics",
			tooltip = "Enable/Disable Deployment Tactics",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[deployment_tactics_on.png]],
			imageoff = ImageFolder..[[deployment_tactics_off.png]],
		},
	},
	
	--[Whm] Savages
	WhmSavHotbarButColOn = {
		R = 135/255,
		G = 117/255,
		B = 0/255,
		T = 255/255,
	},
	WhmSavHotbarButColOff = {
		R = 50/255,
		G = 50/255,
		B = 50/255,
		T = 255/255,
	},
	WhmSavHotbarBgT = 255,
	WhmSavHotbarButtonSizeX = 103,
	WhmSavHotbarButtonSizeY = 30,
	WhmSavHotbarColumns = 1,
	WhmSavHotbarLocked = false,
	WhmSavHotbarEnabled = true,	

	WhmSavTankOverhealSingle = 100,
	WhmSavPartyOverhealAOE = 100,
	WhmSavPartyOverhealSingle = 100,
	
	-- Fight Specific

	WhmSavHotbar = {
		Heal = {
			index = 1,
			name = "Heal",
			visible = true,
			bool = true,
			menu = "Heal",
			tooltip = "Enable/Disable Heals",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[heal_on.png]],
			imageoff = ImageFolder..[[heal_off.png]],

		},
		UsePrepull = {
			index = 2,
			name = "Prepull",
			visible = false,
			bool = true,
			menu = "Prepull",
			tooltip = "Enable/Disable prepull abilities",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[prepull_on.png]],
			imageoff = ImageFolder..[[prepull_off.png]],
		},
		Sprint = {
			index = 3,
			name = "Sprint",
			visible = false,
			bool = true,
			menu = "Sprint",
			tooltip = "Enable/Disable Sprint",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[sprint_on.png]],
			imageoff = ImageFolder..[[sprint_off.png]],
		},
		TankHeal = {
			index = 4,
			name = "Heal (T)",
			visible = false,
			bool = true,
			menu = "Heal Tank",
			tooltip = "Enable/Disable Heals for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_heal_on.png]],
			imageoff = ImageFolder..[[tank_heal_off.png]],
		},
		TankLily = {
			index = 5,
			name = "Gcds (T)",
			visible = false,
			bool = true,
			menu = "Gcds",
			tooltip = "Enable/Disable GCD abilities (apart from Lily Heals) for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_gcd_on.png]],
			imageoff = ImageFolder..[[tank_gcd_off.png]],
		},
		TankBene = {
			index = 6,
			name = "Benediction (T)",
			visible = false,
			bool = true,
			menu = "Benediction",
			tooltip = "Enable/Disable Benediction for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[benediction_on.png]],
			imageoff = ImageFolder..[[benediction_off.png]],
		},
		TankSol = {
			index = 7,
			name = "Solace (T)",
			visible = false,
			bool = true,
			menu = "Affl. Solace",
			tooltip = "Enable/Disable Afflatus Solace for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[afflatus_solace_on.png]],
			imageoff = ImageFolder..[[afflatus_solace_off.png]],
		},
		TankTetra = {
			index = 8,
			name = "Tetra (T)",
			visible = false,
			bool = true,
			menu = "Tetragrammaton",
			tooltip = "Enable/Disable Tetragrammaton for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tetragrammaton_on.png]],
			imageoff = ImageFolder..[[tetragrammaton_off.png]],
		},
		TankRegen = {
			index = 9,
			name = "Regen (T)",
			visible = false,
			bool = true,
			menu = "Regen",
			tooltip = "Enable/Disable Regen for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[regen_on.png]],
			imageoff = ImageFolder..[[regen_off.png]],
		},
		TankCureII = {
			index = 10,
			name = "Cure II (T)",
			visible = false,
			bool = true,
			menu = "Cure II",
			tooltip = "Enable/Disable Cure II for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[cure_ii_on.png]],
			imageoff = ImageFolder..[[cure_ii_off.png]],
		},
		TankCure = {
			index = 11,
			name = "Cure (T)",
			visible = false,
			bool = true,
			menu = "Cure",
			tooltip = "Enable/Disable Cure for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[cure_on.png]],
			imageoff = ImageFolder..[[cure_off.png]],
		},
		PartyHeal = {
			index = 12,
			name = "Heal (P)",
			visible = false,
			bool = true,
			menu = "Heal Party",
			tooltip = "Enable/Disable Heals for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_heal_on.png]],
			imageoff = ImageFolder..[[party_heal_off.png]],
		},
		PartyGcd = {
			index = 13,
			name = "Gcds (P)",
			visible = false,
			bool = true,
			menu = "Gcds",
			tooltip = "Enable/Disable GCD abilities (apart from Lily Heals) for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_gcd_on.png]],
			imageoff = ImageFolder..[[party_gcd_off.png]],
		},
		PartyRap = {
			index = 14,
			name = "Rapture (P)",
			visible = false,
			bool = true,
			menu = "Affl. Rapture",
			tooltip = "Enable/Disable Afflatus Rapture for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[afflatus_rapture_on.png]],
			imageoff = ImageFolder..[[afflatus_rapture_off.png]],
		},
		PartyCureIII = {
			index = 15,
			name = "Cure III (P)",
			visible = false,
			bool = true,
			menu = "Cure III",
			tooltip = "Enable/Disable Cure III for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[cure_iii_on.png]],
			imageoff = ImageFolder..[[cure_iii_off.png]],
		},
		PartyMedII = {
			index = 16,
			name = "Medica II (P)",
			visible = false,
			bool = true,
			menu = "Medica II",
			tooltip = "Enable/Disable Medica II for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[medica_ii_on.png]],
			imageoff = ImageFolder..[[medica_ii_off.png]],
		},
		PartyMed = {
			index = 17,
			name = "Medica (P)",
			visible = false,
			bool = true,
			menu = "Medica",
			tooltip = "Enable/Disable Medica for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[medica_on.png]],
			imageoff = ImageFolder..[[medica_off.png]],
		},
		PartySol = {
			index = 18,
			name = "Solace (P)",
			visible = false,
			bool = true,
			menu = "Affl. Solace",
			tooltip = "Enable/Disable Afflatus Solace for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[solace_on.png]],
			imageoff = ImageFolder..[[solace_off.png]],
		},
		PartyTetra = {
			index = 19,
			name = "Tetra (P)",
			visible = false,
			bool = true,
			menu = "Tetragrammaton",
			tooltip = "Enable/Disable Tetragrammaton for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tetragrammaton_on.png]],
			imageoff = ImageFolder..[[tetragrammaton_off.png]],
		},
		PartyRegen = {
			index = 20,
			name = "Regen (P)",
			visible = false,
			bool = true,
			menu = "Regen",
			tooltip = "Enable/Disable Regen for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[regen_on.png]],
			imageoff = ImageFolder..[[regen_off.png]],
		},
		PartyCureII = {
			index = 21,
			name = "Cure II (P)",
			visible = false,
			bool = true,
			menu = "Cure II",
			tooltip = "Enable/Disable Cure II for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[cure_ii_on.png]],
			imageoff = ImageFolder..[[cure_ii_off.png]],
		},
		PartyCure = {
			index = 22,
			name = "Cure (P)",
			visible = false,
			bool = true,
			menu = "Cure",
			tooltip = "Enable/Disable Cure for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[cure_on.png]],
			imageoff = ImageFolder..[[cure_off.png]],
		},
		Temperance = {
			index = 23,
			name = "Temperance",
			visible = false,
			bool = true,
			menu = "Temperance",
			tooltip = "Enable/Disable Temperance",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[temperance_on.png]],
			imageoff = ImageFolder..[[temperance_off.png]],
		},
		Asylum = {
			index = 24,
			name = "Asylum",
			visible = false,
			bool = true,
			menu = "Asylum",
			tooltip = "Enable/Disable Asylum",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[asylum_on.png]],
			imageoff = ImageFolder..[[asylum_off.png]],
		},
		Plenary = {
			index = 25,
			name = "Plenary",
			visible = false,
			bool = true,
			menu = "Plenary I.",
			tooltip = "Enable/Disable Plenary Indulgence",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[plenary_indulgence_on.png]],
			imageoff = ImageFolder..[[plenary_indulgence_off.png]],
		},
	},
	
	--[Whm] Everywhere
	WhmEvHotbarButColOn = {
		R = 135/255,
		G = 117/255,
		B = 0/255,
		T = 255/255,
	},
	WhmEvHotbarButColOff = {
		R = 50/255,
		G = 50/255,
		B = 50/255,
		T = 255/255,
	},
	WhmEvHotbarBgT = 255,
	WhmEvHotbarButtonSizeX = 103,
	WhmEvHotbarButtonSizeY = 30,
	WhmEvHotbarColumns = 1,
	WhmEvHotbarLocked = false,
	WhmEvHotbarEnabled = true,

	WhmEvTankOverhealSingle = 90,
	WhmEvPartyOverhealAOE = 75,
	WhmEvPartyOverhealSingle = 75,
	
	WhmEvHotbar = {
		Heal = {
			index = 1,
			name = "Heal",
			visible = true,
			bool = true,
			menu = "Heal",
			tooltip = "Enable/Disable Heals",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[heal_on.png]],
			imageoff = ImageFolder..[[heal_off.png]],
		},
		UsePrepull = {
			index = 2,
			name = "Prepull",
			visible = false,
			bool = true,
			menu = "Prepull",
			tooltip = "Enable/Disable abilities before a pull (min Lvl 80)",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[prepull_on.png]],
			imageoff = ImageFolder..[[prepull_off.png]],
		},
		Sprint = {
			index = 3,
			name = "Sprint",
			visible = false,
			bool = true,
			menu = "Sprint",
			tooltip = "Enable/Disable Sprint",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[sprint_on.png]],
			imageoff = ImageFolder..[[sprint_off.png]],
		},
		TankHeal = {
			index = 4,
			name = "Heal (T)",
			visible = false,
			bool = true,
			menu = "Heal Tank",
			tooltip = "Enable/Disable Heals for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_heal_on.png]],
			imageoff = ImageFolder..[[tank_heal_off.png]],
		},
		TankLily = {
			index = 5,
			name = "Gcd (T)",
			visible = false,
			bool = true,
			menu = "Gcd ",
			tooltip = "Enable/Disable GCD abilities (apart from Lily Heals) for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tank_gcd_on.png]],
			imageoff = ImageFolder..[[tank_gcd_off.png]],
		},
		TankBene = {
			index = 6,
			name = "Benediction (T)",
			visible = false,
			bool = true,
			menu = "Benediction",
			tooltip = "Enable/Disable Benediction for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[benediction_on.png]],
			imageoff = ImageFolder..[[benediction_off.png]],
		},
		TankSol = {
			index = 7,
			name = "Solace (T)",
			visible = false,
			bool = true,
			menu = "Affl. Solace",
			tooltip = "Enable/Disable Afflatus Solace for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[afflatus_solace_on.png]],
			imageoff = ImageFolder..[[afflatus_solace_off.png]],
		},
		TankTetra = {
			index = 8,
			name = "Tetra (T)",
			visible = false,
			bool = true,
			menu = "Tetragrammaton",
			tooltip = "Enable/Disable Tetragrammaton for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tetragrammaton_on.png]],
			imageoff = ImageFolder..[[tetragrammaton_off.png]],
		},
		TankRegen = {
			index = 9,
			name = "Regen (T)",
			visible = false,
			bool = true,
			menu = "Regen",
			tooltip = "Enable/Disable Regen for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[regen_on.png]],
			imageoff = ImageFolder..[[regen_off.png]],
		},
		TankCureII = {
			index = 10,
			name = "Cure II (T)",
			visible = false,
			bool = true,
			menu = "Cure II",
			tooltip = "Enable/Disable Cure II for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[cure_ii_on.png]],
			imageoff = ImageFolder..[[cure_ii_off.png]],
		},
		TankCure = {
			index = 11,
			name = "Cure (T)",
			visible = false,
			bool = true,
			menu = "Cure",
			tooltip = "Enable/Disable Cure for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[cure_on.png]],
			imageoff = ImageFolder..[[cure_off.png]],
		},
		TankAquaveil = {
			index = 12,
			name = "Aquaveil (T)",
			visible = false,
			bool = true,
			menu = "Aquaveil",
			tooltip = "Enable/Disable Aquaveil for Tanks",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[aquaveil_on.png]],
			imageoff = ImageFolder..[[aquaveil_off.png]],
		},
		PartyHeal = {
			index = 13,
			name = "Heal (P)",
			visible = false,
			bool = true,
			menu = "Heal Party",
			tooltip = "Enable/Disable Heals for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_heal_on.png]],
			imageoff = ImageFolder..[[party_heal_off.png]],
		},
		PartyGcd = {
			index = 14,
			name = "Gcd (P)",
			visible = false,
			bool = true,
			menu = "Gcd",
			tooltip = "Enable/Disable GCD abilities (apart from Lily Heals) for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[party_gcd_on.png]],
			imageoff = ImageFolder..[[party_gcd_off.png]],
		},
		PartyRap = {
			index = 15,
			name = "Rapture (P)",
			visible = false,
			bool = true,
			menu = "Affl. Rapture",
			tooltip = "Enable/Disable Afflatus Rapture for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[afflatus_rapture_on.png]],
			imageoff = ImageFolder..[[afflatus_rapture_off.png]],
		},
		PartyCureIII = {
			index = 16,
			name = "Cure III (P)",
			visible = false,
			bool = true,
			menu = "Cure III",
			tooltip = "Enable/Disable Cure III for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[cure_iii_on.png]],
			imageoff = ImageFolder..[[cure_iii_off.png]],
		},
		PartyMedII = {
			index = 17,
			name = "Medica II (P)",
			visible = false,
			bool = true,
			menu = "Medica II",
			tooltip = "Enable/Disable Medica II for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[medica_ii_on.png]],
			imageoff = ImageFolder..[[medica_ii_off.png]],
		},
		PartyMed = {
			index = 18,
			name = "Medica (P)",
			visible = false,
			bool = true,
			menu = "Medica",
			tooltip = "Enable/Disable Medica for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[medica_on.png]],
			imageoff = ImageFolder..[[medica_off.png]],
		},
		PartyBene = {
			index = 19,
			name = "Benediction (P)",
			visible = false,
			bool = true,
			menu = "Benediction",
			tooltip = "Enable/Disable Benediction for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[benediction_on.png]],
			imageoff = ImageFolder..[[benediction_off.png]],
		},
		PartySol = {
			index = 20,
			name = "Solace (P)",
			visible = false,
			bool = true,
			menu = "Affl. Solace",
			tooltip = "Enable/Disable Afflatus Solace for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[afflatus_solace_on.png]],
			imageoff = ImageFolder..[[afflatus_solace_off.png]],
		},
		PartyTetra = {
			index = 21,
			name = "Tetra (P)",
			visible = false,
			bool = true,
			menu = "Tetragrammaton",
			tooltip = "Enable/Disable Tetragrammaton for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[tetragrammaton_on.png]],
			imageoff = ImageFolder..[[tetragrammaton_off.png]],
		},
		PartyRegen = {
			index = 22,
			name = "Regen (P)",
			visible = false,
			bool = true,
			menu = "Regen",
			tooltip = "Enable/Disable Regen for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[regen_on.png]],
			imageoff = ImageFolder..[[regen_off.png]],
		},
		PartyCureII = {
			index = 23,
			name = "Cure II (P)",
			visible = false,
			bool = true,
			menu = "Cure II",
			tooltip = "Enable/Disable Cure II for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[cure_ii_on.png]],
			imageoff = ImageFolder..[[cure_ii_off.png]],
		},
		PartyCure = {
			index = 24,
			name = "Cure (P)",
			visible = false,
			bool = true,
			menu = "Cure",
			tooltip = "Enable/Disable Cure for party members",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[cure_on.png]],
			imageoff = ImageFolder..[[cure_off.png]],
		},
		Temperance = {
			index = 25,
			name = "Temperance",
			visible = false,
			bool = true,
			menu = "Temperance",
			tooltip = "Enable/Disable Temperance",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[temperance_on.png]],
			imageoff = ImageFolder..[[temperance_off.png]],
		},
		Asylum = {
			index = 26,
			name = "Asylum",
			visible = false,
			bool = true,
			menu = "Asylum",
			tooltip = "Enable/Disable Asylum",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[asylum_on.png]],
			imageoff = ImageFolder..[[asylum_off.png]],
		},
		Esuna = {
			index = 27,
			name = "Esuna",
			visible = false,
			bool = true,
			menu = "Esuna",
			tooltip = "Enable/Disable Esuna",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[esuna_on.png]],
			imageoff = ImageFolder..[[esuna_off.png]],
		},
		Plenary = {
			index = 28,
			name = "Plenary",
			visible = false,
			bool = true,
			menu = "Plenary I.",
			tooltip = "Enable/Disable Plenary Indulgence",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[plenary_indulgence_on.png]],
			imageoff = ImageFolder..[[plenary_indulgence_off.png]],
		},
		LiturgyOfTheBell = {
			index = 29,
			name = "Liturgy of the Bell",
			visible = false,
			bool = true,
			menu = "Liturgy of the Bell",
			tooltip = "Enable/Disable Liturgy of the Bell",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[liturgy_of_the_bell_on.png]],
			imageoff = ImageFolder..[[liturgy_of_the_bell_off.png]],
		},
	},
    --[Sge] Savage
    SgeSavHotbarButColOn = {
        R = 135/255,
        G = 117/255,
        B = 0/255,
        T = 255/255,
    },
    SgeSavHotbarButColOff = {
        R = 50/255,
        G = 50/255,
        B = 50/255,
        T = 255/255,
    },
    SgeSavHotbarBgT = 255,
    SgeSavHotbarButtonSizeX = 103,
    SgeSavHotbarButtonSizeY = 30,
    SgeSavHotbarColumns = 1,
    SgeSavHotbarLocked = false,
    SgeSavHotbarEnabled = true,

    SgeSavTankOverhealSingle = 100,
    SgeSavPartyOverhealAOE = 100,
    SgeSavPartyOverhealSingle = 100,

    -- Fight Specific

    SgeSavHotbar = {
        Heal = {
            index = 1,
            name = "Heal",
            visible = true,
            bool = true,
            menu = "Heal",
            tooltip = "Enable/Disable Heals",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[heal_on.png]],
            imageoff = ImageFolder..[[heal_off.png]],
        },
        UsePrepull = {
            index = 2,
            name = "Prepull",
            visible = false,
            bool = true,
            menu = "Prepull",
            tooltip = "Enable/Disable prepull abilities",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[prepull_on.png]],
            imageoff = ImageFolder..[[prepull_off.png]],
        },
        Sprint = {
            index = 3,
            name = "Sprint",
            visible = false,
            bool = true,
            menu = "Sprint",
            tooltip = "Enable/Disable Sprint",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[sprint_on.png]],
            imageoff = ImageFolder..[[sprint_off.png]],
        },
        TankHeal = {
            index = 4,
            name = "Heal (T)",
            visible = false,
            bool = true,
            menu = "Heal Tank",
            tooltip = "Enable/Disable Heals for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[tank_heal_on.png]],
            imageoff = ImageFolder..[[tank_heal_off.png]],
        },
        TankGcd = {
            index = 5,
            name = "GCD (T)",
            visible = false,
            bool = true,
            menu = "GCD",
            tooltip = "Enable/Disable GCD abilities for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[tank_gcd_on.png]],
            imageoff = ImageFolder..[[tank_gcd_off.png]],
        },
        TankExco = {
            index = 6,
            name = "Exco (T)",
            visible = false,
            bool = true,
            menu = "Excogitation",
            tooltip = "Enable/Disable Excogitation for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[excogitation_on.png]],
            imageoff = ImageFolder..[[excogitation_off.png]],
        },
        TankAp = {
            index = 7,
            name = "Aetherpact (T)",
            visible = false,
            bool = true,
            menu = "Aetherpact",
            tooltip = "Enable/Disable Aetherpact for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[aetherpact_on.png]],
            imageoff = ImageFolder..[[aetherpact_off.png]],
        },
        TankLustrate = {
            index = 8,
            name = "Lustrate (T)",
            visible = false,
            bool = true,
            menu = "Lustrate",
            tooltip = "Enable/Disable Lustrate for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[lustrate_on.png]],
            imageoff = ImageFolder..[[lustrate_off.png]],
        },
        TankEt = {
            index = 9,
            name = "ET (T)",
            visible = false,
            bool = true,
            menu = "E. Tactics",
            tooltip = "Enable/Disable Emergency Tactics for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[emergency_tactics_on.png]],
            imageoff = ImageFolder..[[emergency_tactics_off.png]],
        },
        TankAdlo = {
            index = 10,
            name = "Adlo (T)",
            visible = false,
            bool = true,
            menu = "Adloquium",
            tooltip = "Enable/Disable Adloquium for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[adloquium_on.png]],
            imageoff = ImageFolder..[[adloquium_off.png]],
        },
        TankPhysick = {
            index = 11,
            name = "Physick (T)",
            visible = false,
            bool = true,
            menu = "Physick",
            tooltip = "Enable/Disable Physick for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[physick_on.png]],
            imageoff = ImageFolder..[[physick_off.png]],
        },
        TankProtraction = {
            index = 12,
            name = "Protraction (T)",
            visible = false,
            bool = true,
            menu = "Protraction",
            tooltip = "Enable/Disable Protraction for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[protraction_on.png]],
            imageoff = ImageFolder..[[protraction_off.png]],
        },
        PartyHeal = {
            index = 13,
            name = "Heal (P)",
            visible = false,
            bool = true,
            menu = "Heal Party",
            tooltip = "Enable/Disable Heals for party members",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[party_heal_on.png]],
            imageoff = ImageFolder..[[party_heal_off.png]],
        },
        PartyGcd = {
            index = 14,
            name = "GCD (P)",
            visible = false,
            bool = true,
            menu = "GCD",
            tooltip = "Enable/Disable GCD abilities for party members",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[party_gcd_on.png]],
            imageoff = ImageFolder..[[party_gcd_off.png]],
        },
        PartyConsolation = {
            index = 15,
            name = "Consolation (P)",
            visible = false,
            bool = true,
            menu = "Consolation",
            tooltip = "Enable/Disable Consolation for party members",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[consolation_on.png]],
            imageoff = ImageFolder..[[consolation_off.png]],
        },
        PartyIndom = {
            index = 16,
            name = "Indom (P)",
            visible = false,
            bool = true,
            menu = "Indom",
            tooltip = "Enable/Disable Indomitability for party members",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[indomitability_on.png]],
            imageoff = ImageFolder..[[indomitability_off.png]],
        },
        PartyWhisp = {
            index = 17,
            name = "WD (P)",
            visible = false,
            bool = true,
            menu = "Whisp. Dawn",
            tooltip = "Enable/Disable Whispering Dawn for party members",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[whispering_dawn_on.png]],
            imageoff = ImageFolder..[[whispering_dawn_off.png]],
        },
        PartyFeyB = {
            index = 18,
            name = "FB (P)",
            visible = false,
            bool = true,
            menu = "Fey Blessing",
            tooltip = "Enable/Disable Fey Blessing for party members",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[fey_blessing_on.png]],
            imageoff = ImageFolder..[[fey_blessing_off.png]],
        },
        PartySuccor = {
            index = 19,
            name = "Succor (P)",
            visible = false,
            bool = true,
            menu = "Succor",
            tooltip = "Enable/Disable Succor for party members",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[succor_on.png]],
            imageoff = ImageFolder..[[succor_off.png]],
        },
        PartyAp = {
            index = 20,
            name = "Ap (P)",
            visible = false,
            bool = true,
            menu = "Aetherpact",
            tooltip = "Enable/Disable Aetherpact for party members",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[aetherpact_on.png]],
            imageoff = ImageFolder..[[aetherpact_off.png]],
        },
        PartyLustrate = {
            index = 21,
            name = "Lustrate (P)",
            visible = false,
            bool = true,
            menu = "Lustrate",
            tooltip = "Enable/Disable Lustrate for party members",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[lustrate_on.png]],
            imageoff = ImageFolder..[[lustrate_off.png]],
        },
        PartyAdlo = {
            index = 22,
            name = "Adlo (P)",
            visible = false,
            bool = true,
            menu = "Adloquium",
            tooltip = "Enable/Disable Adloquium for party members",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[adloquium_on.png]],
            imageoff = ImageFolder..[[adloquium_off.png]],
        },
        PartyPhysick = {
            index = 23,
            name = "Physick (P)",
            visible = false,
            bool = true,
            menu = "Physick",
            tooltip = "Enable/Disable Physick for party members",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[physick_on.png]],
            imageoff = ImageFolder..[[physick_off.png]],
        },
        Seraph = {
            index = 24,
            name = "Seraph",
            visible = false,
            bool = true,
            menu = "Summon Seraph",
            tooltip = "Enable/Disable Seraph",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[seraph_on.png]],
            imageoff = ImageFolder..[[seraph_off.png]],
        },
        Soil = {
            index = 25,
            name = "Sacred Soil",
            visible = false,
            bool = true,
            menu = "Sacred Soil",
            tooltip = "Enable/Disable Sacred Soil",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[sacred_soil_on.png]],
            imageoff = ImageFolder..[[sacred_soil_off.png]],
        },
        FeyIllu = {
            index = 26,
            name = "Illumination",
            visible = false,
            bool = true,
            menu = "Illumination",
            tooltip = "Enable/Disable Fey Illumination",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[fey_illumination_on.png]],
            imageoff = ImageFolder..[[fey_illumination_off.png]],
        },
        DeploymentTact = {
            index = 27,
            name = "D. Tactics",
            visible = false,
            bool = true,
            menu = "D. Tactics",
            tooltip = "Enable/Disable Deployment Tactics",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[deployment_tactics_on.png]],
            imageoff = ImageFolder..[[deployment_tactics_off.png]],
        },
        Expedient = {
            index = 28,
            name = "Expedient",
            visible = false,
            bool = true,
            menu = "Expedient",
            tooltip = "Enable/Disable Expedient",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[expedient_on.png]],
            imageoff = ImageFolder..[[expedient_off.png]],
        },
    },

    --[Sge] Everywhere
    SgeEvHotbarButColOn = {
        R = 135/255,
        G = 117/255,
        B = 0/255,
        T = 255/255,
    },
    SgeEvHotbarButColOff = {
        R = 50/255,
        G = 50/255,
        B = 50/255,
        T = 255/255,
    },
    SgeEvHotbarBgT = 255,
    SgeEvHotbarButtonSizeX = 103,
    SgeEvHotbarButtonSizeY = 30,
    SgeEvHotbarColumns = 1,
    SgeEvHotbarLocked = false,
    SgeEvHotbarEnabled = true,

    SgeEvTankOverhealSingle = 90,
    SgeEvPartyOverhealAOE = 75,
    SgeEvPartyOverhealSingle = 75,

    SgeEvHotbar = {
        Heal = {
            index = 1,
            name = "Heal",
            visible = true,
            bool = true,
            menu = "Heal",
            tooltip = "Enable/Disable Heals",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[heal_on.png]],
            imageoff = ImageFolder..[[heal_off.png]],
        },
		DPS = {
			index = 2,
			name = "DPS",
			visible = false,
			bool = true,
			menu = "DPS",
			tooltip = "Enable/Disable DPS abilities",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[dps_on.png]],
			imageoff = ImageFolder..[[dps_off.png]],
		},
		SmartTarget = {
			index = 3,
			name = "Smart Target",
			visible = false,
			bool = true,
			menu = "Smart Target",
			tooltip = "Enable/Disable Smart Targeting",
			key = -1,
			keyname = "None",
			modifierC = false,
			modifierS = false,
			modifierA = false,
			imageon = ImageFolder..[[smart_target_on.png]],
			imageoff = ImageFolder..[[smart_target_off.png]],
		},
        UsePrepull = {
            index = 4,
            name = "Prepull",
            visible = false,
            bool = true,
            menu = "Prepull",
            tooltip = "Enable/Disable abilities before a pull (minimum Lvl 90, currently does nothing)",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[prepull_on.png]],
            imageoff = ImageFolder..[[prepull_off.png]],
        },
        Sprint = {
            index = 5,
            name = "Sprint",
            visible = false,
            bool = true,
            menu = "Sprint",
            tooltip = "Enable/Disable Sprint",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[sprint_on.png]],
            imageoff = ImageFolder..[[sprint_off.png]],
        },
        Dosis = {
            index = 6,
            name = "Dosis (D)",
            visible = false,
            bool = true,
            menu = "Dosis",
            tooltip = "Enable/Disable Dosis",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[dosis_on.png]],
            imageoff = ImageFolder..[[dosis_off.png]],
        },
        Diagnosis = {
            index = 7,
            name = "Diagnosis (H)",
            visible = false,
            bool = true,
            menu = "Diagnosis",
            tooltip = "Enable/Disable Diagnosis for Tanks and Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[diagnosis_on.png]],
            imageoff = ImageFolder..[[diagnosis_off.png]],
        },
        Kardia = {
            index = 8,
            name = "Kardia (H)",
            visible = false,
            bool = true,
            menu = "Kardia",
            tooltip = "Enable/Disable Kardia for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[kardia_on.png]],
            imageoff = ImageFolder..[[kardia_off.png]],
        },
        Esuna = {
            index = 9,
            name = "Esuna",
            visible = false,
            bool = true,
            menu = "Esuna",
            tooltip = "Enable/Disable Esuna for Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[esuna_on.png]],
            imageoff = ImageFolder..[[esuna_off.png]],
        },
        Swiftcast = {
            index = 10,
            name = "Swiftcast",
            visible = false,
            bool = true,
            menu = "Swiftcast",
            tooltip = "Enable/Disable Swiftcast",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[swiftcast_on.png]],
            imageoff = ImageFolder..[[swiftcast_off.png]],
        },
        Prognosis = {
            index = 11,
            name = "Prognosis (H)",
            visible = false,
            bool = true,
            menu = "Prognosis",
            tooltip = "Enable/Disable Prognosis",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[prognosis_on.png]],
            imageoff = ImageFolder..[[prognosis_off.png]],
        },
        Egeiro = {
            index = 12,
            name = "Egeiro (H)",
            visible = false,
            bool = true,
            menu = "Egeiro",
            tooltip = "Enable/Disable Egeiro for Tanks and Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[egeiro_on.png]],
            imageoff = ImageFolder..[[egeiro_off.png]],
        },
        Physis = {
            index = 13,
            name = "Physis (H)",
            visible = false,
            bool = true,
            menu = "Physis",
            tooltip = "Enable/Disable Physis for Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[physis_on.png]],
            imageoff = ImageFolder..[[physis_off.png]],
        },
        Phlegma = {
            index = 14,
            name = "Phlegma (D)",
            visible = false,
            bool = true,
            menu = "Phlegma",
            tooltip = "Enable/Disable Phlegma for Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[phlegma_on.png]],
            imageoff = ImageFolder..[[phlegma_off.png]],
        },
        Eukrasia = {
            index = 15,
            name = "Eukrasia",
            visible = false,
            bool = true,
            menu = "Eukrasia",
            tooltip = "Enable/Disable Eukrasia",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[eukrasia_on.png]],
            imageoff = ImageFolder..[[eukrasia_off.png]],
        },
        EukrasianDiagnosis = {
            index = 16,
            name = "Eukrasian Diagnosis (H)",
            visible = false,
            bool = true,
            menu = "Physick",
            tooltip = "Enable/Disable Eukrasian Diagnosis for Tanks and Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[eukrasian_diagnosis_on.png]],
            imageoff = ImageFolder..[[eukrasian_diagnosis_off.png]],
        },
        EukrasianPrognosis = {
            index = 17,
            name = "Eukrasian Prognosis (H)",
            visible = false,
            bool = true,
            menu = "Eukrasian Prognosis",
            tooltip = "Enable/Disable Eukrasian Prognosis for Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[eukrasian_prognosis_on.png]],
            imageoff = ImageFolder..[[eukrasian_prognosis_off.png]],
        },
        EukrasianDosis = {
            index = 18,
            name = "Eukrasian Dosis (D)",
            visible = false,
            bool = true,
            menu = "Eukrasian Dosis",
            tooltip = "Enable/Disable Eukrasian Dosis",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[eukrasian_dosis_on.png]],
            imageoff = ImageFolder..[[eukrasian_dosis_off.png]],
        },
        Soteria = {
            index = 19,
            name = "Soteria",
            visible = false,
            bool = true,
            menu = "Soteria",
            tooltip = "Enable/Disable Soteria for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[soteria_on.png]],
            imageoff = ImageFolder..[[soteria_off.png]],
        },
        Icarus = {
            index = 20,
            name = "Icarus",
            visible = false,
            bool = true,
            menu = "Icarus",
            tooltip = "Enable/Disable Icarus",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[icarus_on.png]],
            imageoff = ImageFolder..[[icarus_off.png]],
        },
        Druochole = {
            index = 21,
            name = "Druochole (H)",
            visible = false,
            bool = true,
            menu = "Druochole",
            tooltip = "Enable/Disable Druochole for Tanks and Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[druochole_on.png]],
            imageoff = ImageFolder..[[druochole_off.png]],
        },
        Dyskrasia = {
            index = 22,
            name = "Dyskrasia (D)",
            visible = false,
            bool = true,
            menu = "Dyskrasia",
            tooltip = "Enable/Disable Dyskrasia",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[dyskrasia_on.png]],
            imageoff = ImageFolder..[[dyskrasia_off.png]],
        },
        Kerachole = {
            index = 23,
            name = "Kerachole (H)",
            visible = false,
            bool = true,
            menu = "Kerachole",
            tooltip = "Enable/Disable Kerachole for Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[kerachole_on.png]],
            imageoff = ImageFolder..[[kerachole_off.png]],
        },
        Ixochole = {
            index = 24,
            name = "Ixochole (H)",
            visible = false,
            bool = true,
            menu = "Ixochole",
            tooltip = "Enable/Disable Ixochole for Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[ixochole_on.png]],
            imageoff = ImageFolder..[[ixochole_off.png]],
        },
        Zoe = {
            index = 25,
            name = "Zoe",
            visible = false,
            bool = true,
            menu = "Zoe",
            tooltip = "Enable/Disable Zoe",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[zoe_on.png]],
            imageoff = ImageFolder..[[zoe_off.png]],
        },
        Pepsis = {
            index = 26,
            name = "Pepsis (H)",
            visible = false,
            bool = true,
            menu = "Pepsis",
            tooltip = "Enable/Disable Pepsis for Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[pepsis_on.png]],
            imageoff = ImageFolder..[[pepsis_off.png]],
        },
        PhysisII = {
            index = 27,
            name = "Physis II (H)",
            visible = false,
            bool = true,
            menu = "Physis II",
            tooltip = "Enable/Disable Physis II for Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[physis_ii_on.png]],
            imageoff = ImageFolder..[[physis_ii_off.png]],
        },
        Taurochole = {
            index = 28,
            name = "Taurochole (H)",
            visible = false,
            bool = true,
            menu = "Taurochole",
            tooltip = "Enable/Disable Taurochole for Tanks and Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[taurochole_on.png]],
            imageoff = ImageFolder..[[taurochole_off.png]],
        },
        Toxikon = {
            index = 29,
            name = "Toxikon (D)",
            visible = false,
            bool = true,
            menu = "Toxikon",
            tooltip = "Enable/Disable Toxikon",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[toxikon_on.png]],
            imageoff = ImageFolder..[[toxikon_off.png]],
        },
        Haima = {
            index = 30,
            name = "Haima (H)",
            visible = false,
            bool = true,
            menu = "Haima",
            tooltip = "Enable/Disable Haima for Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[haima_on.png]],
            imageoff = ImageFolder..[[haima_off.png]],
        },
        DosisII = {
            index = 31,
            name = "Dosis II (D)",
            visible = false,
            bool = true,
            menu = "Dosis II",
            tooltip = "Enable/Disable Dosis II",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[dosis_ii_on.png]],
            imageoff = ImageFolder..[[dosis_ii_off.png]],
        },
        PhlegmaII = {
            index = 32,
            name = "Phlegma II (D)",
            visible = false,
            bool = true,
            menu = "Phlegma II",
            tooltip = "Enable/Disable Phlegma",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[phlegma_ii_on.png]],
            imageoff = ImageFolder..[[phlegma_ii_off.png]],
        },
        EukrasianDosisII = {
            index = 33,
            name = "Eukrasian Dosis II (D)",
            visible = false,
            bool = true,
            menu = "Eukrasian Dosis II",
            tooltip = "Enable/Disable Eukrasian Dosis II",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[eukrasian_dosis_ii_on.png]],
            imageoff = ImageFolder..[[eukrasian_dosis_ii_off.png]],
        },
        Rhizomata = {
            index = 34,
            name = "Rhizomata",
            visible = false,
            bool = true,
            menu = "Rhizomata",
            tooltip = "Enable/Disable Rhizomata",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[rhizomata_on.png]],
            imageoff = ImageFolder..[[rhizomata_off.png]],
        },
        Holos = {
            index = 35,
            name = "Holos (H)",
            visible = false,
            bool = true,
            menu = "Holos",
            tooltip = "Enable/Disable Holos for Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[holos_on.png]],
            imageoff = ImageFolder..[[holos_off.png]],
        },
        Panhaima = {
            index = 36,
            name = "Panhaima (H)",
            visible = false,
            bool = true,
            menu = "Panhaima",
            tooltip = "Enable/Disable Panhaima for Party",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[panhaima_on.png]],
            imageoff = ImageFolder..[[panhaima_off.png]],
        },
        DosisIII = {
            index = 37,
            name = "Dosis III (D)",
            visible = false,
            bool = true,
            menu = "Dosis III",
            tooltip = "Enable/Disable Dosis III",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[dosis_iii_on.png]],
            imageoff = ImageFolder..[[dosis_iii_off.png]],
        },
        PhlegmaIII = {
            index = 38,
            name = "Phlegma III (D)",
            visible = false,
            bool = true,
            menu = "Phelgma III",
            tooltip = "Enable/Disable Phlegma III",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[phlegma_iii_on.png]],
            imageoff = ImageFolder..[[phlegma_iii_off.png]],
        },
        EukrasianDosisIII = {
            index = 39,
            name = "Eukrasian Dosis III (D)",
            visible = false,
            bool = true,
            menu = "Eukrasian Dosis III",
            tooltip = "Enable/Disable Eukrasian Dosis III",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[eukrasian_dosis_iii_on.png]],
            imageoff = ImageFolder..[[eukrasian_dosis_iii_off.png]],
        },
        DyskrasiaII = {
            index = 40,
            name = "Dyskrasia II (D)",
            visible = false,
            bool = true,
            menu = "Dyskrasia II",
            tooltip = "Enable/Disable Dyskrasia II",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[dyskrasia_ii_on.png]],
            imageoff = ImageFolder..[[dyskrasia_ii_off.png]],
        },
        ToxikonII = {
            index = 41,
            name = "Toxikon II (D)",
            visible = false,
            bool = true,
            menu = "Toxikon II",
            tooltip = "Enable/Disable Toxikon II",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[toxikon_ii_on.png]],
            imageoff = ImageFolder..[[toxikon_ii_off.png]],
        },
        Krasis = {
            index = 42,
            name = "Krasis (H)",
            visible = false,
            bool = true,
            menu = "Krasis",
            tooltip = "Enable/Disable Krasis on Tanks",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[krasis_on.png]],
            imageoff = ImageFolder..[[krasis_off.png]],
        },
        Pneuma = {
            index = 43,
            name = "Pneuma (D)",
            visible = false,
            bool = true,
            menu = "Pneuma",
            tooltip = "Enable/Disable Pneuma",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[pneuma_on.png]],
            imageoff = ImageFolder..[[pneuma_off.png]],
        },
		HealOutsideOfCombat = {
            index = 29,
            name = "Heal OOC",
            visible = true,
            bool = false,
            menu = "Heal Outside of combat",
            tooltip = "Heal outside of combat / Without a target",
            key = -1,
            keyname = "None",
            modifierC = false,
            modifierS = false,
            modifierA = false,
            imageon = ImageFolder..[[expedient_on.png]],
            imageoff = ImageFolder..[[expedient_off.png]],
        },
    },
}

RoseCore.KeyCodes =
{
	[1] =  { key = 33, name = "PAGE UP", },
	[2] =  { key = 35, name = "END", },
	[3] =  { key = 37, name = "LEFT ARROW", },
	[4] =  { key = 39, name = "RIGHT ARROW", },
	[5] =  { key = 41, name = "SELECT", },
	[6] =  { key = 43, name = "EXECUTE", },
	[7] =  { key = 45, name = "INS", },
	[8] =  { key = 47, name = "HELP", },
	[9] =  { key = 49, name = "1", },
	[10] =  { key = 51, name = "3", },
	[11] =  { key = 53, name = "5", },
	[12] =  { key = 55, name = "7", },
	[13] =  { key = 57, name = "9", },
	[14] =  { key = 251, name = "Zoom", },
	[15] =  { key = 66, name = "B", },
	[16] =  { key = 70, name = "F", },
	[17] =  { key = 74, name = "J", },
	[18] =  { key = 78, name = "N", },
	[19] =  { key = 82, name = "R", },
	[20] =  { key = 86, name = "V", },
	[21] =  { key = 90, name = "Z", },
	[22] =  { key = 98, name = "Numpad 2", },
	[23] =  { key = 102, name = "Numpad 6", },
	[24] =  { key = 106, name = "Multiply", },
	[25] =  { key = 110, name = "Decimal", },
	[26] =  { key = 114, name = "F3", },
	[27] =  { key = 118, name = "F7", },
	[28] =  { key = 122, name = "F11", },
	[29] =  { key = 126, name = "F15", },
	[30] =  { key = 132, name = "F21", },
	[31] =  { key = 164, name = "Left MENU", },
	[32] =  { key = 172, name = "Browser Start and Home", },
	[33] =  { key = 180, name = "Start Mail", },
	[34] =  { key = 188, name = ",", },
	[35] =  { key = 220, name = "|", },
	[36] =  { key = 1, name = "Left mouse button", },
	[37] =  { key = 2, name = "Right mouse button", },
	[38] =  { key = 133, name = "F22", },
	[39] =  { key = 165, name = "Right MENU", },
	[40] =  { key = 173, name = "Volume Mute", },
	[41] =  { key = 181, name = "Select Media", },
	[42] =  { key = 3, name = "Control-break processing", },
	[43] =  { key = 221, name = "]}", },
	[44] =  { key = 229, name = "IME PROCESS", },
	[45] =  { key = 4, name = "Middle mouse button", },
	[46] =  { key = 67, name = "C", },
	[47] =  { key = 71, name = "G", },
	[48] =  { key = 75, name = "K", },
	[49] =  { key = 5, name = "X1 mouse button", },
	[50] =  { key = 83, name = "S", },
	[51] =  { key = 87, name = "W", },
	[52] =  { key = 91, name = "Left Windows key", },
	[53] =  { key = 6, name = "X2 mouse button", },
	[54] =  { key = 99, name = "Numpad 3", },
	[55] =  { key = 103, name = "Numpad 7", },
	[56] =  { key = 107, name = "Add", },
	[57] =  { key = 111, name = "Divide", },
	[58] =  { key = 115, name = "F4", },
	[59] =  { key = 119, name = "F8", },
	[60] =  { key = 123, name = "F12", },
	[61] =  { key = 8, name = "BACKSPACE", },
	[62] =  { key = 134, name = "F23", },
	[63] =  { key = 9, name = "TAB", },
	[64] =  { key = 166, name = "Browser Back", },
	[65] =  { key = 174, name = "Volume Down", },
	[66] =  { key = 182, name = "Start Application 1", },
	[67] =  { key = 12, name = "CLEAR", },
	[68] =  { key = 13, name = "ENTER", },
	[69] =  { key = 222, name = "Quote", },
	[70] =  { key = 230, name = "OEM specific", },
	[71] =  { key = 246, name = "Attn", },
	[72] =  { key = 254, name = "Clear", },
	[73] =  { key = 19, name = "PAUSE", },
	[74] =  { key = 20, name = "CAPS LOCK", },
	[75] =  { key = 21, name = "IME Kana mode", },
	[76] =  { key = 23, name = "IME Junja mode", },
	[77] =  { key = 24, name = "IME final mode", },
	[78] =  { key = 25, name = "IME Kanji mode", },
	[79] =  { key = 27, name = "ESC", },
	[80] =  { key = 28, name = "IME convert", },
	[81] =  { key = 29, name = "IME nonconvert", },
	[82] =  { key = 30, name = "IME accept", },
	[83] =  { key = 31, name = "IME mode change request", },
	[84] =  { key = 32, name = "SPACEBAR", },
	[85] =  { key = 34, name = "PAGE DOWN", },
	[86] =  { key = 36, name = "HOME", },
	[87] =  { key = 38, name = "UP ARROW", },
	[88] =  { key = 40, name = "DOWN ARROW", },
	[89] =  { key = 42, name = "PRINT", },
	[90] =  { key = 44, name = "PRINT SCREEN", },
	[91] =  { key = 46, name = "DEL", },
	[92] =  { key = 48, name = "0", },
	[93] =  { key = 50, name = "2", },
	[94] =  { key = 52, name = "4", },
	[95] =  { key = 54, name = "6", },
	[96] =  { key = 56, name = "8", },
	[97] =  { key = 231, name = "VK_Packet", },
	[98] =  { key = 247, name = "CrSel", },
	[99] =  { key = 68, name = "D", },
	[100] =  { key = 72, name = "H", },
	[101] =  { key = 76, name = "L", },
	[102] =  { key = 80, name = "P", },
	[103] =  { key = 84, name = "T", },
	[104] =  { key = 88, name = "X", },
	[105] =  { key = 92, name = "Right Windows key", },
	[106] =  { key = 96, name = "Numpad 0", },
	[107] =  { key = 100, name = "Numpad 4", },
	[108] =  { key = 104, name = "Numpad 8", },
	[109] =  { key = 108, name = "Separator", },
	[110] =  { key = 112, name = "F1", },
	[111] =  { key = 116, name = "F5", },
	[112] =  { key = 120, name = "F9", },
	[113] =  { key = 124, name = "F13", },
	[114] =  { key = 128, name = "F17", },
	[115] =  { key = 144, name = "NUM LOCK", },
	[116] =  { key = 160, name = "Left SHIFT", },
	[117] =  { key = 168, name = "Browser Refresh", },
	[118] =  { key = 176, name = "Next Track", },
	[119] =  { key = 192, name = "`~", },
	[120] =  { key = 248, name = "ExSel", },
	[121] =  { key = -1, name = "None", },
	[122] =  { key = 129, name = "F18", },
	[123] =  { key = 145, name = "SCROLL LOCK", },
	[124] =  { key = 161, name = "Right SHIFT", },
	[125] =  { key = 169, name = "Browser Stop", },
	[126] =  { key = 177, name = "Previous Track", },
	[127] =  { key = 225, name = "OEM specific", },
	[128] =  { key = 249, name = "Erase EOF", },
	[129] =  { key = 65, name = "A", },
	[130] =  { key = 69, name = "E", },
	[131] =  { key = 73, name = "I", },
	[132] =  { key = 77, name = "M", },
	[133] =  { key = 81, name = "Q", },
	[134] =  { key = 85, name = "U", },
	[135] =  { key = 89, name = "Y", },
	[136] =  { key = 93, name = "Applications key", },
	[137] =  { key = 97, name = "Numpad 1", },
	[138] =  { key = 101, name = "Numpad 5", },
	[139] =  { key = 105, name = "Numpad 9", },
	[140] =  { key = 109, name = "Subtract", },
	[141] =  { key = 113, name = "F2", },
	[142] =  { key = 117, name = "F6", },
	[143] =  { key = 121, name = "F10", },
	[144] =  { key = 125, name = "F14", },
	[145] =  { key = 130, name = "F19", },
	[146] =  { key = 162, name = "Left CONTROL", },
	[147] =  { key = 170, name = "Browser Search", },
	[148] =  { key = 178, name = "Stop Media", },
	[149] =  { key = 186, name = ";:", },
	[150] =  { key = 253, name = "PA1", },
	[151] =  { key = 226, name = "VK_OEM_102", },
	[152] =  { key = 252, name = "VK_NONAME", },
	[153] =  { key = 223, name = "", },
	[154] =  { key = 250, name = "Play", },
	[155] =  { key = 219, name = "[{", },
	[156] =  { key = 191, name = "/?", },
	[157] =  { key = 190, name = ".", },
	[158] =  { key = 189, name = "-_", },
	[159] =  { key = 187, name = "=+", },
	[160] =  { key = 183, name = "Start Application 2", },
	[161] =  { key = 179, name = "Play/Pause Media", },
	[162] =  { key = 175, name = "Volume Up", },
	[163] =  { key = 171, name = "Browser Favorites", },
	[164] =  { key = 167, name = "Browser Forward", },
	[165] =  { key = 163, name = "Right CONTROL", },
	[166] =  { key = 135, name = "F24", },
	[167] =  { key = 131, name = "F20", },
	[168] =  { key = 127, name = "F16", },
	[169] =  { key = 95, name = "Computer Sleep", },
	[170] =  { key = 79, name = "O", },
}

local LuaPath = GetLuaModsPath()
local ModulePath = LuaPath .. [[RoseCore\]]
local ModuleSettings = ModulePath .. [[Settings.lua]]
local ImageFolder = ModulePath .. [[Images\]]

local v = table.valid
function RoseCore.valid(...)
	local tbl = {...}
	local size = #tbl
	if size > 0 then
		local count = tbl[1]
		if type(count) == "number" then
			if size == (count + 1) then
				for i = 2, size do
					if not v(tbl[i]) then return false end
				end
				return true
			end
		else
			for i = 1, size do
				if not v(tbl[i]) then return false end
			end
			return true
		end
	end
	return false
end
local valid = RoseCore.valid

function RoseCore.LoadSettings()
	local tbl = FileLoad(ModuleSettings)
	if tbl == nil then
		local file = io.open(ModulePath..'Settings.lua', 'w')
		file:close()
	end
	local function scan(tbl,tbl2,depth)
		depth = depth or 0
		if valid(2,tbl,tbl2) then
			for k,v in pairs(tbl2) do
				if type(v) == "table" then
					if tbl[k] and valid(tbl[k]) then
						tbl[k] = table.merge(tbl[k],scan(tbl[k],v,depth+1))
					else
						tbl[k] = v
					end
				else
					if tbl[k] ~= tbl2[k] then tbl[k] = tbl2[k] end
				end
			end
		end
		return tbl
	end
	RoseCore.Settings = scan(RoseCore.Settings,tbl)
end

local PreviousSave,lastcheck = {},0
function RoseCore.save(force)
	if (force or TimeSince(lastcheck) > 30000) then
		lastcheck = Now()
		local base = table.deepcopy(RoseCore.Settings)
		for k, v in pairs(base) do
			if k == "AstEvHotbar" or k == "AstSavHotbar" or k == "SchEvHotbar" or k == "SchSavHotbar" or k == "WhmEvHotbar" or k == "WhmSavHotbar" then
				for m,n in pairs(v) do
					n.name = nil
					n.index = nil
					n.menu = nil
					n.tooltip = nil
				end
			end
		end
		if not table.deepcompare(base,PreviousSave) then
			local tbl = FileLoad(ModuleSettings)
			if tbl == nil then
				local file = io.open(ModulePath..'Settings.lua', 'w')
				file:close()
			end
			FileSave(ModuleSettings,base)
			PreviousSave = table.deepcopy(base)
		end
	end
end
local save = RoseCore.save

function RoseCore.log(string)
    d("[RoseCore] " .. string)
end

function RoseCore.Init()
    RoseCore.log("Initializing RoseCore v" .. tostring(RoseCore.version))
    ml_gui.ui_mgr:AddMember({ id = "FFXIVMINION##MENU_RoseCore", name = "RoseCore", onClick = function() RoseCore.GUI.open = not RoseCore.GUI.open end, tooltip = "Complete Healing Reactions", texture = ModulePath.."Images\\icon.png"},"FFXIVMINION##MENU_HEADER")
	RoseCore.LoadSettings()
end

function RoseCore.Updater(k,v)
	if RoseCore.Data.UpdateTick == nil then 
		if k == "reactions" and v == "check" then
			io.popen([[start /b powershell -Command "-Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11; $json = (Invoke-WebRequest -Uri https://api.github.com/repos/RoseOfficial/RoseReactions/releases -UseBasicParsing | ConvertFrom-Json); Set-Content -Path ']] ..LuaPath.. [[\RoseCore\Data\RVersion.txt' -Value $json[0].tag_name; stop-process -Id $PID"]]):close()
			RoseCore.Data.UpdateTick = true
			RoseCore.Data.LastCheckVerR = Now()
			RoseCore.Data.CheckVerR = true
		end
		if k == "reactions" and v == "update" then
			io.popen([[start /b powershell -Command "Compress-Archive -Path ']] ..LuaPath.. [[TensorReactions\GeneralReactions', ']] ..LuaPath.. [[TensorReactions\TimelineReactions' -DestinationPath ]] ..LuaPath.. [[\TensorReactions\GeneralReactions\Rose\TensorReactions_$((Get-Date).ToString('MM_dd_HHmm')).zip -Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11; $tag = (Invoke-WebRequest -Uri https://api.github.com/repos/RoseOfficial/RoseReactions/releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name; Invoke-WebRequest https://github.com/RoseOfficial/RoseReactions/releases/download/$tag/TensorReactions.zip -Out ']] ..LuaPath.. [[\TensorReactions\TensorReactions.zip'; Expand-Archive ']] ..LuaPath.. [[\TensorReactions\TensorReactions.zip' -DestinationPath ]] ..LuaPath.. [[ -Force; Remove-Item ']] ..LuaPath.. [[\TensorReactions\TensorReactions.zip' -Force; stop-process -Id $PID"]]):close()
			io.popen([[start /b powershell -Command "Set-Content -Path ']] ..LuaPath.. [[\RoseCore\Data\RStatus.txt' -Value 'Done'; stop-process -Id $PID"]]):close() 
			RoseCore.Data.UpdateTick = true
			RoseCore.Data.UpdateVerR = true
		end
		if k == "core" and v == "check" then
			io.popen([[start /b powershell -Command "-Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11; $json = (Invoke-WebRequest -Uri https://api.github.com/repos/RoseOfficial/RoseCore/releases -UseBasicParsing | ConvertFrom-Json); Set-Content -Path ']] ..LuaPath.. [[\RoseCore\Data\CVersion.txt' -Value $json[0].tag_name; stop-process -Id $PID"]]):close()
			RoseCore.Data.UpdateTick = true
			RoseCore.Data.LastCheckVerC = Now()
			RoseCore.Data.CheckVerC = true
		end
		if k == "core" and v == "update" then
			io.popen([[start /b powershell -Command "-Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11; $tag = (Invoke-WebRequest -Uri https://api.github.com/repos/RoseOfficial/RoseCore/releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name; Invoke-WebRequest https://github.com/RoseOfficial/RoseCore/releases/download/$tag/RoseCore.zip -Out ']] ..LuaPath.. [[\RoseCore\RoseCore.zip'; Expand-Archive ']] ..LuaPath.. [[\RoseCore\RoseCore.zip' -DestinationPath ]] ..LuaPath.. [[ -Force; Remove-Item ']] ..LuaPath.. [[\RoseCore\RoseCore.zip' -Force; stop-process -Id $PID"]]):close()
			io.popen([[start /b powershell -Command "Set-Content -Path ']] ..LuaPath.. [[\RoseCore\Data\CStatus.txt' -Value 'Done'; stop-process -Id $PID"]]):close() 
			RoseCore.Data.UpdateTick = true
			RoseCore.Data.UpdateVerC = true
		end
	end
end

function RoseCore.VersionChecker(folder)
	local file = io.open(folder)
	local output
	if file ~= nil then
		output = file:read()
		file:close()
	end
	if output ~= nil then 
		RoseCore.Settings.ReactionVerLocal = output
		save(true)
	end
end

function RoseCore.IsKeyDown()
	local Key, Shift, Control, Alt, KeyChanged
	for k,v in pairs(RoseCore.KeyCodes) do
		if GUI:IsKeyDown(v.key) then
			Key = v.key
			KeyName = v.name
			KeyChanged = true
		end
	end
	if Key == nil then Key = -1 KeyName = "None" end
	if KeyChanged == nil then KeyChanged = false end
	if GUI:IsKeyDown(16) then
		Shift = true
	else
		Shift = false
	end
	if GUI:IsKeyDown(17) then
		Control = true
	else
		Control = false
	end
	if GUI:IsKeyDown(18) then
		Alt = true
	else
		Alt = false
	end
	return Key, KeyName, Control, Alt, Shift, KeyChanged
end

function RoseCore.KeybindsPressed(a)
	if a.key == nil or a.modifierC == nil or a.modifierA == nil or a.modifierS == nil then return false end
	if not GUI:IsKeyPressed(a.key) then return false end
	if not GUI:IsKeyDown(17) and a.modifierC == true then return false end
	if not GUI:IsKeyDown(18) and a.modifierA == true then return false end
	if not GUI:IsKeyDown(16) and a.modifierS == true then return false end
	return true
end

function RoseCore.DrawCall()
	local WinColR, WinColG, WinColB, WinColT = 135/255, 117/255, 0/255, 255/255
	local BgColR, BgColG, BgColB, BgColT = 0/255, 0/255, 0/255, 255/255
	local OffColR, OffColG, OffColB, OffColT = 100/255, 100/255, 100/255, 255/255
	local gamestate = GetGameState()
    if (gamestate == FFXIV.GAMESTATE.INGAME) and not Player.onlinestatus ~= 15 then
		if (RoseCore.GUI.open) then
			local c = 0
			local WindowSizeX,WindowSizeY = 400,450
			local SubWindowSizeX,SubWindowSizeY = 350,450
			local Style = GUI:GetStyle()
			local windowPadding = Style.windowpadding
			for k,v in pairs(RoseCore.WindowStyle) do if v[4] ~= 0 then c = c + 1 loadstring([[GUI:PushStyleColor(GUI.Col_]]..k..[[, ]]..(v[1]/255)..[[, ]]..(v[2]/255)..[[, ]]..(v[3]/255)..[[, ]]..v[4]..[[)]])() end end
			GUI:SetNextWindowSize(WindowSizeX, WindowSizeY, GUI.SetCond_Always)
			RoseCore.GUI.visible, RoseCore.GUI.open = GUI:Begin("RoseCore v" .. tostring(RoseCore.version), RoseCore.GUI.open, GUI.WindowFlags_NoResize + GUI.WindowFlags_AlwaysUseWindowPadding)
			GUI:SetWindowFontSize(1.05)
			if (RoseCore.GUI.visible) then
				local Tabs = RoseCore.Tabs
				if table.valid(Tabs) then
					if Tabs.General == true then
						GUI:Image(ImageFolder..[[general_on.png]],100,25)
					else
						GUI:Image(ImageFolder..[[general_off.png]],100,25)
					end
					if (GUI:IsItemHovered()) then
						if (GUI:IsMouseClicked(0)) then
							Tabs.General = true
							Tabs.Ast = false
							Tabs.Sch = false
							Tabs.Whm = false
							Tabs.Sge = false
						end
					end
					GUI:SameLine(0,windowPadding.x + 12)
					if Tabs.Ast == true then
						GUI:Image(ImageFolder..[[astrologian_on.png]],50,25)
					else
						GUI:Image(ImageFolder..[[astrologian_off.png]],50,25)
					end
					if (GUI:IsItemHovered()) then
						if (GUI:IsMouseClicked(0)) then
							Tabs.General = false
							Tabs.Ast = true
							Tabs.Sch = false
							Tabs.Whm = false
							Tabs.Sge = false
						end
					end
					GUI:SameLine(0,windowPadding.x + 12)
					if Tabs.Sch == true then
						GUI:Image(ImageFolder..[[scholar_on.png]],50,25)
					else
						GUI:Image(ImageFolder..[[scholar_off.png]],50,25)
					end
					if (GUI:IsItemHovered()) then
						if (GUI:IsMouseClicked(0)) then
							Tabs.General = false
							Tabs.Ast = false
							Tabs.Sch = true
							Tabs.Whm = false
							Tabs.Sge = false
						end
					end
					GUI:SameLine(0,windowPadding.x + 12)
					if Tabs.Whm == true then
						GUI:Image(ImageFolder..[[white_mage_on.png]],50,25)
					else
						GUI:Image(ImageFolder..[[white_mage_off.png]],50,25)
					end
					if (GUI:IsItemHovered()) then
						if (GUI:IsMouseClicked(0)) then
							Tabs.General = false
							Tabs.Ast = false
							Tabs.Sch = false
							Tabs.Whm = true
							Tabs.Sge = false
						end
					end
					GUI:SameLine(0,windowPadding.x + 12)
					if Tabs.Sge == true then
						GUI:Image(ImageFolder..[[sage_on.png]],50,25)
					else
						GUI:Image(ImageFolder..[[sage_off.png]],50,25)
					end
					if (GUI:IsItemHovered()) then
						if (GUI:IsMouseClicked(0)) then
							Tabs.General = false
							Tabs.Ast = false
							Tabs.Sch = false
							Tabs.Whm = false
							Tabs.Sge = true
						end
					end

					-- Tab Contents
					-- General Tab
					if Tabs.General == true then

						-- Autoheal ON/OFF
						-- GUI:Dummy(10,10)
						GUI:SetCursorPos(30,80)
						if RoseCore.Settings.Active == true then
							GUI:Image(ImageFolder..[[autoheal_on.png]],100,75)
							if GUI:IsItemHovered() then
								if GUI:IsItemClicked(0) then
									RoseCore.Settings.Active = not RoseCore.Settings.Active
									save(true)--Necessary if you want to save your settings.
								end
							end
						elseif RoseCore.Settings.Active == false then
							GUI:Image(ImageFolder..[[autoheal_off.png]],100,75)
							if GUI:IsItemHovered() then
								if GUI:IsItemClicked(0) then
									RoseCore.Settings.Active = not RoseCore.Settings.Active
									save(true)--Necessary if you want to save your settings.
								end
							end
						end

						-- Background
						GUI:SetCursorPos(55,65)
						GUI:Image(ImageFolder..[[background.png]],310,310)

						-- Update Group
						local str = "Updates"
						local strX,strY = GUI:CalcTextSize(str)

                        -- Main button
                        GUI:SetWindowFontSize(1.8)
                        if RoseCore.Data.NeedUpdateC == nil and RoseCore.Data.UpdateTick == nil then
                            if GUI:Button(GetString("RoseCore Update##Core")) then
                                RoseCore.Updater("core","check")
                            end
                        end
                        GUI:SetWindowFontSize(1.05)

                        -- Wait for check
                        if RoseCore.Data.CheckVerC == true then
                            GUI:TextColored(1,1,0,1,GetString("Processing..."))
                        end

                        -- Other button pressed
                        if RoseCore.Data.NeedUpdateC == nil and RoseCore.Data.CheckVerC == nil and RoseCore.Data.UpdateTick ~= nil then
                            GUI:TextColored(1,1,0,1,GetString("Processing..."))
                        end

                        -- We need to update
                        if RoseCore.Data.NeedUpdateC == true and RoseCore.Data.UpdateTaskC ~= true  then
                            if GUI:Button(GetString("Update##Core")) then
                                GUI:OpenPopup("Download Core Updates")
                            end
                        end

                        -- We are already on the latest version
                        if RoseCore.Data.NeedUpdateC == false and RoseCore.Data.UpdateTaskC ~= true and RoseCore.Data.CheckVerC == nil then
                            if GUI:Button(GetString("Check Again##Core")) then
                                RoseCore.Updater("core","check")
                            end
                            GUI:SameLine(0,windowPadding.x + 5)
                            GUI:TextColored(1,1,0,1,GetString("No Updates"))
                        end

							--Update Popup
                        if GUI:BeginPopupModal("Download Core Updates", true, GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoResize + GUI.WindowFlags_AlwaysAutoResize) then
                            GUI:PushTextWrapPos(500)
                            GUI:Text(GetString("This will overwrite your current RoseCore.\n"))
                            GUI:TextColored(1,1,0,1,GetString("After the update minion will be reloaded.\n"))
                            GUI:TextColored(1,0,0,1,GetString("Do you still want to update?"))
                            if GUI:Button(GetString("Yes") ,30 ,20) then
                                RoseCore.Data.UpdateTaskC = true
                                RoseCore.Updater("core","update")
                                GUI:CloseCurrentPopup()
                            end
                            GUI:SameLine()
                            if GUI:Button(GetString("No") ,30 ,20) then
                                GUI:CloseCurrentPopup()
                            end
                            GUI:PopTextWrapPos()
                            GUI:EndPopup()
                        end

                        if RoseCore.Data.UpdateTaskC == true then
                            GUI:TextColored(1,1,0,1,GetString("Updating..."))
                        end
                        GUI:SameLine(0,18)

                        -- Social Group
                        GUI:Image(ImageFolder..[[kofi.png]],50,50)
                        if GUI:IsItemHovered() then
                            if GUI:IsItemClicked(0) then
                                io.popen([[cmd /c start "" "]]..RoseCoreLinks.kofi..[["]]):close()
                            end
                        end
                        GUI:SameLine(0,10)
                        GUI:Image(ImageFolder..[[discord.png]],50,45)
                        if GUI:IsItemHovered() then
                            if GUI:IsItemClicked(0) then
                                io.popen([[cmd /c start "" "]]..RoseCoreLinks.discord..[["]]):close()
                            end
                        end
                        GUI:SameLine(0,10)
                        GUI:Image(ImageFolder..[[trello.png]],50,45)
                        if GUI:IsItemHovered() then
                            if GUI:IsItemClicked(0) then
                                io.popen([[cmd /c start "" "]]..RoseCoreLinks.trello..[["]]):close()
                            end
                        end

                        -- Main button
                        GUI:SetCursorPos(8,413)
                        GUI:SetWindowFontSize(1.8)
                        if RoseCore.Data.NeedUpdateR == nil and RoseCore.Data.UpdateTick == nil then
                            if GUI:Button(GetString("Reaction Update##Reactions")) then
                                RoseCore.Updater("reactions","check")
                            end
                        end
                        GUI:SetWindowFontSize(1.05)

                        -- Wait for check
                        if RoseCore.Data.CheckVerR == true then
                            GUI:TextColored(1,1,0,1,GetString("Processing..."))
                        end

                        -- Other button pressed
                        if RoseCore.Data.NeedUpdateR == nil and RoseCore.Data.CheckVerR == nil and RoseCore.Data.UpdateTick ~= nil then
                            GUI:TextColored(1,1,0,1,GetString("Processing..."))
                        end

                        -- We need to update
                        if RoseCore.Data.NeedUpdateR == true and RoseCore.Data.UpdateTaskR ~= true  then
                            if GUI:Button(GetString("Update##Reactions")) then
                                GUI:OpenPopup("Download Reaction Updates")
                            end
                        end

                        -- We are already on the latest version
                        if RoseCore.Data.NeedUpdateR == false and RoseCore.Data.UpdateTaskR ~= true and RoseCore.Data.CheckVerR == nil then
                            if GUI:Button(GetString("Check Again##Reactions")) then
                                RoseCore.Updater("reactions","check")
                            end
                            GUI:SameLine(0,windowPadding.x + 5)
                            GUI:TextColored(1,1,0,1,GetString("No Updates"))
                        end

                        --Update Popup
                        if GUI:BeginPopupModal("Download Reaction Updates", true, GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoResize + GUI.WindowFlags_AlwaysAutoResize) then
                            GUI:PushTextWrapPos(500)
                            GUI:Text(GetString("This will overwrite your current healer reactions.\n"))
                            GUI:Text(GetString("A backup of your files will be created in ..LuaMods/TensorReactions/GeneralReactions/Rose.\n"))
                            GUI:TextColored(1,0,0,1,GetString("Do you still want to update?"))
                            if GUI:Button(GetString("Yes") ,30 ,20) then
                                RoseCore.Data.UpdateTaskR = true
                                RoseCore.Updater("reactions","update")
                                GUI:CloseCurrentPopup()
                            end
                            GUI:SameLine()
                            if GUI:Button(GetString("No") ,30 ,20) then
                                GUI:CloseCurrentPopup()
                            end
                            GUI:PopTextWrapPos()
                            GUI:EndPopup()
                        end

                        if RoseCore.Data.UpdateTaskR == true then
                            GUI:TextColored(1,1,0,1,GetString("Updating..."))
                        end

					-- Ast Tab
					elseif Tabs.Ast == true then
						-- Everywhere Group
						local str = "Everywhere"
						local strX,strY = GUI:CalcTextSize(str)
						GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
						GUI:BeginChild(str.."#Ast", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
						GUI:AlignFirstTextHeightToWidgets()
						GUI:Text(str)
						GUI:PopStyleColor()
						GUI:EndChild()

						if GUI:TreeNode("General##AstEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.AstEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if not string.find(n.name, "(T)", 1, true) and not string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 22 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)
							GUI:TreePop()
						end

						if GUI:TreeNode("Tank##AstEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.AstEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(T)", 1, true) then
									if table.valid(images) then
										if n.index == 6 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider
							local Str = "Tank Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring tank to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.AstEvTankOverhealSingle,changed = GUI:SliderInt("##AstEvTankOverhealSingle", RoseCore.Settings.AstEvTankOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Party##AstEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.AstEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 13 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider (AOE)
							local Str = "AOE Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring AOE to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.AstEvPartyOverhealAOE,changed = GUI:SliderInt("##AstEvPartyOverhealAOE", RoseCore.Settings.AstEvPartyOverhealAOE,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Overheal Slider (ST)
							local Str = "Target Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring target to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.AstEvPartyOverhealSingle,changed = GUI:SliderInt("##AstEvPartyOverhealSingle", RoseCore.Settings.AstEvPartyOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar##AstEverywhere") then
							local count
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.AstEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							for m,n in ipairs(Hotbar) do
								GUI:Separator()
								local StrLength = GUI:CalcTextSize(n.menu)
								GUI:Text(n.menu)
								if (GUI:IsItemHovered()) then
									GUI:SetTooltip("Adds a "..tostring(n.menu).." toggle to the Hotbar")
								end

								GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 180)

								local butx,buty = 160,20
								local r,g,b,t = 100/255, 100/255, 100/255, 204/255
								GUI:BeginGroup()
								GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
								GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)

								local flags = GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoInputs
								GUI:BeginChild("##AstEvHotbar"..tostring(n.name).."Keybind", butx, buty, false, flags)
								GUI:SetWindowFontSize(0.85)
								if (n.keyname == "None") then
									local x,y = GUI:CalcTextSize(n.keyname)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(n.keyname)
								else
									local str = n.keyname
									if n.modifierA then
										str = "ALT + "..str
									end
									if n.modifierC then
										str = "CRTL + "..str
								    end
									if n.modifierS then
										str = "SHIFT + "..str
									end
									local x,y = GUI:CalcTextSize(str)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(str)
								end

								GUI:PopStyleColor()
								GUI:PopStyleVar()
								GUI:EndChild()
								GUI:EndGroup()
								if GUI:IsItemClicked(0) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									GUI:OpenPopup("Set Key".."##AstEvHotbar"..tostring(n.name).."KeybindPopup")
								end
								if GUI:IsItemClicked(1) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									save(true)
								end
								if GUI:IsItemHovered() then
									GUI:SetTooltip("Left Click to add.\n".."Right Click to reset.")
								end

								local WinX, WinY = GUI:GetWindowPos()
								local PopPosX, PopPosY = WindowSizeX/2 + WinX - 60, WindowSizeY/2 + WinY - 15
								GUI:SetWindowPos("Set Key".."##AstEvHotbar"..tostring(n.name).."KeybindPopup", PopPosX, PopPosY, GUI.SetCond_Always)
								GUI:SetNextWindowSize(120, 30, GUI.SetCond_Always)
								local flags = GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoResize
								if GUI:BeginPopupModal("Set Key".."##AstEvHotbar"..tostring(n.name).."KeybindPopup", true, flags) then
									if count == nil then count = 0 end
									if count < 1 then
										GUI:Text(GetString("Press your Key"))
										count = count + 1
									end
									if GUI:IsMouseClicked(1) then
										save(true)
										GUI:CloseCurrentPopup()
									end
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS, changed = RoseCore.IsKeyDown()
									if changed then
										save(true)
										GUI:CloseCurrentPopup()
									end
								GUI:EndPopup()
								end


								GUI:SameLine(0,5)
								local NewStr = string.gsub(n.name, " ", "")
								n.visible,changed = GUI:Checkbox("##AstEvHotbar"..tostring(NewStr).."Visible", n.visible)
								if changed then
									save(true)
								end
								GUI:NextColumn()
							end
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar Customization##AstEv") then
							GUI:Separator()
							local Str = "Enable Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Enable Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.AstEvHotbarEnabled,changed = GUI:Checkbox("##AstEvHotbarEnabled", RoseCore.Settings.AstEvHotbarEnabled)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:Separator()
							local Str = "Lock Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Lock Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.AstEvHotbarLocked,changed = GUI:Checkbox("##AstEvHotbarLocked", RoseCore.Settings.AstEvHotbarLocked)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Enabled
							GUI:Separator()
							local settings = RoseCore.Settings.AstEvHotbarButColOn
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Enabled##AstEvHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Disabled
							GUI:Separator()
							local settings = RoseCore.Settings.AstEvHotbarButColOff
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Disabled##AstEvHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Transparency
							GUI:Separator()
							local Str = "Background Transparency"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 75)
							GUI:PushItemWidth(80)
							RoseCore.Settings.AstEvHotbarBgT,changed = GUI:SliderInt("##AstEvHotbarBgT", RoseCore.Settings.AstEvHotbarBgT,0,255)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Size X
							GUI:Separator()
							local Str = "Button Width"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.AstEvHotbarButtonSizeX,changed = GUI:InputFloat("##AstEvHotbarButtonSizeX", RoseCore.Settings.AstEvHotbarButtonSizeX,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Size Y
							GUI:Separator()
							local Str = "Button Height"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.AstEvHotbarButtonSizeY,changed = GUI:InputFloat("##AstEvHotbarButtonSizeY", RoseCore.Settings.AstEvHotbarButtonSizeY,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Column
							GUI:Separator()
							local Str = "Columns"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.AstEvHotbarColumns,changed = GUI:InputFloat("##AstEvHotbarColumns", RoseCore.Settings.AstEvHotbarColumns,1,1,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()
							GUI:TreePop()
						end

						-- Savage Group
						local str = "Savage"
						local strX,strY = GUI:CalcTextSize(str)
						GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
						GUI:BeginChild(str.."#Ast", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
						GUI:AlignFirstTextHeightToWidgets()
						GUI:Text(str)
						GUI:PopStyleColor()
						GUI:EndChild()

						if GUI:TreeNode("General##AstSavage") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.AstSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if not string.find(n.name, "(T)", 1, true) and not string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 22 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)
							GUI:TreePop()
						end

						if GUI:TreeNode("Tank##AstSavage") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.AstSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(T)", 1, true) then
									if table.valid(images) then
										if n.index == 6 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider
							local Str = "Tank Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring tank to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.AstSavTankOverhealSingle,changed = GUI:SliderInt("##AstSavTankOverhealSingle", RoseCore.Settings.AstSavTankOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
							GUI:Dummy(10,10)
						end

						if GUI:TreeNode("Party##AstSavage") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.AstSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 13 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider (AOE)
							local Str = "AOE Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring AOE to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.AstSavPartyOverhealAOE,changed = GUI:SliderInt("##AstSavPartyOverhealAOE", RoseCore.Settings.AstSavPartyOverhealAOE,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Overheal Slider (ST)
							local Str = "Target Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring target to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.AstSavPartyOverhealSingle,changed = GUI:SliderInt("##AstSavPartyOverhealSingle", RoseCore.Settings.AstSavPartyOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar##AstSavage") then
							local count
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.AstSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							for m,n in ipairs(Hotbar) do
								GUI:Separator()
								local StrLength = GUI:CalcTextSize(n.menu)
								GUI:Text(n.menu)
								if (GUI:IsItemHovered()) then
									GUI:SetTooltip("Adds a "..tostring(n.menu).." toggle to the Hotbar")
								end

								GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 180)

								local butx,buty = 160,20
								local r,g,b,t = 100/255, 100/255, 100/255, 204/255
								GUI:BeginGroup()
								GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
								GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)

								local flags = GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoInputs
								GUI:BeginChild("##AstSavHotbar"..tostring(n.name).."Keybind", butx, buty, false, flags)
								GUI:SetWindowFontSize(0.85)
								if (n.keyname == "None") then
									local x,y = GUI:CalcTextSize(n.keyname)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(n.keyname)
								else
									local str = n.keyname
									if n.modifierA then
										str = "ALT + "..str
									end
									if n.modifierC then
										str = "CRTL + "..str
								    end
									if n.modifierS then
										str = "SHIFT + "..str
									end
									local x,y = GUI:CalcTextSize(str)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(str)
								end

								GUI:PopStyleColor()
								GUI:PopStyleVar()
								GUI:EndChild()
								GUI:EndGroup()
								if GUI:IsItemClicked(0) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									GUI:OpenPopup("Set Key".."##AstSavHotbar"..tostring(n.name).."KeybindPopup")
								end
								if GUI:IsItemClicked(1) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									save(true)
								end
								if GUI:IsItemHovered() then
									GUI:SetTooltip("Left Click to add.\n".."Right Click to reset.")
								end

								local WinX, WinY = GUI:GetWindowPos()
								local PopPosX, PopPosY = WindowSizeX/2 + WinX - 60, WindowSizeY/2 + WinY - 15
								GUI:SetWindowPos("Set Key".."##AstSavHotbar"..tostring(n.name).."KeybindPopup", PopPosX, PopPosY, GUI.SetCond_Always)
								GUI:SetNextWindowSize(120, 30, GUI.SetCond_Always)
								local flags = GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoResize
								if GUI:BeginPopupModal("Set Key".."##AstSavHotbar"..tostring(n.name).."KeybindPopup", true, flags) then
									if count == nil then count = 0 end
									if count < 1 then
										GUI:Text(GetString("Press your Key"))
										count = count + 1
									end
									if GUI:IsMouseClicked(1) then
										save(true)
										GUI:CloseCurrentPopup()
									end
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS, changed = RoseCore.IsKeyDown()
									if changed then
										save(true)
										GUI:CloseCurrentPopup()
									end
								GUI:EndPopup()
								end


								GUI:SameLine(0,5)
								local NewStr = string.gsub(n.name, " ", "")
								n.visible,changed = GUI:Checkbox("##AstSavHotbar"..tostring(NewStr).."Visible", n.visible)
								if changed then
									save(true)
								end
								GUI:NextColumn()
							end
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar Customization##AstSav") then
							GUI:Separator()
							local Str = "Enable Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Enable Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.AstSavHotbarEnabled,changed = GUI:Checkbox("##AstSavHotbarEnabled", RoseCore.Settings.AstSavHotbarEnabled)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:Separator()
							local Str = "Lock Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Lock Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.AstSavHotbarLocked,changed = GUI:Checkbox("##AstSavHotbarLocked", RoseCore.Settings.AstSavHotbarLocked)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Enabled
							GUI:Separator()
							local settings = RoseCore.Settings.AstSavHotbarButColOn
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Enabled##AstSavHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Disabled
							GUI:Separator()
							local settings = RoseCore.Settings.AstSavHotbarButColOff
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Disabled##AstSavHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Transparency
							GUI:Separator()
							local Str = "Background Transparency"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 75)
							GUI:PushItemWidth(80)
							RoseCore.Settings.AstSavHotbarBgT,changed = GUI:SliderInt("##AstSavHotbarBgT", RoseCore.Settings.AstSavHotbarBgT,0,255)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Size X
							GUI:Separator()
							local Str = "Button Width"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.AstSavHotbarButtonSizeX,changed = GUI:InputFloat("##AstSavHotbarButtonSizeX", RoseCore.Settings.AstSavHotbarButtonSizeX,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Size Y
							GUI:Separator()
							local Str = "Button Height"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.AstSavHotbarButtonSizeY,changed = GUI:InputFloat("##AstSavHotbarButtonSizeY", RoseCore.Settings.AstSavHotbarButtonSizeY,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Column
							GUI:Separator()
							local Str = "Columns"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.AstSavHotbarColumns,changed = GUI:InputFloat("##AstSavHotbarColumns", RoseCore.Settings.AstSavHotbarColumns,1,1,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:TreePop()
						end

						-- Fight Specific Group
						--[[local str = "Fight Specific"
						local strX,strY = GUI:CalcTextSize(str)
						GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
						GUI:BeginChild(str.."#SchFightSpecific", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
						GUI:AlignFirstTextHeightToWidgets()
						GUI:Text(str)
						GUI:PopStyleColor()
						GUI:EndChild()]]--

					-- Sch Tab
					elseif Tabs.Sch == true then
						-- Everywhere Group
						local str = "Everywhere"
						local strX,strY = GUI:CalcTextSize(str)
						GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
						GUI:BeginChild(str.."#Sch", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
						GUI:AlignFirstTextHeightToWidgets()
						GUI:Text(str)
						GUI:PopStyleColor()
						GUI:EndChild()

						if GUI:TreeNode("General##SchEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SchEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if not string.find(n.name, "(T)", 1, true) and not string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 24 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)
							GUI:TreePop()
						end

						if GUI:TreeNode("Tank##SchEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SchEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(T)", 1, true) then
									if table.valid(images) then
										if n.index == 6 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider
							local Str = "Tank Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring tank to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.SchEvTankOverhealSingle,changed = GUI:SliderInt("##SchEvTankOverhealSingle", RoseCore.Settings.SchEvTankOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Party##SchEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SchEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 15 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider (AOE)
							local Str = "AOE Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring AOE to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.SchEvPartyOverhealAOE,changed = GUI:SliderInt("##SchEvPartyOverhealAOE", RoseCore.Settings.SchEvPartyOverhealAOE,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Overheal Slider (ST)
							local Str = "Target Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring target to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.SchEvPartyOverhealSingle,changed = GUI:SliderInt("##SchEvPartyOverhealSingle", RoseCore.Settings.SchEvPartyOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar##SchEverywhere") then
							local count
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SchEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							for m,n in ipairs(Hotbar) do
								GUI:Separator()
								local StrLength = GUI:CalcTextSize(n.menu)
								GUI:Text(n.menu)
								if (GUI:IsItemHovered()) then
									GUI:SetTooltip("Adds a "..tostring(n.menu).." toggle to the Hotbar")
								end

								GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 180)

								local butx,buty = 160,20
								local r,g,b,t = 100/255, 100/255, 100/255, 204/255
								GUI:BeginGroup()
								GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
								GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)

								local flags = GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoInputs
								GUI:BeginChild("##SchEvHotbar"..tostring(n.name).."Keybind", butx, buty, false, flags)
								GUI:SetWindowFontSize(0.85)
								if (n.keyname == "None") then
									local x,y = GUI:CalcTextSize(n.keyname)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(n.keyname)
								else
									local str = n.keyname
									if n.modifierA then
										str = "ALT + "..str
									end
									if n.modifierC then
										str = "CRTL + "..str
								    end
									if n.modifierS then
										str = "SHIFT + "..str
									end
									local x,y = GUI:CalcTextSize(str)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(str)
								end

								GUI:PopStyleColor()
								GUI:PopStyleVar()
								GUI:EndChild()
								GUI:EndGroup()
								if GUI:IsItemClicked(0) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									GUI:OpenPopup("Set Key".."##SchEvHotbar"..tostring(n.name).."KeybindPopup")
								end
								if GUI:IsItemClicked(1) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									save(true)
								end
								if GUI:IsItemHovered() then
									GUI:SetTooltip("Left Click to add.\n".."Right Click to reset.")
								end

								local WinX, WinY = GUI:GetWindowPos()
								local PopPosX, PopPosY = WindowSizeX/2 + WinX - 60, WindowSizeY/2 + WinY - 15
								GUI:SetWindowPos("Set Key".."##SchEvHotbar"..tostring(n.name).."KeybindPopup", PopPosX, PopPosY, GUI.SetCond_Always)
								GUI:SetNextWindowSize(120, 30, GUI.SetCond_Always)
								local flags = GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoResize
								if GUI:BeginPopupModal("Set Key".."##SchEvHotbar"..tostring(n.name).."KeybindPopup", true, flags) then
									if count == nil then count = 0 end
									if count < 1 then
										GUI:Text(GetString("Press your Key"))
										count = count + 1
									end
									if GUI:IsMouseClicked(1) then
										save(true)
										GUI:CloseCurrentPopup()
									end
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS, changed = RoseCore.IsKeyDown()
									if changed then
										save(true)
										GUI:CloseCurrentPopup()
									end
								GUI:EndPopup()
								end


								GUI:SameLine(0,5)
								local NewStr = string.gsub(n.name, " ", "")
								n.visible,changed = GUI:Checkbox("##SchEvHotbar"..tostring(NewStr).."Visible", n.visible)
								if changed then
									save(true)
								end
								GUI:NextColumn()
							end
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar Customization##SchEv") then
							GUI:Separator()
							local Str = "Enable Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Enable Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.SchEvHotbarEnabled,changed = GUI:Checkbox("##SchEvHotbarEnabled", RoseCore.Settings.SchEvHotbarEnabled)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:Separator()
							local Str = "Lock Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Lock Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.SchEvHotbarLocked,changed = GUI:Checkbox("##SchEvHotbarLocked", RoseCore.Settings.SchEvHotbarLocked)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Enabled
							GUI:Separator()
							local settings = RoseCore.Settings.SchEvHotbarButColOn
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Enabled##SchEvHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Disabled
							GUI:Separator()
							local settings = RoseCore.Settings.SchEvHotbarButColOff
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Disabled##SchEvHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Transparency
							GUI:Separator()
							local Str = "Background Transparency"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 75)
							GUI:PushItemWidth(80)
							RoseCore.Settings.SchEvHotbarBgT,changed = GUI:SliderInt("##SchEvHotbarBgT", RoseCore.Settings.SchEvHotbarBgT,0,255)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Size X
							GUI:Separator()
							local Str = "Button Width"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.SchEvHotbarButtonSizeX,changed = GUI:InputFloat("##SchEvHotbarButtonSizeX", RoseCore.Settings.SchEvHotbarButtonSizeX,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Size Y
							GUI:Separator()
							local Str = "Button Height"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.SchEvHotbarButtonSizeY,changed = GUI:InputFloat("##SchEvHotbarButtonSizeY", RoseCore.Settings.SchEvHotbarButtonSizeY,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Column
							GUI:Separator()
							local Str = "Columns"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.SchEvHotbarColumns,changed = GUI:InputFloat("##SchEvHotbarColumns", RoseCore.Settings.SchEvHotbarColumns,1,1,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:TreePop()
						end

						-- Savage Group
						local str = "Savage"
						local strX,strY = GUI:CalcTextSize(str)
						GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
						GUI:BeginChild(str.."#Sch", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
						GUI:AlignFirstTextHeightToWidgets()
						GUI:Text(str)
						GUI:PopStyleColor()
						GUI:EndChild()

						if GUI:TreeNode("General##SchSavage") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SchSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if not string.find(n.name, "(T)", 1, true) and not string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 24 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)
							GUI:TreePop()
						end

						if GUI:TreeNode("Tank##SchSavage") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SchSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(T)", 1, true) then
									if table.valid(images) then
										if n.index == 6 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider
							local Str = "Tank Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring tank to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.SchSavTankOverhealSingle,changed = GUI:SliderInt("##SchSavTankOverhealSingle", RoseCore.Settings.SchSavTankOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Party##SchSavage") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SchSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 15 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider (AOE)
							local Str = "AOE Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring AOE to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.SchSavPartyOverhealAOE,changed = GUI:SliderInt("##SchSavPartyOverhealAOE", RoseCore.Settings.SchSavPartyOverhealAOE,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Overheal Slider (ST)
							local Str = "Target Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring target to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.SchSavPartyOverhealSingle,changed = GUI:SliderInt("##SchSavPartyOverhealSingle", RoseCore.Settings.SchSavPartyOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar##SchSavage") then
							local count
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SchSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							for m,n in ipairs(Hotbar) do
								GUI:Separator()
								local StrLength = GUI:CalcTextSize(n.menu)
								GUI:Text(n.menu)
								if (GUI:IsItemHovered()) then
									GUI:SetTooltip("Adds a "..tostring(n.menu).." toggle to the Hotbar")
								end

								GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 180)

								local butx,buty = 160,20
								local r,g,b,t = 100/255, 100/255, 100/255, 204/255
								GUI:BeginGroup()
								GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
								GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)

								local flags = GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoInputs
								GUI:BeginChild("##SchSavHotbar"..tostring(n.name).."Keybind", butx, buty, false, flags)
								GUI:SetWindowFontSize(0.85)
								if (n.keyname == "None") then
									local x,y = GUI:CalcTextSize(n.keyname)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(n.keyname)
								else
									local str = n.keyname
									if n.modifierA then
										str = "ALT + "..str
									end
									if n.modifierC then
										str = "CRTL + "..str
								    end
									if n.modifierS then
										str = "SHIFT + "..str
									end
									local x,y = GUI:CalcTextSize(str)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(str)
								end

								GUI:PopStyleColor()
								GUI:PopStyleVar()
								GUI:EndChild()
								GUI:EndGroup()
								if GUI:IsItemClicked(0) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									GUI:OpenPopup("Set Key".."##SchSavHotbar"..tostring(n.name).."KeybindPopup")
								end
								if GUI:IsItemClicked(1) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									save(true)
								end
								if GUI:IsItemHovered() then
									GUI:SetTooltip("Left Click to add.\n".."Right Click to reset.")
								end

								local WinX, WinY = GUI:GetWindowPos()
								local PopPosX, PopPosY = WindowSizeX/2 + WinX - 60, WindowSizeY/2 + WinY - 15
								GUI:SetWindowPos("Set Key".."##SchSavHotbar"..tostring(n.name).."KeybindPopup", PopPosX, PopPosY, GUI.SetCond_Always)
								GUI:SetNextWindowSize(120, 30, GUI.SetCond_Always)
								local flags = GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoResize
								if GUI:BeginPopupModal("Set Key".."##SchSavHotbar"..tostring(n.name).."KeybindPopup", true, flags) then
									if count == nil then count = 0 end
									if count < 1 then
										GUI:Text(GetString("Press your Key"))
										count = count + 1
									end
									if GUI:IsMouseClicked(1) then
										save(true)
										GUI:CloseCurrentPopup()
									end
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS, changed = RoseCore.IsKeyDown()
									if changed then
										save(true)
										GUI:CloseCurrentPopup()
									end
								GUI:EndPopup()
								end


								GUI:SameLine(0,5)
								local NewStr = string.gsub(n.name, " ", "")
								n.visible,changed = GUI:Checkbox("##SchSavHotbar"..tostring(NewStr).."Visible", n.visible)
								if changed then
									save(true)
								end
								GUI:NextColumn()
							end
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar Customization##SchSav") then
							GUI:Separator()
							local Str = "Enable Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Enable Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.SchSavHotbarEnabled,changed = GUI:Checkbox("##SchSavHotbarEnabled", RoseCore.Settings.SchSavHotbarEnabled)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:Separator()
							local Str = "Lock Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Lock Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.SchSavHotbarLocked,changed = GUI:Checkbox("##SchSavHotbarLocked", RoseCore.Settings.SchSavHotbarLocked)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Enabled
							GUI:Separator()
							local settings = RoseCore.Settings.SchSavHotbarButColOn
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Enabled##SchSavHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Disabled
							GUI:Separator()
							local settings = RoseCore.Settings.SchSavHotbarButColOff
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Disabled##SchSavHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Transparency
							GUI:Separator()
							local Str = "Background Transparency"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 75)
							GUI:PushItemWidth(80)
							RoseCore.Settings.SchSavHotbarBgT,changed = GUI:SliderInt("##SchSavHotbarBgT", RoseCore.Settings.SchSavHotbarBgT,0,255)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Size X
							GUI:Separator()
							local Str = "Button Width"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.SchSavHotbarButtonSizeX,changed = GUI:InputFloat("##SchSavHotbarButtonSizeX", RoseCore.Settings.SchSavHotbarButtonSizeX,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Size Y
							GUI:Separator()
							local Str = "Button Height"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.SchSavHotbarButtonSizeY,changed = GUI:InputFloat("##SchSavHotbarButtonSizeY", RoseCore.Settings.SchSavHotbarButtonSizeY,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Column
							GUI:Separator()
							local Str = "Columns"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.SchSavHotbarColumns,changed = GUI:InputFloat("##SchSavHotbarColumns", RoseCore.Settings.SchSavHotbarColumns,1,1,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:TreePop()
						end

						-- Fight Specific Group
						--[[local str = "Fight Specific"
						local strX,strY = GUI:CalcTextSize(str)
						GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
						GUI:BeginChild(str.."#SchFightSpecific", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
						GUI:AlignFirstTextHeightToWidgets()
						GUI:Text(str)
						GUI:PopStyleColor()
						GUI:EndChild()]]--

					-- Whm Tab
					elseif Tabs.Whm == true then
						-- Everywhere Group
						local str = "Everywhere"
						local strX,strY = GUI:CalcTextSize(str)
						GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
						GUI:BeginChild(str.."#Whm", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
						GUI:AlignFirstTextHeightToWidgets()
						GUI:Text(str)
						GUI:PopStyleColor()
						GUI:EndChild()

						if GUI:TreeNode("General##WhmEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.WhmEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if not string.find(n.name, "(T)", 1, true) and not string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 25 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)
							GUI:TreePop()
						end

						if GUI:TreeNode("Tank##WhmEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.WhmEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(T)", 1, true) then
									if table.valid(images) then
										if n.index == 6 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider
							local Str = "Tank Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring tank to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.WhmEvTankOverhealSingle,changed = GUI:SliderInt("##WhmEvTankOverhealSingle", RoseCore.Settings.WhmEvTankOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Party##WhmEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.WhmEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 15 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider (AOE)
							local Str = "AOE Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring AOE to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.WhmEvPartyOverhealAOE,changed = GUI:SliderInt("##WhmEvPartyOverhealAOE", RoseCore.Settings.WhmEvPartyOverhealAOE,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Overheal Slider (ST)
							local Str = "Target Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring target to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.WhmEvPartyOverhealSingle,changed = GUI:SliderInt("##WhmEvPartyOverhealSingle", RoseCore.Settings.WhmEvPartyOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar##WhmEverywhere") then
							local count
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.WhmEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							for m,n in ipairs(Hotbar) do
								GUI:Separator()
								local StrLength = GUI:CalcTextSize(n.menu)
								GUI:Text(n.menu)
								if (GUI:IsItemHovered()) then
									GUI:SetTooltip("Adds a "..tostring(n.menu).." toggle to the Hotbar")
								end

								GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 180)

								local butx,buty = 160,20
								local r,g,b,t = 100/255, 100/255, 100/255, 204/255
								GUI:BeginGroup()
								GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
								GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)

								local flags = GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoInputs
								GUI:BeginChild("##WhmEvHotbar"..tostring(n.name).."Keybind", butx, buty, false, flags)
								GUI:SetWindowFontSize(0.85)
								if (n.keyname == "None") then
									local x,y = GUI:CalcTextSize(n.keyname)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(n.keyname)
								else
									local str = n.keyname
									if n.modifierA then
										str = "ALT + "..str
									end
									if n.modifierC then
										str = "CRTL + "..str
									end
									if n.modifierS then
										str = "SHIFT + "..str
									end
									local x,y = GUI:CalcTextSize(str)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(str)
								end

								GUI:PopStyleColor()
								GUI:PopStyleVar()
								GUI:EndChild()
								GUI:EndGroup()
								if GUI:IsItemClicked(0) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									GUI:OpenPopup("Set Key".."##WhmEvHotbar"..tostring(n.name).."KeybindPopup")
								end
								if GUI:IsItemClicked(1) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									save(true)
								end
								if GUI:IsItemHovered() then
									GUI:SetTooltip("Left Click to add.\n".."Right Click to reset.")
								end

								local WinX, WinY = GUI:GetWindowPos()
								local PopPosX, PopPosY = WindowSizeX/2 + WinX - 60, WindowSizeY/2 + WinY - 15
								GUI:SetWindowPos("Set Key".."##WhmEvHotbar"..tostring(n.name).."KeybindPopup", PopPosX, PopPosY, GUI.SetCond_Always)
								GUI:SetNextWindowSize(120, 30, GUI.SetCond_Always)
								local flags = GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoResize
								if GUI:BeginPopupModal("Set Key".."##WhmEvHotbar"..tostring(n.name).."KeybindPopup", true, flags) then
									if count == nil then count = 0 end
									if count < 1 then
										GUI:Text(GetString("Press your Key"))
										count = count + 1
									end
									if GUI:IsMouseClicked(1) then
										save(true)
										GUI:CloseCurrentPopup()
									end
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS, changed = RoseCore.IsKeyDown()
									if changed then
										save(true)
										GUI:CloseCurrentPopup()
									end
									GUI:EndPopup()
								end


								GUI:SameLine(0,5)
								local NewStr = string.gsub(n.name, " ", "")
								n.visible,changed = GUI:Checkbox("##WhmEvHotbar"..tostring(NewStr).."Visible", n.visible)
								if changed then
									save(true)
								end
								GUI:NextColumn()
							end
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar Customization##WhmEverywhere") then
							GUI:Separator()
							local Str = "Enable Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Enable Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.WhmEvHotbarEnabled,changed = GUI:Checkbox("##WhmEvHotbarEnabled", RoseCore.Settings.WhmEvHotbarEnabled)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:Separator()
							local Str = "Lock Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Lock Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.WhmEvHotbarLocked,changed = GUI:Checkbox("##WhmEvHotbarLocked", RoseCore.Settings.WhmEvHotbarLocked)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Enabled
							GUI:Separator()
							local settings = RoseCore.Settings.WhmEvHotbarButColOn
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Enabled##WhmEvHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Disabled
							GUI:Separator()
							local settings = RoseCore.Settings.WhmEvHotbarButColOff
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Disabled##WhmEvHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Transparency
							GUI:Separator()
							local Str = "Background Transparency"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 75)
							GUI:PushItemWidth(80)
							RoseCore.Settings.WhmEvHotbarBgT,changed = GUI:SliderInt("##WhmEvHotbarBgT", RoseCore.Settings.WhmEvHotbarBgT,0,255)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Size X
							GUI:Separator()
							local Str = "Button Width"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.WhmEvHotbarButtonSizeX,changed = GUI:InputFloat("##WhmEvHotbarButtonSizeX", RoseCore.Settings.WhmEvHotbarButtonSizeX,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Size Y
							GUI:Separator()
							local Str = "Button Height"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.WhmEvHotbarButtonSizeY,changed = GUI:InputFloat("##WhmEvHotbarButtonSizeY", RoseCore.Settings.WhmEvHotbarButtonSizeY,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Column
							GUI:Separator()
							local Str = "Columns"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.WhmEvHotbarColumns,changed = GUI:InputFloat("##WhmEvHotbarColumns", RoseCore.Settings.WhmEvHotbarColumns,1,1,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:TreePop()
						end

						-- Savage Group
						local str = "Savage"
						local strX,strY = GUI:CalcTextSize(str)
						GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
						GUI:BeginChild(str.."#Whm", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
						GUI:AlignFirstTextHeightToWidgets()
						GUI:Text(str)
						GUI:PopStyleColor()
						GUI:EndChild()

						if GUI:TreeNode("General##WhmSavage") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.WhmSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if not string.find(n.name, "(T)", 1, true) and not string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 23 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)
							GUI:TreePop()
						end

						if GUI:TreeNode("Tank##WhmSavage") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.WhmSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(T)", 1, true) then
									if table.valid(images) then
										if n.index == 6 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider
							local Str = "Tank Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring tank to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.WhmSavTankOverhealSingle,changed = GUI:SliderInt("##WhmSavTankOverhealSingle", RoseCore.Settings.WhmSavTankOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Party##WhmSavage") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.WhmSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(P)", 1, true) then
									if table.valid(images) then
										if n.index == 14 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider (AOE)
							local Str = "AOE Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring AOE to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.WhmSavPartyOverhealAOE,changed = GUI:SliderInt("##WhmSavPartyOverhealAOE", RoseCore.Settings.WhmSavPartyOverhealAOE,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Overheal Slider (ST)
							local Str = "Target Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring target to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.WhmSavPartyOverhealSingle,changed = GUI:SliderInt("##WhmSavPartyOverhealSingle", RoseCore.Settings.WhmSavPartyOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar##WhmSavage") then
							local count
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.WhmSavHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							for m,n in ipairs(Hotbar) do
								GUI:Separator()
								local StrLength = GUI:CalcTextSize(n.menu)
								GUI:Text(n.menu)
								if (GUI:IsItemHovered()) then
									GUI:SetTooltip("Adds a "..tostring(n.menu).." toggle to the Hotbar")
								end

								GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 180)

								local butx,buty = 160,20
								local r,g,b,t = 100/255, 100/255, 100/255, 204/255
								GUI:BeginGroup()
								GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
								GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)

								local flags = GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoInputs
								GUI:BeginChild("##WhmSavHotbar"..tostring(n.name).."Keybind", butx, buty, false, flags)
								GUI:SetWindowFontSize(0.85)
								if (n.keyname == "None") then
									local x,y = GUI:CalcTextSize(n.keyname)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(n.keyname)
								else
									local str = n.keyname
									if n.modifierA then
										str = "ALT + "..str
									end
									if n.modifierC then
										str = "CRTL + "..str
								    end
									if n.modifierS then
										str = "SHIFT + "..str
									end
									local x,y = GUI:CalcTextSize(str)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(str)
								end

								GUI:PopStyleColor()
								GUI:PopStyleVar()
								GUI:EndChild()
								GUI:EndGroup()
								if GUI:IsItemClicked(0) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									GUI:OpenPopup("Set Key".."##WhmSavHotbar"..tostring(n.name).."KeybindPopup")
								end
								if GUI:IsItemClicked(1) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									save(true)
								end
								if GUI:IsItemHovered() then
									GUI:SetTooltip("Left Click to add.\n".."Right Click to reset.")
								end

								local WinX, WinY = GUI:GetWindowPos()
								local PopPosX, PopPosY = WindowSizeX/2 + WinX - 60, WindowSizeY/2 + WinY - 15
								GUI:SetWindowPos("Set Key".."##WhmSavHotbar"..tostring(n.name).."KeybindPopup", PopPosX, PopPosY, GUI.SetCond_Always)
								GUI:SetNextWindowSize(120, 30, GUI.SetCond_Always)
								local flags = GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoResize
								if GUI:BeginPopupModal("Set Key".."##WhmSavHotbar"..tostring(n.name).."KeybindPopup", true, flags) then
									if count == nil then count = 0 end
									if count < 1 then
										GUI:Text(GetString("Press your Key"))
										count = count + 1
									end
									if GUI:IsMouseClicked(1) then
										save(true)
										GUI:CloseCurrentPopup()
									end
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS, changed = RoseCore.IsKeyDown()
									if changed then
										save(true)
										GUI:CloseCurrentPopup()
									end
								GUI:EndPopup()
								end


								GUI:SameLine(0,5)
								local NewStr = string.gsub(n.name, " ", "")
								n.visible,changed = GUI:Checkbox("##WhmSavHotbar"..tostring(NewStr).."Visible", n.visible)
								if changed then
									save(true)
								end
								GUI:NextColumn()
							end
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar Customization##WhmSav") then
							GUI:Separator()
							local Str = "Enable Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Enable Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.WhmSavHotbarEnabled,changed = GUI:Checkbox("##WhmSavHotbarEnabled", RoseCore.Settings.WhmSavHotbarEnabled)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:Separator()
							local Str = "Lock Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Lock Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.WhmSavHotbarLocked,changed = GUI:Checkbox("##WhmSavHotbarLocked", RoseCore.Settings.WhmSavHotbarLocked)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Enabled
							GUI:Separator()
							local settings = RoseCore.Settings.WhmSavHotbarButColOn
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Enabled##WhmSavHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Disabled
							GUI:Separator()
							local settings = RoseCore.Settings.WhmSavHotbarButColOff
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Disabled##WhmSavHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Transparency
							GUI:Separator()
							local Str = "Background Transparency"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 75)
							GUI:PushItemWidth(80)
							RoseCore.Settings.WhmSavHotbarBgT,changed = GUI:SliderInt("##WhmSavHotbarBgT", RoseCore.Settings.WhmSavHotbarBgT,0,255)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Size X
							GUI:Separator()
							local Str = "Button Width"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.WhmSavHotbarButtonSizeX,changed = GUI:InputFloat("##WhmSavHotbarButtonSizeX", RoseCore.Settings.WhmSavHotbarButtonSizeX,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Size Y
							GUI:Separator()
							local Str = "Button Height"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.WhmSavHotbarButtonSizeY,changed = GUI:InputFloat("##WhmSavHotbarButtonSizeY", RoseCore.Settings.WhmSavHotbarButtonSizeY,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Column
							GUI:Separator()
							local Str = "Columns"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.WhmSavHotbarColumns,changed = GUI:InputFloat("##WhmSavHotbarColumns", RoseCore.Settings.WhmSavHotbarColumns,1,1,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()
							GUI:TreePop()
						end

						-- Fight Specific
						--[[local str = "Fight Specific"
						local strX,strY = GUI:CalcTextSize(str)
						GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
						GUI:BeginChild(str.."#SchFightSpecific", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
						GUI:AlignFirstTextHeightToWidgets()
						GUI:Text(str)
						GUI:PopStyleColor()
						GUI:EndChild()]]--

						-- Sge Tab
					elseif Tabs.Sge == true then
						-- Everywhere Group
						local str = "Everywhere"
						local strX,strY = GUI:CalcTextSize(str)
						GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
						GUI:BeginChild(str.."#Sge", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
						GUI:AlignFirstTextHeightToWidgets()
						GUI:Text(str)
						GUI:PopStyleColor()
						GUI:EndChild()

						if GUI:TreeNode("General##SgeEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SgeEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if not string.find(n.name, "(H)", 1, true) and not string.find(n.name, "(D)", 1, true) then
									if table.valid(images) then
										if n.index == 9 then
											GUI:Dummy(10,10)
										end
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)
							GUI:TreePop()
						end

						if GUI:TreeNode("Healing##SgeEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SgeEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(H)", 1, true) then
									if table.valid(images) then
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)

							-- Overheal Slider
							local Str = "Tank Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring tank to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.SgeEvTankOverhealSingle,changed = GUI:SliderInt("##SgeEvTankOverhealSingle", RoseCore.Settings.SgeEvTankOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Overheal Slider (AOE)
							local Str = "AOE Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring AOE to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.SgeEvPartyOverhealAOE,changed = GUI:SliderInt("##SgeEvPartyOverhealAOE", RoseCore.Settings.SgeEvPartyOverhealAOE,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Overheal Slider (ST)
							local Str = "Target Heal Percent"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Heal slider will bring target to X percent of health")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
							GUI:PushItemWidth(200)
							RoseCore.Settings.SgeEvPartyOverhealSingle,changed = GUI:SliderInt("##SgeEvPartyOverhealSingle", RoseCore.Settings.SgeEvPartyOverhealSingle,50,100)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()
							GUI:TreePop()
						end

						if GUI:TreeNode("Damage##SgeEverywhere") then
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SgeEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							GUI:PushItemWidth(100)
							GUI:PopItemWidth()
							local images = FolderList(ImageFolder)
							for m,n in ipairs(Hotbar) do
								if string.find(n.name, "(D)", 1, true) then
									if table.valid(images) then
										if n.bool == true then
											GUI:Image(n.imageon,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										elseif n.bool == false then
											GUI:Image(n.imageoff,ImageSize,ImageSize)
											if GUI:IsItemHovered() then
												GUI:SetTooltip(n.tooltip)
												if GUI:IsItemClicked(0) then
													n.bool = not n.bool
													save(true)--Necessary if you want to save your settings.
												end
											end
										end
										for _,image in pairs(images) do
											GUI:SameLine(0,ImageSpacing)
											if GUI:GetContentRegionAvailWidth() < ImageSize then
												GUI:NewLine()
											end
										end
									end
								end
							end
							GUI:Dummy(10,10)
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar##SgeEverywhere") then
							local count
							local Hotbar = {}
							for k,v in pairs(RoseCore.Settings.SgeEvHotbar) do
								table.insert(Hotbar, v)
							end
							table.sort(Hotbar, function(a,b) return a.index < b.index end)
							for m,n in ipairs(Hotbar) do
								GUI:Separator()
								local StrLength = GUI:CalcTextSize(n.menu)
								GUI:Text(n.menu)
								if (GUI:IsItemHovered()) then
									GUI:SetTooltip("Adds a "..tostring(n.menu).." toggle to the Hotbar")
								end

								GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 180)

								local butx,buty = 160,20
								local r,g,b,t = 100/255, 100/255, 100/255, 204/255
								GUI:BeginGroup()
								GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
								GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)

								local flags = GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoInputs
								GUI:BeginChild("##SgeEvHotbar"..tostring(n.name).."Keybind", butx, buty, false, flags)
								GUI:SetWindowFontSize(0.85)
								if (n.keyname == "None") then
									local x,y = GUI:CalcTextSize(n.keyname)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(n.keyname)
								else
									local str = n.keyname
									if n.modifierA then
										str = "ALT + "..str
									end
									if n.modifierC then
										str = "CRTL + "..str
									end
									if n.modifierS then
										str = "SHIFT + "..str
									end
									local x,y = GUI:CalcTextSize(str)
									GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
									GUI:Text(str)
								end

								GUI:PopStyleColor()
								GUI:PopStyleVar()
								GUI:EndChild()
								GUI:EndGroup()
								if GUI:IsItemClicked(0) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									GUI:OpenPopup("Set Key".."##SgeEvHotbar"..tostring(n.name).."KeybindPopup")
								end
								if GUI:IsItemClicked(1) then
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
									save(true)
								end
								if GUI:IsItemHovered() then
									GUI:SetTooltip("Left Click to add.\n".."Right Click to reset.")
								end

								local WinX, WinY = GUI:GetWindowPos()
								local PopPosX, PopPosY = WindowSizeX/2 + WinX - 60, WindowSizeY/2 + WinY - 15
								GUI:SetWindowPos("Set Key".."##SgeEvHotbar"..tostring(n.name).."KeybindPopup", PopPosX, PopPosY, GUI.SetCond_Always)
								GUI:SetNextWindowSize(120, 30, GUI.SetCond_Always)
								local flags = GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoResize
								if GUI:BeginPopupModal("Set Key".."##SgeEvHotbar"..tostring(n.name).."KeybindPopup", true, flags) then
									if count == nil then count = 0 end
									if count < 1 then
										GUI:Text(GetString("Press your Key"))
										count = count + 1
									end
									if GUI:IsMouseClicked(1) then
										save(true)
										GUI:CloseCurrentPopup()
									end
									n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS, changed = RoseCore.IsKeyDown()
									if changed then
										save(true)
										GUI:CloseCurrentPopup()
									end
									GUI:EndPopup()
								end


								GUI:SameLine(0,5)
								local NewStr = string.gsub(n.name, " ", "")
								n.visible,changed = GUI:Checkbox("##SgeEvHotbar"..tostring(NewStr).."Visible", n.visible)
								if changed then
									save(true)
								end
								GUI:NextColumn()
							end
							GUI:TreePop()
						end

						if GUI:TreeNode("Hotbar Customization##SgeEverywhere") then
							GUI:Separator()
							local Str = "Enable Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Enable Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.SgeEvHotbarEnabled,changed = GUI:Checkbox("##SgeEvHotbarEnabled", RoseCore.Settings.SgeEvHotbarEnabled)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:Separator()
							local Str = "Lock Hotbar"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							if (GUI:IsItemHovered()) then
								GUI:SetTooltip("Lock Hotbar")
							end
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
							RoseCore.Settings.SgeEvHotbarLocked,changed = GUI:Checkbox("##SgeEvHotbarLocked", RoseCore.Settings.SgeEvHotbarLocked)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Enabled
							GUI:Separator()
							local settings = RoseCore.Settings.SgeEvHotbarButColOn
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Enabled##SgeEvHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Disabled
							GUI:Separator()
							local settings = RoseCore.Settings.SgeEvHotbarButColOff
							settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Disabled##SgeEvHotbar",settings.R, settings.G, settings.B, settings.T)
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Transparency
							GUI:Separator()
							local Str = "Background Transparency"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 75)
							GUI:PushItemWidth(80)
							RoseCore.Settings.SgeEvHotbarBgT,changed = GUI:SliderInt("##SgeEvHotbarBgT", RoseCore.Settings.SgeEvHotbarBgT,0,255)
							if changed then
								save(true)
							end
							GUI:PopItemWidth()
							GUI:NextColumn()

							-- Size X
							GUI:Separator()
							local Str = "Button Width"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.SgeEvHotbarButtonSizeX,changed = GUI:InputFloat("##SgeEvHotbarButtonSizeX", RoseCore.Settings.SgeEvHotbarButtonSizeX,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Size Y
							GUI:Separator()
							local Str = "Button Height"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.SgeEvHotbarButtonSizeY,changed = GUI:InputFloat("##SgeEvHotbarButtonSizeY", RoseCore.Settings.SgeEvHotbarButtonSizeY,1,2,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							-- Column
							GUI:Separator()
							local Str = "Columns"
							local StrLength = GUI:CalcTextSize(Str)
							GUI:Text(Str)
							GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
							GUI:PushItemWidth(100)
							RoseCore.Settings.SgeEvHotbarColumns,changed = GUI:InputFloat("##SgeEvHotbarColumns", RoseCore.Settings.SgeEvHotbarColumns,1,1,0)
							GUI:PopItemWidth()
							if changed then
								save(true)
							end
							GUI:NextColumn()

							GUI:TreePop()
						end

						-- Savage Group
						--[[local str = "Savage"
                        local strX,strY = GUI:CalcTextSize(str)
                        GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
                        GUI:BeginChild(str.."#Sge", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
                        GUI:AlignFirstTextHeightToWidgets()
                        GUI:Text(str)
                        GUI:PopStyleColor()
                        GUI:EndChild()

                        if GUI:TreeNode("General##SgeSavage") then
                            local Hotbar = {}
                            for k,v in pairs(RoseCore.Settings.SgeSavHotbar) do
                                table.insert(Hotbar, v)
                            end
                            table.sort(Hotbar, function(a,b) return a.index < b.index end)
                            GUI:PushItemWidth(100)
                            GUI:PopItemWidth()
                            local images = FolderList(ImageFolder)
                            for m,n in ipairs(Hotbar) do
                                if not string.find(n.name, "(T)", 1, true) and not string.find(n.name, "(P)", 1, true) then
                                    if table.valid(images) then
                                        if n.index == 23 then
                                            GUI:Dummy(10,10)
                                        end
                                        if n.bool == true then
                                            GUI:Image(n.imageon,ImageSize,ImageSize)
                                            if GUI:IsItemHovered() then
                                                GUI:SetTooltip(n.tooltip)
                                                if GUI:IsItemClicked(0) then
                                                    n.bool = not n.bool
                                                    save(true)--Necessary if you want to save your settings.
                                                end
                                            end
                                        elseif n.bool == false then
                                            GUI:Image(n.imageoff,ImageSize,ImageSize)
                                            if GUI:IsItemHovered() then
                                                GUI:SetTooltip(n.tooltip)
                                                if GUI:IsItemClicked(0) then
                                                    n.bool = not n.bool
                                                    save(true)--Necessary if you want to save your settings.
                                                end
                                            end
                                        end
                                        for _,image in pairs(images) do
                                            GUI:SameLine(0,ImageSpacing)
                                            if GUI:GetContentRegionAvailWidth() < ImageSize then
                                                GUI:NewLine()
                                            end
                                        end
                                    end
                                end
                            end
                            GUI:Dummy(10,10)
                            GUI:TreePop()
                        end

                        if GUI:TreeNode("Tank##SgeSavage") then
                            local Hotbar = {}
                            for k,v in pairs(RoseCore.Settings.SgeSavHotbar) do
                                table.insert(Hotbar, v)
                            end
                            table.sort(Hotbar, function(a,b) return a.index < b.index end)
                            GUI:PushItemWidth(100)
                            GUI:PopItemWidth()
                            local images = FolderList(ImageFolder)
                            for m,n in ipairs(Hotbar) do
                                if string.find(n.name, "(T)", 1, true) then
                                    if table.valid(images) then
                                        if n.index == 6 then
                                            GUI:Dummy(10,10)
                                        end
                                        if n.bool == true then
                                            GUI:Image(n.imageon,ImageSize,ImageSize)
                                            if GUI:IsItemHovered() then
                                                GUI:SetTooltip(n.tooltip)
                                                if GUI:IsItemClicked(0) then
                                                    n.bool = not n.bool
                                                    save(true)--Necessary if you want to save your settings.
                                                end
                                            end
                                        elseif n.bool == false then
                                            GUI:Image(n.imageoff,ImageSize,ImageSize)
                                            if GUI:IsItemHovered() then
                                                GUI:SetTooltip(n.tooltip)
                                                if GUI:IsItemClicked(0) then
                                                    n.bool = not n.bool
                                                    save(true)--Necessary if you want to save your settings.
                                                end
                                            end
                                        end
                                        for _,image in pairs(images) do
                                            GUI:SameLine(0,ImageSpacing)
                                            if GUI:GetContentRegionAvailWidth() < ImageSize then
                                                GUI:NewLine()
                                            end
                                        end
                                    end
                                end
                            end
                            GUI:Dummy(10,10)

                            -- Overheal Slider
                            local Str = "Tank Heal Percent"
                            local StrLength = GUI:CalcTextSize(Str)
                            GUI:Text(Str)
                            if (GUI:IsItemHovered()) then
                                GUI:SetTooltip("Heal slider will bring tank to X percent of health")
                            end
                            GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
                            GUI:PushItemWidth(200)
                            RoseCore.Settings.SgeSavTankOverhealSingle,changed = GUI:SliderInt("##SgeSavTankOverhealSingle", RoseCore.Settings.SgeSavTankOverhealSingle,50,100)
                            if changed then
                                save(true)
                            end
                            GUI:PopItemWidth()
                            GUI:NextColumn()
                            GUI:TreePop()
                        end

                        if GUI:TreeNode("Party##SgeSavage") then
                            local Hotbar = {}
                            for k,v in pairs(RoseCore.Settings.SgeSavHotbar) do
                                table.insert(Hotbar, v)
                            end
                            table.sort(Hotbar, function(a,b) return a.index < b.index end)
                            GUI:PushItemWidth(100)
                            GUI:PopItemWidth()
                            local images = FolderList(ImageFolder)
                            for m,n in ipairs(Hotbar) do
                                if string.find(n.name, "(P)", 1, true) then
                                    if table.valid(images) then
                                        if n.index == 14 then
                                            GUI:Dummy(10,10)
                                        end
                                        if n.bool == true then
                                            GUI:Image(n.imageon,ImageSize,ImageSize)
                                            if GUI:IsItemHovered() then
                                                GUI:SetTooltip(n.tooltip)
                                                if GUI:IsItemClicked(0) then
                                                    n.bool = not n.bool
                                                    save(true)--Necessary if you want to save your settings.
                                                end
                                            end
                                        elseif n.bool == false then
                                            GUI:Image(n.imageoff,ImageSize,ImageSize)
                                            if GUI:IsItemHovered() then
                                                GUI:SetTooltip(n.tooltip)
                                                if GUI:IsItemClicked(0) then
                                                    n.bool = not n.bool
                                                    save(true)--Necessary if you want to save your settings.
                                                end
                                            end
                                        end
                                        for _,image in pairs(images) do
                                            GUI:SameLine(0,ImageSpacing)
                                            if GUI:GetContentRegionAvailWidth() < ImageSize then
                                                GUI:NewLine()
                                            end
                                        end
                                    end
                                end
                            end
                            GUI:Dummy(10,10)

                            -- Overheal Slider (AOE)
                            local Str = "AOE Heal Percent"
                            local StrLength = GUI:CalcTextSize(Str)
                            GUI:Text(Str)
                            if (GUI:IsItemHovered()) then
                                GUI:SetTooltip("Heal slider will bring AOE to X percent of health")
                            end
                            GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
                            GUI:PushItemWidth(200)
                            RoseCore.Settings.SgeSavPartyOverhealAOE,changed = GUI:SliderInt("##SgeSavPartyOverhealAOE", RoseCore.Settings.SgeSavPartyOverhealAOE,50,100)
                            if changed then
                                save(true)
                            end
                            GUI:PopItemWidth()
                            GUI:NextColumn()

                            -- Overheal Slider (ST)
                            local Str = "Target Heal Percent"
                            local StrLength = GUI:CalcTextSize(Str)
                            GUI:Text(Str)
                            if (GUI:IsItemHovered()) then
                                GUI:SetTooltip("Heal slider will bring target to X percent of health")
                            end
                            GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 195)
                            GUI:PushItemWidth(200)
                            RoseCore.Settings.SgeSavPartyOverhealSingle,changed = GUI:SliderInt("##SgeSavPartyOverhealSingle", RoseCore.Settings.SgeSavPartyOverhealSingle,50,100)
                            if changed then
                                save(true)
                            end
                            GUI:PopItemWidth()
                            GUI:NextColumn()
                            GUI:TreePop()
                        end

                        if GUI:TreeNode("Hotbar##SgeSavage") then
                            local count
                            local Hotbar = {}
                            for k,v in pairs(RoseCore.Settings.SgeSavHotbar) do
                                table.insert(Hotbar, v)
                            end
                            table.sort(Hotbar, function(a,b) return a.index < b.index end)
                            for m,n in ipairs(Hotbar) do
                                GUI:Separator()
                                local StrLength = GUI:CalcTextSize(n.menu)
                                GUI:Text(n.menu)
                                if (GUI:IsItemHovered()) then
                                    GUI:SetTooltip("Adds a "..tostring(n.menu).." toggle to the Hotbar")
                                end

                                GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 180)

                                local butx,buty = 160,20
                                local r,g,b,t = 100/255, 100/255, 100/255, 204/255
                                GUI:BeginGroup()
                                GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
                                GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)

                                local flags = GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoInputs
                                GUI:BeginChild("##SgeSavHotbar"..tostring(n.name).."Keybind", butx, buty, false, flags)
                                GUI:SetWindowFontSize(0.85)
                                if (n.keyname == "None") then
                                    local x,y = GUI:CalcTextSize(n.keyname)
                                    GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
                                    GUI:Text(n.keyname)
                                else
                                    local str = n.keyname
                                    if n.modifierA then
                                        str = "ALT + "..str
                                    end
                                    if n.modifierC then
                                        str = "CRTL + "..str
                                    end
                                    if n.modifierS then
                                        str = "SHIFT + "..str
                                    end
                                    local x,y = GUI:CalcTextSize(str)
                                    GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
                                    GUI:Text(str)
                                end

                                GUI:PopStyleColor()
                                GUI:PopStyleVar()
                                GUI:EndChild()
                                GUI:EndGroup()
                                if GUI:IsItemClicked(0) then
                                    n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
                                    GUI:OpenPopup("Set Key".."##SgeSavHotbar"..tostring(n.name).."KeybindPopup")
                                end
                                if GUI:IsItemClicked(1) then
                                    n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS = -1, "None", false, false, false
                                    save(true)
                                end
                                if GUI:IsItemHovered() then
                                    GUI:SetTooltip("Left Click to add.\n".."Right Click to reset.")
                                end

                                local WinX, WinY = GUI:GetWindowPos()
                                local PopPosX, PopPosY = WindowSizeX/2 + WinX - 60, WindowSizeY/2 + WinY - 15
                                GUI:SetWindowPos("Set Key".."##SgeSavHotbar"..tostring(n.name).."KeybindPopup", PopPosX, PopPosY, GUI.SetCond_Always)
                                GUI:SetNextWindowSize(120, 30, GUI.SetCond_Always)
                                local flags = GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoResize
                                if GUI:BeginPopupModal("Set Key".."##SgeSavHotbar"..tostring(n.name).."KeybindPopup", true, flags) then
                                    if count == nil then count = 0 end
                                    if count < 1 then
                                        GUI:Text(GetString("Press your Key"))
                                        count = count + 1
                                    end
                                    if GUI:IsMouseClicked(1) then
                                        save(true)
                                        GUI:CloseCurrentPopup()
                                    end
                                    n.key, n.keyname, n.modifierC, n.modifierA, n.modifierS, changed = RoseCore.IsKeyDown()
                                    if changed then
                                        save(true)
                                        GUI:CloseCurrentPopup()
                                    end
                                    GUI:EndPopup()
                                end


                                GUI:SameLine(0,5)
                                local NewStr = string.gsub(n.name, " ", "")
                                n.visible,changed = GUI:Checkbox("##SgeSavHotbar"..tostring(NewStr).."Visible", n.visible)
                                if changed then
                                    save(true)
                                end
                                GUI:NextColumn()
                            end
                            GUI:TreePop()
                        end

                        if GUI:TreeNode("Hotbar Customization##SgeSav") then
                            GUI:Separator()
                            local Str = "Enable Hotbar"
                            local StrLength = GUI:CalcTextSize(Str)
                            GUI:Text(Str)
                            if (GUI:IsItemHovered()) then
                                GUI:SetTooltip("Enable Hotbar")
                            end
                            GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
                            RoseCore.Settings.SgeSavHotbarEnabled,changed = GUI:Checkbox("##SgeSavHotbarEnabled", RoseCore.Settings.SgeSavHotbarEnabled)
                            if changed then
                                save(true)
                            end
                            GUI:NextColumn()

                            GUI:Separator()
                            local Str = "Lock Hotbar"
                            local StrLength = GUI:CalcTextSize(Str)
                            GUI:Text(Str)
                            if (GUI:IsItemHovered()) then
                                GUI:SetTooltip("Lock Hotbar")
                            end
                            GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 15)
                            RoseCore.Settings.SgeSavHotbarLocked,changed = GUI:Checkbox("##SgeSavHotbarLocked", RoseCore.Settings.SgeSavHotbarLocked)
                            if changed then
                                save(true)
                            end
                            GUI:NextColumn()

                            -- Enabled
                            GUI:Separator()
                            local settings = RoseCore.Settings.SgeSavHotbarButColOn
                            settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Enabled##SgeSavHotbar",settings.R, settings.G, settings.B, settings.T)
                            if changed then
                                save(true)
                            end
                            GUI:NextColumn()

                            -- Disabled
                            GUI:Separator()
                            local settings = RoseCore.Settings.SgeSavHotbarButColOff
                            settings.R,settings.G,settings.B,settings.T,changed = GUI:ColorEdit4("Disabled##SgeSavHotbar",settings.R, settings.G, settings.B, settings.T)
                            if changed then
                                save(true)
                            end
                            GUI:NextColumn()

                            -- Transparency
                            GUI:Separator()
                            local Str = "Background Transparency"
                            local StrLength = GUI:CalcTextSize(Str)
                            GUI:Text(Str)
                            GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 75)
                            GUI:PushItemWidth(80)
                            RoseCore.Settings.SgeSavHotbarBgT,changed = GUI:SliderInt("##SgeSavHotbarBgT", RoseCore.Settings.SgeSavHotbarBgT,0,255)
                            if changed then
                                save(true)
                            end
                            GUI:PopItemWidth()
                            GUI:NextColumn()

                            -- Size X
                            GUI:Separator()
                            local Str = "Button Width"
                            local StrLength = GUI:CalcTextSize(Str)
                            GUI:Text(Str)
                            GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
                            GUI:PushItemWidth(100)
                            RoseCore.Settings.SgeSavHotbarButtonSizeX,changed = GUI:InputFloat("##SgeSavHotbarButtonSizeX", RoseCore.Settings.SgeSavHotbarButtonSizeX,1,2,0)
                            GUI:PopItemWidth()
                            if changed then
                                save(true)
                            end
                            GUI:NextColumn()

                            -- Size Y
                            GUI:Separator()
                            local Str = "Button Height"
                            local StrLength = GUI:CalcTextSize(Str)
                            GUI:Text(Str)
                            GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
                            GUI:PushItemWidth(100)
                            RoseCore.Settings.SgeSavHotbarButtonSizeY,changed = GUI:InputFloat("##SgeSavHotbarButtonSizeY", RoseCore.Settings.SgeSavHotbarButtonSizeY,1,2,0)
                            GUI:PopItemWidth()
                            if changed then
                                save(true)
                            end
                            GUI:NextColumn()

                            -- Column
                            GUI:Separator()
                            local Str = "Columns"
                            local StrLength = GUI:CalcTextSize(Str)
                            GUI:Text(Str)
                            GUI:SameLine(0,SubWindowSizeX - windowPadding.x - StrLength - 95)
                            GUI:PushItemWidth(100)
                            RoseCore.Settings.SgeSavHotbarColumns,changed = GUI:InputFloat("##SgeSavHotbarColumns", RoseCore.Settings.SgeSavHotbarColumns,1,1,0)
                            GUI:PopItemWidth()
                            if changed then
                                save(true)
                            end
                            GUI:NextColumn()
                            GUI:TreePop()
                        end]]

						-- Fight Specific
						--[[local str = "Fight Specific"
                        local strX,strY = GUI:CalcTextSize(str)
                        GUI:PushStyleColor(GUI.Col_ChildWindowBg, WinColR, WinColG, WinColB, WinColT)
                        GUI:BeginChild(str.."#SchFightSpecific", WindowSizeX - (windowPadding.x * 2) - 8, GUI:GetFrameHeight() + (windowPadding.y * 2) ,true, GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoMove + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoInputs)
                        GUI:AlignFirstTextHeightToWidgets()
                        GUI:Text(str)
                        GUI:PopStyleColor()
                        GUI:EndChild()]]--
					end
				end
			end
		GUI:PopStyleColor(c)
		GUI:End()
		end
		
		--Hotbar
		if TensorCore then
			local GeneralProfile = TensorCore.API.TensorReactions.getGeneralReactionProfileName()

			-- AST
			if (Player.Job == 33) then
				if RoseCore.Settings.AstEvHotbarEnabled then
					if GeneralProfile ~= nil and string.find(GeneralProfile, "Everywhere", 1, true) and string.find(GeneralProfile, "AST", 1, true) then
						GUI:SetNextWindowSize(200,200,GUI.SetCond_FirstUseEver)
						GUI:PushStyleColor(GUI.Col_WindowBg, BgColR, BgColG, BgColB, RoseCore.Settings.AstEvHotbarBgT/255)
						GUI:Begin("RoseAstEvHotbar", true, (function() if RoseCore.Settings.AstEvHotbarLocked then
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoMove
						else
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize
						end end)())
						GUI:PopStyleColor(1)
						local Hotbar = {}
						for m,n in pairs(RoseCore.Settings.AstEvHotbar) do
							if n.visible then
								table.insert(Hotbar, n)
							end
						end
						table.sort(Hotbar, function(a,b) return a.index < b.index end)
						local count
						if count == nil then count = 0 end
						for k,v in pairs(Hotbar) do
							local settingsOn = RoseCore.Settings.AstEvHotbarButColOn
							local settingsOff = RoseCore.Settings.AstEvHotbarButColOff
							local r,g,b,t = (function() if v.bool == true then return settingsOn.R, settingsOn.G, settingsOn.B, settingsOn.T else return settingsOff.R, settingsOff.G, settingsOff.B, settingsOff.T end end)()
							local butx,buty = RoseCore.Settings.AstEvHotbarButtonSizeX,RoseCore.Settings.AstEvHotbarButtonSizeY
							GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
							GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)
							if count % RoseCore.Settings.AstEvHotbarColumns ~= 0 then GUI:SameLine(0,5) end
							GUI:BeginChild("##AstEvButton"..tostring(k), butx, buty, false, GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse)
							count = count + 1
							local x,y = GUI:CalcTextSize(v.name)
							GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
							GUI:Text(v.name)
							GUI:PopStyleColor()
							GUI:PopStyleVar()
							GUI:EndChild()
							if GUI:IsItemClicked(0) then
								v.bool = not v.bool
								save(true)
							end
							if RoseCore.KeybindsPressed(v) then
								v.bool = not v.bool
								save(true)
							end
						end
						GUI:End()
					end
				end
				if RoseCore.Settings.AstSavHotbarEnabled then
					if GeneralProfile ~= nil and string.find(GeneralProfile, "Savage", 1, true) and string.find(GeneralProfile, "AST", 1, true) then
						GUI:SetNextWindowSize(200,200,GUI.SetCond_FirstUseEver)
						GUI:PushStyleColor(GUI.Col_WindowBg, BgColR, BgColG, BgColB, RoseCore.Settings.AstSavHotbarBgT/255)
						GUI:Begin("RoseAstSavHotbar", true, (function() if RoseCore.Settings.AstSavHotbarLocked then
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoMove
						else
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize
						end end)())
						GUI:PopStyleColor(1)
						local Hotbar = {}
						for m,n in pairs(RoseCore.Settings.AstSavHotbar) do
							if n.visible then
								table.insert(Hotbar, n)
							end
						end
						table.sort(Hotbar, function(a,b) return a.index < b.index end)
						local count
						if count == nil then count = 0 end
						for k,v in pairs(Hotbar) do
							local settingsOn = RoseCore.Settings.AstSavHotbarButColOn
							local settingsOff = RoseCore.Settings.AstSavHotbarButColOff
							local r,g,b,t = (function() if v.bool == true then return settingsOn.R, settingsOn.G, settingsOn.B, settingsOn.T else return settingsOff.R, settingsOff.G, settingsOff.B, settingsOff.T end end)()
							local butx,buty = RoseCore.Settings.AstSavHotbarButtonSizeX,RoseCore.Settings.AstSavHotbarButtonSizeY
							GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
							GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)
							if count % RoseCore.Settings.AstSavHotbarColumns ~= 0 then GUI:SameLine(0,5) end
							GUI:BeginChild("##AstSavButton"..tostring(k), butx, buty, false, GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse)
							count = count + 1
							local x,y = GUI:CalcTextSize(v.name)
							GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
							GUI:Text(v.name)
							GUI:PopStyleColor()
							GUI:PopStyleVar()
							GUI:EndChild()
							if GUI:IsItemClicked(0) then
								v.bool = not v.bool
								save(true)
							end
							if RoseCore.KeybindsPressed(v) then
								v.bool = not v.bool
								save(true)
							end
						end
						GUI:End()
					end
				end
			end

			--SCH
			if (Player.Job == 28 or Player.Job == 26) then
				if RoseCore.Settings.SchEvHotbarEnabled then
					if GeneralProfile ~= nil and string.find(GeneralProfile, "Everywhere", 1, true) and string.find(GeneralProfile, "SCH", 1, true) then
						GUI:SetNextWindowSize(200,200,GUI.SetCond_FirstUseEver)
						GUI:PushStyleColor(GUI.Col_WindowBg, BgColR, BgColG, BgColB, RoseCore.Settings.SchEvHotbarBgT/255)
						GUI:Begin("RoseSchEvHotbar", true, (function() if RoseCore.Settings.SchEvHotbarLocked then
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoMove
						else
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize
						end end)())
						GUI:PopStyleColor(1)
						local Hotbar = {}
						for m,n in pairs(RoseCore.Settings.SchEvHotbar) do
							if n.visible then
								table.insert(Hotbar, n)
							end
						end
						table.sort(Hotbar, function(a,b) return a.index < b.index end)
						local count
						if count == nil then count = 0 end
						for k,v in pairs(Hotbar) do
							local settingsOn = RoseCore.Settings.SchEvHotbarButColOn
							local settingsOff = RoseCore.Settings.SchEvHotbarButColOff
							local r,g,b,t = (function() if v.bool == true then return settingsOn.R, settingsOn.G, settingsOn.B, settingsOn.T else return settingsOff.R, settingsOff.G, settingsOff.B, settingsOff.T end end)()
							local butx,buty = RoseCore.Settings.SchEvHotbarButtonSizeX,RoseCore.Settings.SchEvHotbarButtonSizeY
							GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
							GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)
							if count % RoseCore.Settings.SchEvHotbarColumns ~= 0 then GUI:SameLine(0,5) end
							GUI:BeginChild("##SchEvButton"..tostring(k), butx, buty, false, GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse)
							count = count + 1
							local x,y = GUI:CalcTextSize(v.name)
							GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
							GUI:Text(v.name)
							GUI:PopStyleColor()
							GUI:PopStyleVar()
							GUI:EndChild()
							if GUI:IsItemClicked(0) then
								v.bool = not v.bool
								save(true)
							end
							if RoseCore.KeybindsPressed(v) then
								v.bool = not v.bool
								save(true)
							end
						end
						GUI:End()
					end
				end
				if RoseCore.Settings.SchSavHotbarEnabled then
					if GeneralProfile ~= nil and string.find(GeneralProfile, "Savage", 1, true) and string.find(GeneralProfile, "SCH", 1, true) then
						GUI:SetNextWindowSize(200,200,GUI.SetCond_FirstUseEver)
						GUI:PushStyleColor(GUI.Col_WindowBg, BgColR, BgColG, BgColB, RoseCore.Settings.SchSavHotbarBgT/255)
						GUI:Begin("RoseSchSavHotbar", true, (function() if RoseCore.Settings.SchSavHotbarLocked then
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoMove
						else
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize
						end end)())
						GUI:PopStyleColor(1)
						local Hotbar = {}
						for m,n in pairs(RoseCore.Settings.SchSavHotbar) do
							if n.visible then
								table.insert(Hotbar, n)
							end
						end
						table.sort(Hotbar, function(a,b) return a.index < b.index end)
						local count
						if count == nil then count = 0 end
						for k,v in pairs(Hotbar) do
							local settingsOn = RoseCore.Settings.SchSavHotbarButColOn
							local settingsOff = RoseCore.Settings.SchSavHotbarButColOff
							local r,g,b,t = (function() if v.bool == true then return settingsOn.R, settingsOn.G, settingsOn.B, settingsOn.T else return settingsOff.R, settingsOff.G, settingsOff.B, settingsOff.T end end)()
							local butx,buty = RoseCore.Settings.SchSavHotbarButtonSizeX,RoseCore.Settings.SchSavHotbarButtonSizeY
							GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
							GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)
							if count % RoseCore.Settings.SchSavHotbarColumns ~= 0 then GUI:SameLine(0,5) end
							GUI:BeginChild("##SchSavButton"..tostring(k), butx, buty, false, GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse)
							count = count + 1
							local x,y = GUI:CalcTextSize(v.name)
							GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
							GUI:Text(v.name)
							GUI:PopStyleColor()
							GUI:PopStyleVar()
							GUI:EndChild()
							if GUI:IsItemClicked(0) then
								v.bool = not v.bool
								save(true)
							end
							if RoseCore.KeybindsPressed(v) then
								v.bool = not v.bool
								save(true)
							end
						end
						GUI:End()
					end
				end
			end

			--WHM
			if (Player.Job == 24 or Player.Job == 6) then
				if RoseCore.Settings.WhmEvHotbarEnabled then
					if GeneralProfile ~= nil and string.find(GeneralProfile, "Everywhere", 1, true) and string.find(GeneralProfile, "WHM", 1, true) then
						GUI:SetNextWindowSize(200,200,GUI.SetCond_FirstUseEver)
						GUI:PushStyleColor(GUI.Col_WindowBg, BgColR, BgColG, BgColB, RoseCore.Settings.WhmEvHotbarBgT/255)
						GUI:Begin("RoseWhmEvHotbar", true, (function() if RoseCore.Settings.WhmEvHotbarLocked then
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoMove
						else
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize
						end end)())
						GUI:PopStyleColor(1)
						local Hotbar = {}
						for m,n in pairs(RoseCore.Settings.WhmEvHotbar) do
							if n.visible then
								table.insert(Hotbar, n)
							end
						end
						table.sort(Hotbar, function(a,b) return a.index < b.index end)
						local count
						if count == nil then count = 0 end
						for k,v in pairs(Hotbar) do
							local settingsOn = RoseCore.Settings.WhmEvHotbarButColOn
							local settingsOff = RoseCore.Settings.WhmEvHotbarButColOff
							local r,g,b,t = (function() if v.bool == true then return settingsOn.R, settingsOn.G, settingsOn.B, settingsOn.T else return settingsOff.R, settingsOff.G, settingsOff.B, settingsOff.T end end)()
							local butx,buty = RoseCore.Settings.WhmEvHotbarButtonSizeX,RoseCore.Settings.WhmEvHotbarButtonSizeY
							GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
							GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)
							if count % RoseCore.Settings.WhmEvHotbarColumns ~= 0 then GUI:SameLine(0,5) end
							GUI:BeginChild("##WhmEvButton"..tostring(k), butx, buty, false, GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse)
							count = count + 1
							local x,y = GUI:CalcTextSize(v.name)
							GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
							GUI:Text(v.name)
							GUI:PopStyleColor()
							GUI:PopStyleVar()
							GUI:EndChild()
							if GUI:IsItemClicked(0) then
								v.bool = not v.bool
								save(true)
							end
							if RoseCore.KeybindsPressed(v) then
								v.bool = not v.bool
								save(true)
							end
						end
						GUI:End()
					end
				end
				if RoseCore.Settings.WhmSavHotbarEnabled then
					if GeneralProfile ~= nil and string.find(GeneralProfile, "Savage", 1, true) and string.find(GeneralProfile, "WHM", 1, true) then
						GUI:SetNextWindowSize(200,200,GUI.SetCond_FirstUseEver)
						GUI:PushStyleColor(GUI.Col_WindowBg, BgColR, BgColG, BgColB, RoseCore.Settings.WhmSavHotbarBgT/255)
						GUI:Begin("RoseWhmSavHotbar", true, (function() if RoseCore.Settings.WhmSavHotbarLocked then
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoMove
						else
							return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize
						end end)())
						GUI:PopStyleColor(1)
						local Hotbar = {}
						for m,n in pairs(RoseCore.Settings.WhmSavHotbar) do
							if n.visible then
								table.insert(Hotbar, n)
							end
						end
						table.sort(Hotbar, function(a,b) return a.index < b.index end)
						local count
						if count == nil then count = 0 end
						for k,v in pairs(Hotbar) do
							local settingsOn = RoseCore.Settings.WhmSavHotbarButColOn
							local settingsOff = RoseCore.Settings.WhmSavHotbarButColOff
							local r,g,b,t = (function() if v.bool == true then return settingsOn.R, settingsOn.G, settingsOn.B, settingsOn.T else return settingsOff.R, settingsOff.G, settingsOff.B, settingsOff.T end end)()
							local butx,buty = RoseCore.Settings.WhmSavHotbarButtonSizeX,RoseCore.Settings.WhmSavHotbarButtonSizeY
							GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
							GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)
							if count % RoseCore.Settings.WhmSavHotbarColumns ~= 0 then GUI:SameLine(0,5) end
							GUI:BeginChild("##WhmSavButton"..tostring(k), butx, buty, false, GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse)
							count = count + 1
							local x,y = GUI:CalcTextSize(v.name)
							GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
							GUI:Text(v.name)
							GUI:PopStyleColor()
							GUI:PopStyleVar()
							GUI:EndChild()
							if GUI:IsItemClicked(0) then
								v.bool = not v.bool
								save(true)
							end
							if RoseCore.KeybindsPressed(v) then
								v.bool = not v.bool
								save(true)
							end
						end
						GUI:End()
					end
				end
			end
		end

		--SGE
		if Player.Job == 40 and RoseCore.Settings.SgeEvHotbarEnabled and gACRSelectedProfiles[Player.job] == "RoseSGE" then
            GUI:SetNextWindowSize(200,200,GUI.SetCond_FirstUseEver)
            GUI:PushStyleColor(GUI.Col_WindowBg, BgColR, BgColG, BgColB, RoseCore.Settings.SgeEvHotbarBgT/255)
            GUI:Begin("RoseSgeEvHotbar", true, (function() if RoseCore.Settings.SgeEvHotbarLocked then
                return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoMove
            else
                return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize
            end end)())
            GUI:PopStyleColor(1)
            local Hotbar = {}
            for m,n in pairs(RoseCore.Settings.SgeEvHotbar) do
                if n.visible then
                    table.insert(Hotbar, n)
                end
            end
            table.sort(Hotbar, function(a,b) return a.index < b.index end)
            local count
            if count == nil then count = 0 end
            for k,v in pairs(Hotbar) do
                local settingsOn = RoseCore.Settings.SgeEvHotbarButColOn
                local settingsOff = RoseCore.Settings.SgeEvHotbarButColOff
                local r,g,b,t = (function() if v.bool == true then return settingsOn.R, settingsOn.G, settingsOn.B, settingsOn.T else return settingsOff.R, settingsOff.G, settingsOff.B, settingsOff.T end end)()
                local butx,buty = RoseCore.Settings.SgeEvHotbarButtonSizeX,RoseCore.Settings.SgeEvHotbarButtonSizeY
                GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
                GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)
                if count % RoseCore.Settings.SgeEvHotbarColumns ~= 0 then GUI:SameLine(0,5) end
                GUI:BeginChild("##SgeEvButton"..tostring(k), butx, buty, false, GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse)
                count = count + 1
                local x,y = GUI:CalcTextSize(v.name)
                GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
                GUI:Text(v.name)
                GUI:PopStyleColor()
                GUI:PopStyleVar()
                GUI:EndChild()
                if GUI:IsItemClicked(0) then
                    v.bool = not v.bool
                    save(true)
                end
                if RoseCore.KeybindsPressed(v) then
                    v.bool = not v.bool
                    save(true)
                end
            end
            GUI:End()
        end
    end
    --[[if RoseCore.Settings.SgeSavHotbarEnabled then
		if GeneralProfile ~= nil and string.find(GeneralProfile, "Savage", 1, true) and string.find(GeneralProfile, "SGE", 1, true) then
			GUI:SetNextWindowSize(200,200,GUI.SetCond_FirstUseEver)
			GUI:PushStyleColor(GUI.Col_WindowBg, BgColR, BgColG, BgColB, RoseCore.Settings.SgeSavHotbarBgT/255)
			GUI:Begin("RoseSgeSavHotbar", true, (function() if RoseCore.Settings.SgeSavHotbarLocked then
				return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoMove
			else
				return GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize
			end end)())
			GUI:PopStyleColor(1)
			local Hotbar = {}
			for m,n in pairs(RoseCore.Settings.SgeSavHotbar) do
				if n.visible then
					table.insert(Hotbar, n)
				end
			end
			table.sort(Hotbar, function(a,b) return a.index < b.index end)
			local count
			if count == nil then count = 0 end
			for k,v in pairs(Hotbar) do
				local settingsOn = RoseCore.Settings.SgeSavHotbarButColOn
				local settingsOff = RoseCore.Settings.SgeSavHotbarButColOff
				local r,g,b,t = (function() if v.bool == true then return settingsOn.R, settingsOn.G, settingsOn.B, settingsOn.T else return settingsOff.R, settingsOff.G, settingsOff.B, settingsOff.T end end)()
				local butx,buty = RoseCore.Settings.SgeSavHotbarButtonSizeX,RoseCore.Settings.SgeSavHotbarButtonSizeY
				GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,5)
				GUI:PushStyleColor(GUI.Col_ChildWindowBg, r, g, b, t)
				if count % RoseCore.Settings.SgeSavHotbarColumns ~= 0 then GUI:SameLine(0,5) end
				GUI:BeginChild("##SgeSavButton"..tostring(k), butx, buty, false, GUI.WindowFlags_NoSavedSettings + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoScrollWithMouse)
				count = count + 1
				local x,y = GUI:CalcTextSize(v.name)
				GUI:SetCursorPos(butx/2-x/2,buty/2-y/2)
				GUI:Text(v.name)
				GUI:PopStyleColor()
				GUI:PopStyleVar()
				GUI:EndChild()
				if GUI:IsItemClicked(0) then
					v.bool = not v.bool
					save(true)
				end
				if RoseCore.KeybindsPressed(v) then
					v.bool = not v.bool
					save(true)
				end
			end
			GUI:End()
		end
	end]]
end

function RoseCore.OnUpdate()
	-- Grab Current Version
	if RoseCore.Data.VersionCheckerR == nil then RoseCore.Data.VersionCheckerR = Now() end
	if TimeSince(RoseCore.Data.VersionCheckerR) >= 30000 and RoseCore.Settings.ReactionVerLocal == "0.0.0" then
		RoseCore.VersionChecker(tostring(LuaPath).."TensorReactions/GeneralReactions/Rose/Version.txt")
	end
	
	-- Check Version Reactions
	if RoseCore.Data.CheckVerR == true and TimeSince(RoseCore.Data.LastCheckVerR) >= 2500 then
		local file = io.open(tostring(LuaPath).."RoseCore/Data/RVersion.txt")
		local output
		if file ~= nil then
			output = file:read()
			file:close()
		end
		if output ~= nil and RoseCore.Settings.ReactionVerLocal ~= nil and output > RoseCore.Settings.ReactionVerLocal then 
			RoseCore.Data.NeedUpdateR = true
			RoseCore.Data.UpdateTick = nil
			RoseCore.Data.CheckVerR = nil
			RoseCore.Data.LastCheckVerR = nil
		else
			RoseCore.Data.NeedUpdateR = false
			RoseCore.Data.UpdateTick = nil
			RoseCore.Data.CheckVerR = nil
			RoseCore.Data.LastCheckVerR = nil
		end
	end
	
	-- Check Version Core
	if RoseCore.Data.CheckVerC == true and TimeSince(RoseCore.Data.LastCheckVerC) >= 2500 then
		local file = io.open(tostring(LuaPath).."RoseCore/Data/CVersion.txt")
		local output
		if file ~= nil then
			output = file:read()
			file:close()
		end
		if output ~= nil and output > RoseCore.version then 
			RoseCore.Data.NeedUpdateC = true
			RoseCore.Data.UpdateTick = nil
			RoseCore.Data.CheckVerC = nil
			RoseCore.Data.LastCheckVerC = nil
		else
			RoseCore.Data.NeedUpdateC = false
			RoseCore.Data.UpdateTick = nil
			RoseCore.Data.CheckVerC = nil
			RoseCore.Data.LastCheckVerC = nil
		end
	end
	
	-- Update Reactions
	if RoseCore.Data.UpdateTaskR == true then
		if RoseCore.Data.UpdateTimerR == nil then RoseCore.Data.UpdateTimerR = Now() end
		if TimeSince(RoseCore.Data.UpdateTimerR) >= 2500 then
			local file = io.open(tostring(LuaPath).."RoseCore/Data/RStatus.txt") 
			local output
			if file ~= nil then
				output = file:read()
				file:close()
			else
				RoseCore.Data.UpdateTimerR = Now()
			end
			if output == "Done" then 
				--Reload
				table.clear(RoseCore.Data)
				RoseCore.VersionChecker(tostring(LuaPath).."TensorReactions/GeneralReactions/Rose/Version.txt")
				if TensorCore ~= nil then
					TensorCore.API.TensorReactions.reloadGeneralReactions()
					TensorCore.API.TensorReactions.reloadTimelineReactions()
					Reload()
				end
			else
				RoseCore.Data.UpdateTimerR = Now()
			end
		end
	end
	
	-- Update Core
	if RoseCore.Data.UpdateTaskC == true then
		if RoseCore.Data.UpdateTimerC == nil then RoseCore.Data.UpdateTimerC = Now() end
		if TimeSince(RoseCore.Data.UpdateTimerC) >= 2500 then
			local file = io.open(tostring(LuaPath).."RoseCore/Data/CStatus.txt") 
			local output
			if file ~= nil then
				output = file:read()
				file:close()
			else
				RoseCore.Data.UpdateTimerC = Now()
			end
			if output == "Done" then 
				--Reload
				table.clear(RoseCore.Data)
				Reload()
			else
				RoseCore.Data.UpdateTimerC = Now()
			end
		end
	end
end

RegisterEventHandler("Module.Initalize", RoseCore.Init, "RoseCore.Init")
RegisterEventHandler("Gameloop.Draw", RoseCore.DrawCall, "RoseCore.DrawCall")
RegisterEventHandler("Gameloop.Update", RoseCore.OnUpdate, "RoseCore.OnUpdate")