/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 038515E8
/// @DnDArgument : "soundid" "snd_gold_gain"
/// @DnDSaveInfo : "soundid" "snd_gold_gain"
audio_play_sound(snd_gold_gain, 0, 0, 1.0, undefined, 1.0);

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 71D5BB57
/// @DnDComment : // This event simulates a new enemy being made once another has died$(13_10)$(13_10)// Add the gold the previous enemy was worth to the bank
/// @DnDArgument : "value" "gold"
/// @DnDArgument : "value_relative" "1"
/// @DnDArgument : "var" "save.bank"
global.save.bank += gold;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 68E68F7E
/// @DnDComment : // Trigger on-kill effects
/// @DnDApplyTo : obj_game_manager
/// @DnDArgument : "function" "on_kill"
with(obj_game_manager) {
	on_kill();
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7FE675B4
/// @DnDComment : // Generate another enemy$(13_10)$(13_10)// Set up an augment for the enemy$(13_10)// This is dependent upon the card abilities unlocked$(13_10)// Make a place to store the augment type
/// @DnDArgument : "expr" """"
/// @DnDArgument : "var" "augment"
augment = "";

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 13D21140
/// @DnDComment : // Set out the augment types
/// @DnDArgument : "var" "name_mods"
/// @DnDArgument : "value" "[ "Tough", "Rich" ]"
var name_mods = [ "Tough", "Rich" ];

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 744D22EE
/// @DnDComment : // Create a baseline amount that the enemy can be augmented
/// @DnDArgument : "var" "augment_mod"
/// @DnDArgument : "value" "accumulate_stats("augment")"
var augment_mod = accumulate_stats("augment");

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 29DBF667
/// @DnDComment : // Create a place to store the enemy's name
/// @DnDArgument : "expr" """"
/// @DnDArgument : "var" "name"
name = "";

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 43F8E065
/// @DnDComment : // If the enemy does not have a saved augment, only then assign it a new one
/// @DnDArgument : "var" "global.save.enemy_augments[global.save.enemy_diff]"
/// @DnDArgument : "value" """"
if(global.save.enemy_augments[global.save.enemy_diff] == ""){	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2AE146B8
	/// @DnDComment : // Take the augment amount as a percentage chance to gain a random augment
	/// @DnDParent : 43F8E065
	/// @DnDArgument : "var" "irandom(100)"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "augment_mod"
	if(irandom(100) < augment_mod){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 388F5375
		/// @DnDInput : 2
		/// @DnDParent : 2AE146B8
		/// @DnDArgument : "expr" "name_mods[irandom(array_length(name_mods) - 1)]"
		/// @DnDArgument : "expr_1" "augment + " ""
		/// @DnDArgument : "expr_relative_1" "1"
		/// @DnDArgument : "var" "augment"
		/// @DnDArgument : "var_1" "name"
		augment = name_mods[irandom(array_length(name_mods) - 1)];
		name += augment + " ";}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 55EB50D3
	/// @DnDComment : // If there is no augment, save it as such
	/// @DnDParent : 43F8E065
	else{	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5A5B6B24
		/// @DnDParent : 55EB50D3
		/// @DnDArgument : "expr" ""NONE""
		/// @DnDArgument : "var" "augment"
		augment = "NONE";}}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 0FF6268A
/// @DnDComment : // Otherwise, remove the augment from the save and apply it here
else{	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4203ADD4
	/// @DnDInput : 2
	/// @DnDParent : 0FF6268A
	/// @DnDArgument : "expr" "global.save.enemy_augments[global.save.enemy_diff]"
	/// @DnDArgument : "expr_1" """"
	/// @DnDArgument : "var" "augment"
	/// @DnDArgument : "var_1" "global.save.enemy_augments[global.save.enemy_diff]"
	augment = global.save.enemy_augments[global.save.enemy_diff];
	global.save.enemy_augments[global.save.enemy_diff] = "";

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3A43A58F
	/// @DnDParent : 0FF6268A
	/// @DnDArgument : "var" "augment"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" ""NONE""
	if(!(augment == "NONE")){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 327E943F
		/// @DnDParent : 3A43A58F
		/// @DnDArgument : "expr" "augment + " ""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += augment + " ";}}

/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 65BB8B3E
/// @DnDComment : // Name the enemy based on the difficulty
/// @DnDArgument : "expr" "global.save.enemy_diff"
var l65BB8B3E_0 = global.save.enemy_diff;switch(l65BB8B3E_0){	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 7522878F
	/// @DnDParent : 65BB8B3E
	case 0:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7C4F7CB8
		/// @DnDParent : 7522878F
		/// @DnDArgument : "expr" ""Planetary Wasp""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Planetary Wasp";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 6CD41536
	/// @DnDParent : 65BB8B3E
	/// @DnDArgument : "const" "1"
	case 1:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 529229C1
		/// @DnDParent : 6CD41536
		/// @DnDArgument : "expr" ""Interstellar Ant""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Interstellar Ant";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 4AB2BB05
	/// @DnDParent : 65BB8B3E
	/// @DnDArgument : "const" "2"
	case 2:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 31B2C5A9
		/// @DnDParent : 4AB2BB05
		/// @DnDArgument : "expr" ""Strange Beetle""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Strange Beetle";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 2577972A
	/// @DnDParent : 65BB8B3E
	/// @DnDArgument : "const" "3"
	case 3:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 722BBAA6
		/// @DnDParent : 2577972A
		/// @DnDArgument : "expr" ""Advanced Wasp""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Advanced Wasp";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 3D2132BD
	/// @DnDParent : 65BB8B3E
	/// @DnDArgument : "const" "4"
	case 4:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 78CE08B1
		/// @DnDParent : 3D2132BD
		/// @DnDArgument : "expr" ""Lunar Ant""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Lunar Ant";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 63B6C239
	/// @DnDParent : 65BB8B3E
	/// @DnDArgument : "const" "5"
	case 5:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 11E5A506
		/// @DnDParent : 63B6C239
		/// @DnDArgument : "expr" ""Experimental Beetle""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Experimental Beetle";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 375905DB
	/// @DnDParent : 65BB8B3E
	/// @DnDArgument : "const" "6"
	case 6:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1C787225
		/// @DnDParent : 375905DB
		/// @DnDArgument : "expr" ""Cosmic Wasp""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Cosmic Wasp";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 1AA2E480
	/// @DnDParent : 65BB8B3E
	/// @DnDArgument : "const" "7"
	case 7:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6E9F2E49
		/// @DnDParent : 1AA2E480
		/// @DnDArgument : "expr" ""Stellar Ant""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Stellar Ant";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 5E99D7B5
	/// @DnDParent : 65BB8B3E
	/// @DnDArgument : "const" "8"
	case 8:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 28DF5362
		/// @DnDParent : 5E99D7B5
		/// @DnDArgument : "expr" ""Infinite Beetle""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Infinite Beetle";	break;}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 665B7AE7
/// @DnDComment : // Rename the enemy in the name plate$(13_10)// Reset the max health
/// @DnDInput : 2
/// @DnDArgument : "expr" "name"
/// @DnDArgument : "expr_1" "10"
/// @DnDArgument : "var" "name_plate.name"
/// @DnDArgument : "var_1" "max_hp"
name_plate.name = name;
max_hp = 10;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 132F4DC6
/// @DnDComment : // Enemies have different maximum health amounts depending on the enemy's difficulty$(13_10)// At level 0, it starts at 5, moves up to at 1 per enemy defeated, and then that amount goes up by 1 each enemy past 6
/// @DnDArgument : "var" "global.save.enemy_diff"
if(global.save.enemy_diff == 0){	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3BD8195B
	/// @DnDInput : 3
	/// @DnDParent : 132F4DC6
	/// @DnDArgument : "var" "add"
	/// @DnDArgument : "value" "min(4, global.save.enemy_num[global.save.enemy_diff])"
	/// @DnDArgument : "var_1" "n"
	/// @DnDArgument : "value_1" "max(0, global.save.enemy_num[global.save.enemy_diff] - 4)"
	/// @DnDArgument : "var_2" "sum"
	/// @DnDArgument : "value_2" "(n * (n + 1)) / 2"
	var add = min(4, global.save.enemy_num[global.save.enemy_diff]);
	var n = max(0, global.save.enemy_num[global.save.enemy_diff] - 4);
	var sum = (n * (n + 1)) / 2;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 523D25E3
	/// @DnDParent : 132F4DC6
	/// @DnDArgument : "expr" "5 + add + sum"
	/// @DnDArgument : "var" "max_hp"
	max_hp = 5 + add + sum;}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 727FC7BE
else{	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4CCBC038
	/// @DnDComment : // Regular enemies' hp goes up by 10 after the first enemy defeated and then that amount goes up by 1$(13_10)// For every difficulty past the initial, the increase is multiplied by 10
	/// @DnDParent : 727FC7BE
	/// @DnDArgument : "var" "global.save.enemy_num[global.save.enemy_diff]"
	/// @DnDArgument : "not" "1"
	if(!(global.save.enemy_num[global.save.enemy_diff] == 0)){	/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 14825796
		/// @DnDComment : // Build the sum of all numbers above and including 10 and the number of this enemy defeated to add to the hp
		/// @DnDInput : 2
		/// @DnDParent : 4CCBC038
		/// @DnDArgument : "var" "n"
		/// @DnDArgument : "value" "9 + global.save.enemy_num[global.save.enemy_diff]"
		/// @DnDArgument : "var_1" "sum"
		/// @DnDArgument : "value_1" "(n * (n + 1)) / 2"
		var n = 9 + global.save.enemy_num[global.save.enemy_diff];
		var sum = (n * (n + 1)) / 2;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6330E25F
		/// @DnDParent : 4CCBC038
		/// @DnDArgument : "expr" "-45"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "sum"
		sum += -45;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5F7FF0D4
		/// @DnDComment : // Add 100 to reach the basic health level
		/// @DnDInput : 2
		/// @DnDParent : 4CCBC038
		/// @DnDArgument : "expr" "100 + sum"
		/// @DnDArgument : "expr_1" "max_hp * power(10, global.save.enemy_diff - 1)"
		/// @DnDArgument : "var" "max_hp"
		/// @DnDArgument : "var_1" "max_hp"
		max_hp = 100 + sum;
		max_hp = max_hp * power(10, global.save.enemy_diff - 1);}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 21E6CA2C
	/// @DnDComment : // However, we don't want to add anything if no enemies at this level have been defeated yet
	/// @DnDParent : 727FC7BE
	else{	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6954B289
		/// @DnDInput : 2
		/// @DnDParent : 21E6CA2C
		/// @DnDArgument : "expr" "100"
		/// @DnDArgument : "expr_1" "max_hp * power(10, global.save.enemy_diff - 1)"
		/// @DnDArgument : "var" "max_hp"
		/// @DnDArgument : "var_1" "max_hp"
		max_hp = 100;
		max_hp = max_hp * power(10, global.save.enemy_diff - 1);}}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3383D07D
/// @DnDComment : // Set the current hp level to equal the max hp
/// @DnDArgument : "expr" "max_hp"
/// @DnDArgument : "var" "hp"
hp = max_hp;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 57DA700D
/// @DnDComment : // If the enemy has been damaged at another time and its health has been saved, instead make that the current hp value
/// @DnDArgument : "var" "global.save.enemy_hp[global.save.enemy_diff]"
/// @DnDArgument : "not" "1"
if(!(global.save.enemy_hp[global.save.enemy_diff] == 0)){	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 596D482B
	/// @DnDInput : 2
	/// @DnDParent : 57DA700D
	/// @DnDArgument : "expr" "global.save.enemy_hp[global.save.enemy_diff]"
	/// @DnDArgument : "var" "hp"
	/// @DnDArgument : "var_1" "global.save.enemy_hp[global.save.enemy_diff]"
	hp = global.save.enemy_hp[global.save.enemy_diff];
	global.save.enemy_hp[global.save.enemy_diff] = 0;}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2A27F1C9
/// @DnDComment : // Reset fire damage
/// @DnDInput : 3
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "onfire"
/// @DnDArgument : "var_1" "fire_timer"
/// @DnDArgument : "var_2" "fire_ticks"
onfire = false;
fire_timer = 0;
fire_ticks = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3426C89B
/// @DnDComment : // Set out the amount of gold this enemy is worth when defeated
/// @DnDInput : 2
/// @DnDArgument : "expr" "5"
/// @DnDArgument : "expr_1" "gold * power(10, global.save.enemy_diff)"
/// @DnDArgument : "var" "gold"
/// @DnDArgument : "var_1" "gold"
gold = 5;
gold = gold * power(10, global.save.enemy_diff);

/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 270E25DA
/// @DnDComment : // Enact the augment's effects on the enemy if it has one
/// @DnDArgument : "expr" "augment"
var l270E25DA_0 = augment;switch(l270E25DA_0){	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 397088DF
	/// @DnDComment : // Tough means hp increases
	/// @DnDParent : 270E25DA
	/// @DnDArgument : "const" ""Tough""
	case "Tough":	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 36555832
		/// @DnDParent : 397088DF
		/// @DnDArgument : "expr" "round(max_hp * 1.5)"
		/// @DnDArgument : "var" "max_hp"
		max_hp = round(max_hp * 1.5);	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 286CF8B5
	/// @DnDComment : // Rich means double gold value
	/// @DnDParent : 270E25DA
	/// @DnDArgument : "const" ""Rich""
	case "Rich":	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3472072D
		/// @DnDParent : 286CF8B5
		/// @DnDArgument : "expr" "gold * 2"
		/// @DnDArgument : "var" "gold"
		gold = gold * 2;	break;}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 1E27F8FC
/// @DnDComment : // Trigger any on-appear effects
/// @DnDApplyTo : obj_game_manager
/// @DnDArgument : "function" "on_appear"
with(obj_game_manager) {
	on_appear();
}