/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 45FC1A9F
/// @DnDComment : // Create a space to hold all important variables that can be saved to the disk$(13_10)// bank :				the amount of gold the player has$(13_10)// enemy_num:			how many of each enemy the player has killed$(13_10)// enemy_hp:			how much hp each enemy currently has$(13_10)// enemy_augments:		the augment each enemy has$(13_10)// enemy_diff:			the current enemy difficulty on display
/// @DnDArgument : "code" "global.save = {$(13_10)	bank : 0,$(13_10)	enemy_num : [-1, 0, 0, 0, 0, 0, 0, 0, 0],$(13_10)	enemy_hp : [0, 0, 0, 0, 0, 0, 0, 0, 0],$(13_10)	enemy_augments : ["", "", "", "", "", "", "", "", ""],$(13_10)	enemy_diff : 0,$(13_10)}"
global.save = {
	bank : 0,
	enemy_num : [-1, 0, 0, 0, 0, 0, 0, 0, 0],
	enemy_hp : [0, 0, 0, 0, 0, 0, 0, 0, 0],
	enemy_augments : ["", "", "", "", "", "", "", "", ""],
	enemy_diff : 0,
}

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 6BBB7291
/// @DnDComment : // Create a space to store the amount of damage the cards add up to$(13_10)// Create a flag to show whether the game has been won yet$(13_10)// Create a flag to show whether the game is paused$(13_10)// Create a space to store a surface to display while the game is paused
/// @DnDInput : 4
/// @DnDArgument : "value_1" "false"
/// @DnDArgument : "value_2" "false"
/// @DnDArgument : "value_3" "-1"
/// @DnDArgument : "var" "dps"
/// @DnDArgument : "var_1" "won"
/// @DnDArgument : "var_2" "paused"
/// @DnDArgument : "var_3" "paused_surf"
global.dps = 0;
global.won = false;
global.paused = false;
global.paused_surf = -1;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6A21C786
/// @DnDComment : // Store how much time has passed since the last time the enemy took damage$(13_10)// Create variables to represent periods where the enemy should take double damage
/// @DnDInput : 3
/// @DnDArgument : "expr_2" "false"
/// @DnDArgument : "var" "damage_timer"
/// @DnDArgument : "var_1" "double_timer"
/// @DnDArgument : "var_2" "double_dps"
damage_timer = 0;
double_timer = 0;
double_dps = false;

/// @DnDAction : YoYo Games.Random.Randomize
/// @DnDVersion : 1
/// @DnDHash : 1DB5EF98
/// @DnDComment : // Seed the random numbers
randomize();

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 3E5CAB28
/// @DnDComment : // Enable font effects
/// @DnDInput : 3
/// @DnDArgument : "function" "font_enable_effects"
/// @DnDArgument : "arg" "fnt_HUD"
/// @DnDArgument : "arg_1" "true"
/// @DnDArgument : "arg_2" "{ dropShadowEnable: true, dropShadowSoftness: 0, dropShadowOffsetX: 4, dropShadowOffsetY: 4, dropShadowColour: c_black, dropShadowAlpha: 0.6 }"
font_enable_effects(fnt_HUD, true, { dropShadowEnable: true, dropShadowSoftness: 0, dropShadowOffsetX: 4, dropShadowOffsetY: 4, dropShadowColour: c_black, dropShadowAlpha: 0.6 });

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 50F65D00
/// @DnDInput : 3
/// @DnDArgument : "function" "font_enable_effects"
/// @DnDArgument : "arg" "fnt_enemy"
/// @DnDArgument : "arg_1" "true"
/// @DnDArgument : "arg_2" "{ dropShadowEnable: true, dropShadowSoftness: 0, dropShadowOffsetX: 3, dropShadowOffsetY: 3, dropShadowColour: c_black, dropShadowAlpha: 0.6 }"
font_enable_effects(fnt_enemy, true, { dropShadowEnable: true, dropShadowSoftness: 0, dropShadowOffsetX: 3, dropShadowOffsetY: 3, dropShadowColour: c_black, dropShadowAlpha: 0.6 });

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 5959112E
/// @DnDInput : 3
/// @DnDArgument : "function" "font_enable_effects"
/// @DnDArgument : "arg" "fnt_UI"
/// @DnDArgument : "arg_1" "true"
/// @DnDArgument : "arg_2" "{ outlineEnable : true, outlineDistance : 2, outlineColour : c_black }"
font_enable_effects(fnt_UI, true, { outlineEnable : true, outlineDistance : 2, outlineColour : c_black });

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6AFEE4CE
/// @DnDComment : // Create arrays to store the effects that trigger when the player clicks on an enemy, kills an enemy, and spawns a new enemy
/// @DnDInput : 3
/// @DnDArgument : "expr" "[]"
/// @DnDArgument : "expr_1" "[]"
/// @DnDArgument : "expr_2" "[]"
/// @DnDArgument : "var" "onclick_methods"
/// @DnDArgument : "var_1" "onkill_methods"
/// @DnDArgument : "var_2" "onappear_methods"
onclick_methods = [];
onkill_methods = [];
onappear_methods = [];

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 645B29C8
/// @DnDComment : // Function to trigger all on-click effects
/// @DnDArgument : "funcName" "on_click"
function on_click() 
{
	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 763E2D59
	/// @DnDParent : 645B29C8
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "i < array_length(onclick_methods)"
	for(var i = 0; i < array_length(onclick_methods); i += 1) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 494C2742
		/// @DnDInput : 2
		/// @DnDParent : 763E2D59
		/// @DnDArgument : "function" "method_call"
		/// @DnDArgument : "arg" "onclick_methods[i]"
		/// @DnDArgument : "arg_1" "[]"
		method_call(onclick_methods[i], []);
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 042E6190
/// @DnDComment : // Function to trigger all on-kill effects
/// @DnDArgument : "funcName" "on_kill"
function on_kill() 
{
	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 2023B889
	/// @DnDParent : 042E6190
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "i < array_length(onkill_methods)"
	for(var i = 0; i < array_length(onkill_methods); i += 1) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 6ABEC4CB
		/// @DnDInput : 2
		/// @DnDParent : 2023B889
		/// @DnDArgument : "function" "method_call"
		/// @DnDArgument : "arg" "onkill_methods[i]"
		/// @DnDArgument : "arg_1" "[]"
		method_call(onkill_methods[i], []);
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 79C64699
/// @DnDComment : // Function to trigger all on-appear effects
/// @DnDArgument : "funcName" "on_appear"
function on_appear() 
{
	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 4DC5827B
	/// @DnDParent : 79C64699
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "i < array_length(onappear_methods)"
	for(var i = 0; i < array_length(onappear_methods); i += 1) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 5D1B84BB
		/// @DnDInput : 2
		/// @DnDParent : 4DC5827B
		/// @DnDArgument : "function" "method_call"
		/// @DnDArgument : "arg" "onappear_methods[i]"
		/// @DnDArgument : "arg_1" "[]"
		method_call(onappear_methods[i], []);
	}
}