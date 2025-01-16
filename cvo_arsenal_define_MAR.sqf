/*=================================================*
	CVO_ARSENAL_DEFINE
*=================================================*

Here, you define the Available Equipment for the CVO Arsenal
It is seperated in 3 Parts

##################
1. BASE KIT - This is Available for Everyone
##################

Variable Name: cvo_arsenal_base = [];

For easier reading it is suggested to compartmentalise
and append the individual Groups to cvo_arsenal_base



##################
### 2. ROLE KIT - This is dependent on the Players Role.
##################

Traits like "Medic" or "Engineer" are automatically detected,
meaning manually giving a player the medic or doctor trait isnt necessary.

##################
3. Personal KIT - Add Items to individual players based on their UID(steam64)
##################

This is based on Code blocks to allow for checks.

##################

BASE KIT gets defined once in the beginning, as it will never change during during mission.

ROLE KIT gets updated each time the arsenal opens as Roles and Traits might change mid-mission (Ad-hoc Medic)
PLAYER KIT gets updated each time the arsenal opens as it CAN be dependend on other Roles and Traits as well.


##################


*=================================================*/  


diag_log ("[CVO] [Arsenal_Define] - start");


// #####################################################
// ###### DEFINE ARSENAL BOXES HERE - objects that give accesss to the CVO Arsenal
// #####################################################
// ######  Define the Editor Layername here
// #####################################################

#define EDITOR_LAYER_NAME "CVO_Arsenal_Boxes"

// #####################################################
// ###### CODE - DONT CHANGE
// #####################################################

if (isServer) then {
	_array = (getMissionLayerEntities EDITOR_LAYER_NAME)#0;
	[_array] remoteExecCall ["cvo_arsenal_fnc_addAction", [0,-2] select isDedicated, true];
};

if (!hasInterface) exitWith {};

// #####################################################
// ###### DEFINE BASE KIT HERE - AVAILABLE FOR EVERYONE
// #####################################################

cvo_arsenal_base = [];

// ###### Baseline Equipment ###### 
// The Following can be mostly left as default


// How to add Equipment if a certain Addon is Loaded - here, GreenMag
if (isClass (configFile >> "CfgPatches" >> "greenmag_main")) then {

		cvo_arsenal_base append [
			//"greenmag_ammo_556x45_basic_60Rnd",
			//"greenmag_ammo_556x45_basic_30Rnd",

			"greenmag_ammo_762x51_basic_60Rnd",
			"greenmag_ammo_762x51_basic_30Rnd",

			//"greenmag_ammo_545x39_basic_60Rnd",
			//"greenmag_ammo_545x39_basic_30Rnd",

			//"greenmag_ammo_762x39_basic_60Rnd",
			//"greenmag_ammo_762x39_basic_30Rnd",
			
			"greenmag_ammo_9x21_basic_60Rnd",
			"greenmag_ammo_9x21_basic_30Rnd",

			//"greenmag_ammo_45ACP_basic_30Rnd",
			//"greenmag_ammo_45ACP_basic_60Rnd",
		
			//"greenmag_ammo_762x54_basic_60Rnd",
			//"greenmag_ammo_762x54_basic_30Rnd",

			"greenmag_item_speedloader"
		];
	diag_log "[CVO] [ARSENAL_DEFINE] - GreenMag added";
};


// Medical 
cvo_arsenal_base append [
	"ACE_packingBandage",
	"ACE_elasticBandage",
	"ACE_fieldDressing",
	"ACE_quikclot",
	"ACE_tourniquet", 
	"ACE_splint",
	"ACE_morphine",
	"ACE_salineIV", 
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	"ACE_personalAidKit",
	"ACE_bodyBag",
	"OPTRE_Biofoam"
	];

// Tools & Equipment

private _rations = [
	"ACE_MRE_BeefStew",
	"ACE_MRE_ChickenTikkaMasala",
	"ACE_MRE_ChickenHerbDumplings",
	"ACE_MRE_CreamChickenSoup",
	"ACE_MRE_CreamTomatoSoup",
	"ACE_MRE_LambCurry",
	"ACE_MRE_MeatballsPasta",
	"ACE_MRE_SteakVegetables"
];
//cvo_arsenal_base append _rations;

cvo_arsenal_base append [
	"immersion_pops_poppack",
	"murshun_cigs_cigpack",
	"murshun_cigs_lighter",
	"murshun_cigs_matches",
	"immersion_cigs_cigar0",
	"immersion_cigs_cigar0_nv",

	"ACE_MapTools",
	"ace_marker_flags_yellow",
	"ace_marker_flags_red",
	"ace_marker_flags_green",
	"ace_marker_flags_blue",

	"ACE_EntrenchingTool",
	"ACE_EarPlugs",

	"ACE_SpraypaintGreen",
	"ACE_SpraypaintRed",
	"ACE_PlottingBoard",
	"ACE_UAVBattery",

	"ACE_DAGR",
	"ACE_CableTie",
	"ACE_Chemlight_Shield",
	"acex_intelitems_notepad",
	"ACE_Flashlight_KSF1",
	"ACE_IR_Strobe_Item",
	
	"ACE_WaterBottle",
	"ACE_Canteen",	

	"ItemMap",
	"ItemWatch",
	"ItemGPS",
	"ItemCompass"
	];

// Binoculars
cvo_arsenal_base append [
	"OPTRE_Binoculars",
	"Binocular"
	];

// Radios
cvo_arsenal_base append  ["ACRE_PRC343"];

// ###### Wearables ###### 

// ### ODST ###

// Uniforms 
cvo_arsenal_base append [
	"OPTRE_UNSC_Marine_Uniform_R_SlimLeg",
	"OPTRE_UNSC_Marine_Uniform_S_SlimLeg",
	"OPTRE_UNSC_Marine_Uniform_SlimLeg",
	"OPTRE_UNSC_Marine_Uniform_T_SlimLeg"
	];

// Vests
cvo_arsenal_base append [
	"OPTRE_UNSC_M52A_Armor_MG_MAR",
	"OPTRE_UNSC_M52A_Armor_Breacher_MAR",
	"OPTRE_UNSC_M52A_Armor_Grenadier_MAR",
	"OPTRE_UNSC_M52A_Armor1_MAR",
	"OPTRE_UNSC_M52A_Armor2_MAR",
	"OPTRE_UNSC_M52A_Armor3_MAR",
	"OPTRE_UNSC_M52A_Armor4_MAR",
	"OPTRE_UNSC_M52A_Armor_Rifleman_MAR",
	"OPTRE_UNSC_M52A_Armor_Sniper_MAR",
	"OPTRE_UNSC_M52A_Armor_TL_MAR",
	"OPCOS_UNSC_M52A_Armor_Security_MAR",
	"OPCOS_Uniforms_Army_UNSC_Assault_MAR"
];

// Backpacks
cvo_arsenal_base append [
	"B_Messenger_Coyote_F",
	"CVO_LegStrapBag_black",
	"OPTRE_UNSC_Rucksack",
	"OPTRE_UNSC_Rucksack_Heavy"
	];

// Headgear
cvo_arsenal_base append [
	"OPTRE_UNSC_CH252_Helmet2_MAR",
	"OPTRE_UNSC_CH252_Helmet_MAR",
	"OPTRE_UNSC_CH252_Helmet2_Vacuum_MAR",
	"OPTRE_UNSC_CH252_Helmet_Vacuum_MAR",
	"OPTRE_UNSC_PatrolCap_Marines",
	"H_MilCap_gry",
	"OPTRE_UNSC_Watchcap",
	"H_Booniehat_khk",
	"H_Bandanna_cbr"
	];

// Facewear
cvo_arsenal_base append [
	//Balaclavas
	"G_Balaclava_TI_blk_F",
	"OPTRE_HUD_b_Glasses",
	"OPTRE_Glasses_Visor_Blue",
	"G_Spectacles",
	"G_Bandanna_tan",
	"OPTRE_EyePiece",
	//cigs and lollipop
	"immersion_pops_pop0",
	"murshun_cigs_cig0",
	"immersion_cigs_cigar0"
	];

// NVGs
cvo_arsenal_base append [	
	//cigs and lollipop
	"immersion_cigs_cigar0_nv",
	"murshun_cigs_cig0_nv",
	//Neural Implant
	"OPTRE_NVG",
	//Helmet Mods
	"OPTRE_NVG_UL_CNM",
	"OPTRE_NVG_HURS_HUL"
];

// ###### WEAPONS - MAIN ###### 

// Primary
cvo_arsenal_base append  [
	// Assault Rifle
	"OPTRE_MA37",	
	//32rnd magazines
	"OPTRE_32Rnd_762x51_Mag",
	"OPTRE_32Rnd_762x51_Mag_Tracer",
	//attachments
	"OPTRE_M45_Flashlight",
	"acc_pointer_IR",
	"OPTRE_MA37_Smartlink_Scope",

	// Battle Rifle
	"OPTRE_BR55_Grey",
	//36rnd magazines
	"OPTRE_36Rnd_95x40_Mag",
	"OPTRE_36Rnd_95x40_Mag_Tracer",

	// SMG
	"OPTRE_M7",
	//60rnd magazines
	"OPTRE_60Rnd_5x23mm_Mag",
	"OPTRE_60Rnd_5x23mm_Mag_tracer",
	//attachments
	"OPTRE_M7_Sight"
	];

// Secondary
cvo_arsenal_base append [
	//pistol
	"OPTRE_M6D",
	//12rnd magazines
	"OPTRE_8Rnd_127x40_Mag",
	"OPTRE_8Rnd_127x40_Mag_Tracer",
	"OPTRE_8Rnd_127x40_Tracer_HE",
	//attachments
	"OPTRE_M6D_Scope",
	"OPTRE_M6D_Flashlight",
	"OPTRE_M6D_Vis_Red_Laser",
	"OPTRE_M6D_IR_Laser",

	//Kukri
	"Knife_kukri"
	];

// Handgrenades and Throwables
cvo_arsenal_base append   [

	"OPTRE_M9_Frag",
	"SmokeShell",
	"SmokeShellBlue",
	"SmokeShellGreen",
	"SmokeShellOrange",
	"SmokeShellPurple",
	"SmokeShellRed",
	"SmokeShellYellow",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_White",
	"B_IR_Grenade",
	"Chemlight_yellow",
	"Chemlight_red",
	"Chemlight_blue",
	"Chemlight_green",
	"ACE_Chemlight_Orange",
	"ACE_Chemlight_White",
	"ACE_Chemlight_HiWhite",
	"ACE_Chemlight_UltraHiOrange"
	];

// Explosives
cvo_arsenal_base append [
	
	];


// #####################################################
// ###### DEFINE ROLE KIT HERE - AVAILABLE FOR SPECIFIC ROLES
// #####################################################

// CUSTOM ROLES
// Formatting Template: [  "KEY/ROLENAME",	[  ["ARRAY OF CLASSNAMES"],{"Optional CODEBLOCK"}  ]  ]

// #####################################################
// ## HOW TO DEFINE A UNIT AS A SPECIFIC ROLE:
// ## UNIT INIT FIELD IN THE EDITOR:
// this setVariable ["CVO_A_Roles",["Officer"]];
// ## Further Notes: 
// -- "Medic" and "Engineer" are autoDetected based on ACE Skill Level  
// #####################################################


cvo_arsenal_roleKit = createHashMapFromArray [
	["Medic", [[
		"ACE_adenosine",
		"ACE_epinephrine",
		"ACE_plasmaIV",
		"ACE_plasmaIV_500",
		"ACE_plasmaIV_250",
		"ACE_bloodIV",
		"ACE_bloodIV_500",
		"ACE_bloodIV_250",
		// "ACE_suture",
		"ACE_surgicalKit",
		"OPCOS_UNSC_M52D_Armor_Medic_Blue",
		"OPTRE_UNSC_Rucksack_Medic",
		"OPTRE_UNSC_CH252_Helmet2_MAR_MED",
		"OPTRE_UNSC_CH252_Helmet_MAR_MED",
		"OPTRE_UNSC_CH252_Helmet2_Vacuum_MAR_MED",
		"OPTRE_UNSC_CH252_Helmet_Vacuum_MAR_MED"
	],
	{}]],
	["Engineer", [[
		//Shotgun
		"OPTRE_M45",
		"OPTRE_6Rnd_8Gauge_Pellets",
		"OPTRE_6Rnd_8Gauge_Slugs",

		// Tools and Detectors
		"ACE_VMM3",
		"ACE_VMH3", 
		"ACE_wirecutter",
		"ToolKit", 
		"ACE_Fortify",
		"ACE_DefusalKit",

		// Explosives
		"ACE_Clacker",
		"C12_Remote_Mag",
		"C7_Remote_Mag",
		"M168_Remote_Mag",
		"FlareTripMine_Wire_Mag",
		"APERSMine_Range_Mag"
		], 
		{}]],
	["Light-Machinegunner", [[
		//Light Machinegun
		"OPTRE_M73",
		"OPTRE_M73_SmartLink",
		"bipod_01_F_blk",
		//100 rnd belts
		"OPTRE_100Rnd_95x40_Box",
		"OPTRE_100Rnd_95x40_Box_Tracer",
		], 
	{}]],
	["Medium-Machinegunner", [[
		//Medium Machinegun
		"OPTRE_M247",
		"bipod_01_F_blk",
		//100 rnd belts
		"OPTRE_100Rnd_762x51_Box",
		"OPTRE_100Rnd_762x51_Box_Tracer",
		], 
	{}]],
	["LMG-assistant", [[
		//100 rnd belts
		"OPTRE_100Rnd_95x40_Box",
		"OPTRE_100Rnd_95x40_Box_Tracer"
		], 
	{}]],
	["MMG-assistant", [[
		//100 rnd belts
		"OPTRE_100Rnd_762x51_Box",
		"OPTRE_100Rnd_762x51_Box_Tracer"
		], 
	{}]],
	["Anti-Tank", [[
		//Spankr
		"OPTRE_M41_SSR",
		//Rockets
		"OPTRE_M41_Twin_HEAT",
		"OPTRE_M41_Twin_HEAT_G",
		"OPTRE_M41_Twin_HEAP",
		"OPTRE_M41_Twin_HEAT_SALH"
		], 
	{}]],
	["AT-assistant", [[
		//Rockets
		"OPTRE_M41_Twin_HEAT",
		"OPTRE_M41_Twin_HEAT_G",
		"OPTRE_M41_Twin_HEAP",
		"OPTRE_M41_Twin_HEAT_SALH"
		], 
	{}]],
	["Rifleman", [[
		//Scope
		"OPTRE_BR55HB_Scope_Grey",
		], 
	{}]],
	["Scout", [[
		//Marksman Visor
		"OPTRE_NVG_MVI",
		
		//Utility
		"Rangefinder",
		"ACE_RangeCard"
		], 
	{}]],
	["Sniper", [[
		//DMR
		"OPTRE_M392_DMR",
		"OPTRE_M393_Scope",
		"OPTRE_M393_EOTECH",
		"OPTRE_15Rnd_762x51_Mag",
		"OPTRE_15Rnd_762x51_Mag_Tracer"

		//Sniper Rifle
		"OPTRE_SRS99C",
		"OPTRE_SRS99C_Scope",
		"OPTRE_4Rnd_145x114_HVAP_Mag",
		
		//Marksman Visor
		"OPTRE_NVG_MVI",
		
		//Utility
		"Rangefinder",
		"ACE_RangeCard"
		], 
	{}]],
	["Team-Leader", [[
		//Grenade launcher and ammo
		"OPTRE_MA37GL",
		//HE Grenade
		"1Rnd_HE_Grenade_shell",
		//Impact Smoke
		"OPTRE_1Rnd_SmokeBlue_Grenade_shell",
		"OPTRE_1Rnd_SmokeGreen_Grenade_shell",
		"OPTRE_1Rnd_SmokeRed_Grenade_shell",
		"OPTRE_1Rnd_Smoke_Grenade_shell",
		//Signal Flare
		"OPTRE_signalSmokeB",
		"OPTRE_signalSmokeG",
		"OPTRE_signalSmokeR",
		//Illumination Flare
		"ACE_40mm_Flare_white",
		"ACE_40mm_Flare_green",
		"ACE_40mm_Flare_red",
		"ACE_40mm_Flare_ir",

		//Rangefinder
		"Rangefinder"
		],
	{}]],
	["Squad-Leader", [[
		//Grenade launcher and ammo
		"OPTRE_MA37GL",
		//HE Grenade
		"1Rnd_HE_Grenade_shell",
		//Impact Smoke
		"OPTRE_1Rnd_SmokeBlue_Grenade_shell",
		"OPTRE_1Rnd_SmokeGreen_Grenade_shell",
		"OPTRE_1Rnd_SmokeRed_Grenade_shell",
		"OPTRE_1Rnd_Smoke_Grenade_shell",
		//Signal Flare
		"OPTRE_signalSmokeB",
		"OPTRE_signalSmokeG",
		"OPTRE_signalSmokeR",
		//Illumination Flare
		"ACE_40mm_Flare_white",
		"ACE_40mm_Flare_green",
		"ACE_40mm_Flare_red",
		"ACE_40mm_Flare_ir",

		//Laser Designator
		"Laserdesignator_01_khk_F",
		"Laserdesignator_03",
		"OPTRE_Smartfinder",
		"Laserbatteries",
		"Rangefinder",
		
		//LR radio
		"ACRE_PRC148"
		],
	{}]],
	["RTO-JTAC", [[
		//Radio Backpack 
		"OPTRE_ANPRC_521_Tan",
		"ACRE_PRC117F",

		//Grenade launcher and ammo
		"OPTRE_MA37GL",
		//HE Grenade
		"1Rnd_HE_Grenade_shell",
		//Impact Smoke
		"OPTRE_1Rnd_SmokeBlue_Grenade_shell",
		"OPTRE_1Rnd_SmokeGreen_Grenade_shell",
		"OPTRE_1Rnd_SmokeRed_Grenade_shell",
		"OPTRE_1Rnd_Smoke_Grenade_shell",
		//Signal Flare
		"OPTRE_signalSmokeB",
		"OPTRE_signalSmokeG",
		"OPTRE_signalSmokeR",
		//Illumination Flare
		"ACE_40mm_Flare_white",
		"ACE_40mm_Flare_green",
		"ACE_40mm_Flare_red",
		"ACE_40mm_Flare_ir",

		//Laser Designator
		"Laserdesignator_01_khk_F",
		"Laserdesignator_03",
		"OPTRE_Smartfinder",
		"Laserbatteries",
		"Rangefinder",

		//drone terminal
		"B_UavTerminal",
		
		//LR radio
		"ACRE_PRC148"
		],
	{}]],
	["Officer", [[
		//Radio Backpack
		"OPTRE_ANPRC_515",
		"ACRE_PRC117F",

		//Grenade launcher and ammo
		"OPTRE_MA37GL",
		//HE Grenade
		"1Rnd_HE_Grenade_shell",
		//Impact Smoke
		"OPTRE_1Rnd_SmokeBlue_Grenade_shell",
		"OPTRE_1Rnd_SmokeGreen_Grenade_shell",
		"OPTRE_1Rnd_SmokeRed_Grenade_shell",
		"OPTRE_1Rnd_Smoke_Grenade_shell",
		//Signal Flare
		"OPTRE_signalSmokeB",
		"OPTRE_signalSmokeG",
		"OPTRE_signalSmokeR",
		//Illumination Flare
		"ACE_40mm_Flare_white",
		"ACE_40mm_Flare_green",
		"ACE_40mm_Flare_red",
		"ACE_40mm_Flare_ir",

		//Laser Designator
		"Laserdesignator_01_khk_F",
		"Laserdesignator_03",
		"OPTRE_Smartfinder",
		"Laserbatteries",
		"Rangefinder",
		
		//LR radio
		"ACRE_PRC148"
		],
		{}]]
];

// #####################################################
// ###### DEFINE PLAYER KIT HERE - Based on STEAM64 ID
// #####################################################

// Formatting Template: [  "STEAM64",	["PlayerName", "["ARRAY OF CLASSNAMES"],{"Optional CODEBLOCK"}  ]  ]


cvo_arsenal_playerKit = createHashMapFromArray [
	["_SP_PLAYER_", 		["Editor Debug", 	["ACE_Banana"],		{systemChat "CVO_A_Playerkit test Successful - ACE_Sandbag_empty Given"; 	["ACE_Sandbag_empty"]}		]	],
	["76561198071877982", 	["Ketzl", 			["H_Watchcap_sgg", "ACE_SpraypaintBlack"],	{[]}	]],
	["76561198023521982", 	["sld_Delta", 		["OPTRE_M12_SOC","OPTRE_M12_Suppressor","OPTRE_M73_SmartLink","OPTRE_64Rnd_57x31_Mag","UNSC_Knife_reversed","OPTRE_DME_Uniform","OPTRE_UNSC_M52D_Armor_Jedi","OPTRE_S12_SOLA_Jetpack","ACE_Altimeter","OPTRE_NVG_HURS","OPTRE_UNSC_Recon_Helmet"],	{[]}	]]
];


////////////////////////////////////////////
///////////// Default Loadouts /////////////
////////////////////////////////////////////


[
	"Officer - MA37",
	[[["OPTRE_MA37","","","OPTRE_MA37_Smartlink_Scope",["OPTRE_32Rnd_762x51_Mag_Tracer",32],[],""],[],[],["OPTRE_UNSC_Marine_Uniform",[["ACE_elasticBandage",10],["ACE_splint",4],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_quikclot",10],["ACE_painkillers",1,10],["SmokeShellBlue",2,1]]],["OPTRE_UNSC_M52A_Armor1_MAR",[["ACRE_PRC148",1],["OPTRE_M9_Frag",2,1],["OPTRE_32Rnd_762x51_Mag_Tracer",3,32],["OPTRE_32Rnd_762x51_Mag",3,32]]],["OPTRE_ANPRC_515",[["ACRE_PRC117F",1]]],"OPTRE_UNSC_CH252_Helmet2_Vacuum_MAR","G_Balaclava_TI_blk_F",["OPTRE_Smartfinder","","","",["Laserbatteries",1],[],""],["ItemMap","","","ItemCompass","ItemWatch","OPTRE_NVG_HURS_HUL"]],[["ace_earplugs",true]]]
] call ace_arsenal_fnc_addDefaultLoadout;

[
	"Squad Leader - MA37GL",
	[[["OPTRE_MA37GL","","","OPTRE_MA37_Smartlink_Scope",["OPTRE_32Rnd_762x51_Mag",32],["1Rnd_HE_Grenade_shell",1],""],[],[],["OPTRE_UNSC_Marine_Uniform_SlimLeg",[["ACE_elasticBandage",10],["ACE_splint",4],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_quikclot",10],["ACE_painkillers",1,10],["SmokeShellBlue",2,1]]],["OPTRE_UNSC_M52A_Armor_TL_MAR",[["ACRE_PRC343",1],["ACRE_PRC148",1],["OPTRE_32Rnd_762x51_Mag",4,32],["OPTRE_32Rnd_762x51_Mag_Tracer",4,32]]],["OPTRE_UNSC_Rucksack",[["1Rnd_HE_Grenade_shell",20,1],["OPTRE_1Rnd_SmokeRed_Grenade_shell",5,1],["ACE_40mm_Flare_ir",5,1],["OPTRE_signalSmokeG",3,1],["OPTRE_M9_Frag",4,1]]],"OPTRE_UNSC_CH252_Helmet2_MAR","G_Balaclava_TI_blk_F",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]],[["ace_earplugs",true]]]
] call ace_arsenal_fnc_addDefaultLoadout;

[
	"Radio Operator - M7",
	[[["OPTRE_M7","","","OPTRE_M7_Sight",["OPTRE_60Rnd_5x23mm_Mag",60],[],""],[],[],["OPTRE_UNSC_Marine_Uniform_R_SlimLeg",[["ACE_elasticBandage",10],["ACE_splint",4],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_quikclot",10],["ACE_painkillers",1,10],["SmokeShellBlue",2,1]]],["OPCOS_UNSC_M52A_Armor_Security_MAR",[["ACRE_PRC148",1],["OPTRE_M9_Frag",2,1],["OPTRE_60Rnd_5x23mm_Mag",5,60],["OPTRE_60Rnd_5x23mm_Mag_tracer",5,60]]],["OPTRE_ANPRC_521_Tan",[["ACRE_PRC117F",1]]],"OPTRE_UNSC_CH252_Helmet2_Vacuum_MAR","G_Balaclava_TI_blk_F",["OPTRE_Smartfinder","","","",["Laserbatteries",1],[],""],["ItemMap","B_UavTerminal","","ItemCompass","ItemWatch",""]],[["ace_earplugs",true]]]
] call ace_arsenal_fnc_addDefaultLoadout;

[
	"Rifleman - MA37",
	[[["OPTRE_MA37","","OPTRE_M45_Flashlight","OPTRE_MA37_Smartlink_Scope",["OPTRE_32Rnd_762x51_Mag",32],[],""],[],[],["OPTRE_UNSC_Marine_Uniform_R_SlimLeg",[["ACE_elasticBandage",10],["ACE_splint",4],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_quikclot",10],["ACE_painkillers",1,10],["SmokeShellBlue",2,1]]],["OPTRE_UNSC_M52A_Armor_Rifleman_MAR",[["ACRE_PRC343",1],["OPTRE_32Rnd_762x51_Mag",4,32],["OPTRE_32Rnd_762x51_Mag_Tracer",5,32]]],["OPTRE_UNSC_Rucksack",[["OPTRE_M9_Frag",4,1],["SmokeShell",2,1]]],"OPTRE_UNSC_CH252_Helmet_Vacuum_MAR","",[],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","OPTRE_NVG"]],[["ace_earplugs",true]]]
] call ace_arsenal_fnc_addDefaultLoadout;

[
	"Rifleman - BR55",
	[[["OPTRE_BR55_Grey","","OPTRE_M45_Flashlight","OPTRE_BR55HB_Scope_Grey",["OPTRE_36Rnd_95x40_Mag",36],[],""],[],[],["OPTRE_UNSC_Marine_Uniform_SlimLeg",[["ACE_elasticBandage",10],["ACE_splint",4],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_quikclot",10],["ACE_painkillers",1,10],["SmokeShellBlue",2,1]]],["OPTRE_UNSC_M52A_Armor_Marksman_MAR",[["ACRE_PRC343",1],["OPTRE_36Rnd_95x40_Mag_Tracer",7,36],["OPTRE_36Rnd_95x40_Mag",7,36]]],["OPTRE_UNSC_Rucksack",[["SmokeShell",2,1],["OPTRE_M9_Frag",4,1]]],"OPTRE_UNSC_CH252_Helmet2_MAR","G_Bandanna_tan",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","OPTRE_NVG"]],[["ace_earplugs",true]]]
] call ace_arsenal_fnc_addDefaultLoadout;


diag_log ("[CVO] [Arsenal_Define] - completed");
