/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 662219BA
/// @DnDComment : // Set the sprite according to the enemy difficulty$(13_10)// The wasp sprites should be slightly smaller so set their scale
/// @DnDArgument : "expr" "global.save.enemy_diff"
var l662219BA_0 = global.save.enemy_diff;switch(l662219BA_0){	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 4C4FF557
	/// @DnDParent : 662219BA
	case 0:	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 729B21FD
		/// @DnDInput : 3
		/// @DnDParent : 4C4FF557
		/// @DnDArgument : "value" "Enemy1_Pink"
		/// @DnDArgument : "value_1" "0.8"
		/// @DnDArgument : "value_2" "0.8"
		/// @DnDArgument : "instvar" "10"
		/// @DnDArgument : "instvar_1" "15"
		/// @DnDArgument : "instvar_2" "16"
		sprite_index = Enemy1_Pink;
		image_xscale = 0.8;
		image_yscale = 0.8;	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 19C6EF50
	/// @DnDParent : 662219BA
	/// @DnDArgument : "const" "1"
	case 1:	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 2D210ED2
		/// @DnDParent : 19C6EF50
		/// @DnDArgument : "value" "Enemy2_Aqua"
		/// @DnDArgument : "instvar" "10"
		sprite_index = Enemy2_Aqua;	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 3D62625E
	/// @DnDParent : 662219BA
	/// @DnDArgument : "const" "2"
	case 2:	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 2A96BBE6
		/// @DnDParent : 3D62625E
		/// @DnDArgument : "value" "Enemy3_Blue"
		/// @DnDArgument : "instvar" "10"
		sprite_index = Enemy3_Blue;	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 4055B1E0
	/// @DnDParent : 662219BA
	/// @DnDArgument : "const" "3"
	case 3:	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 6D3D7C5B
		/// @DnDInput : 3
		/// @DnDParent : 4055B1E0
		/// @DnDArgument : "value" "Enemy1_Red"
		/// @DnDArgument : "value_1" "0.8"
		/// @DnDArgument : "value_2" "0.8"
		/// @DnDArgument : "instvar" "10"
		/// @DnDArgument : "instvar_1" "15"
		/// @DnDArgument : "instvar_2" "16"
		sprite_index = Enemy1_Red;
		image_xscale = 0.8;
		image_yscale = 0.8;	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 1FF208BA
	/// @DnDParent : 662219BA
	/// @DnDArgument : "const" "4"
	case 4:	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 686EB872
		/// @DnDParent : 1FF208BA
		/// @DnDArgument : "value" "Enemy2_Yellow"
		/// @DnDArgument : "instvar" "10"
		sprite_index = Enemy2_Yellow;	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 1B3F9670
	/// @DnDParent : 662219BA
	/// @DnDArgument : "const" "5"
	case 5:	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 150E9450
		/// @DnDParent : 1B3F9670
		/// @DnDArgument : "value" "Enemy3_Green"
		/// @DnDArgument : "instvar" "10"
		sprite_index = Enemy3_Green;	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 45B8C110
	/// @DnDParent : 662219BA
	/// @DnDArgument : "const" "6"
	case 6:	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 526C3A45
		/// @DnDInput : 3
		/// @DnDParent : 45B8C110
		/// @DnDArgument : "value" "Enemy1_Yellow"
		/// @DnDArgument : "value_1" "0.8"
		/// @DnDArgument : "value_2" "0.8"
		/// @DnDArgument : "instvar" "10"
		/// @DnDArgument : "instvar_1" "15"
		/// @DnDArgument : "instvar_2" "16"
		sprite_index = Enemy1_Yellow;
		image_xscale = 0.8;
		image_yscale = 0.8;	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 7C6A317A
	/// @DnDParent : 662219BA
	/// @DnDArgument : "const" "7"
	case 7:	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 4B9890CA
		/// @DnDParent : 7C6A317A
		/// @DnDArgument : "value" "Enemy2_Green"
		/// @DnDArgument : "instvar" "10"
		sprite_index = Enemy2_Green;	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 26E1C4AB
	/// @DnDParent : 662219BA
	/// @DnDArgument : "const" "8"
	case 8:	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 25E04ABD
		/// @DnDParent : 26E1C4AB
		/// @DnDArgument : "value" "Enemy3_Red"
		/// @DnDArgument : "instvar" "10"
		sprite_index = Enemy3_Red;	break;}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1894BC88
/// @DnDComment : // Set up an augment for the enemy$(13_10)// This is dependent upon the card abilities unlocked$(13_10)// Make a place to store the augment type
/// @DnDArgument : "expr" """"
/// @DnDArgument : "var" "augment"
augment = "";

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 61581DE6
/// @DnDComment : // Set out the augment types$(13_10)// Create a baseline amount that the enemy can be augmented
/// @DnDInput : 2
/// @DnDArgument : "var" "name_mods"
/// @DnDArgument : "value" "[ "Tough", "Rich" ]"
/// @DnDArgument : "var_1" "augment_mod"
/// @DnDArgument : "value_1" "accumulate_stats("augment")"
var name_mods = [ "Tough", "Rich" ];
var augment_mod = accumulate_stats("augment");

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1BA1C661
/// @DnDComment : // Create a place to store the enemy's name
/// @DnDArgument : "expr" """"
/// @DnDArgument : "var" "name"
name = "";

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 352E2319
/// @DnDComment : // If the enemy does not have a saved augment, only then assign it a new one
/// @DnDArgument : "var" "global.save.enemy_augments[global.save.enemy_diff]"
/// @DnDArgument : "value" """"
if(global.save.enemy_augments[global.save.enemy_diff] == ""){	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6447CE90
	/// @DnDComment : // Take the augment amount as a percentage chance to gain a random augment
	/// @DnDParent : 352E2319
	/// @DnDArgument : "var" "random(100)"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "augment_mod"
	if(random(100) < augment_mod){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 36B95B79
		/// @DnDInput : 2
		/// @DnDParent : 6447CE90
		/// @DnDArgument : "expr" "name_mods[irandom(array_length(name_mods) - 1)]"
		/// @DnDArgument : "expr_1" "augment + " ""
		/// @DnDArgument : "var" "augment"
		/// @DnDArgument : "var_1" "name"
		augment = name_mods[irandom(array_length(name_mods) - 1)];
		name = augment + " ";}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 1DA445EA
	/// @DnDComment : // If there is no augment, save it as such
	/// @DnDParent : 352E2319
	else{	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0C9B73B3
		/// @DnDParent : 1DA445EA
		/// @DnDArgument : "expr" ""NONE""
		/// @DnDArgument : "var" "augment"
		augment = "NONE";}}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 43F82172
/// @DnDComment : // Otherwise, remove the augment from the save and apply it here
else{	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 24CDE06D
	/// @DnDInput : 2
	/// @DnDParent : 43F82172
	/// @DnDArgument : "expr" "global.save.enemy_augments[global.save.enemy_diff]"
	/// @DnDArgument : "expr_1" """"
	/// @DnDArgument : "var" "augment"
	/// @DnDArgument : "var_1" "global.save.enemy_augments[global.save.enemy_diff]"
	augment = global.save.enemy_augments[global.save.enemy_diff];
	global.save.enemy_augments[global.save.enemy_diff] = "";

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 65D3065E
	/// @DnDParent : 43F82172
	/// @DnDArgument : "var" "augment"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" ""NONE""
	if(!(augment == "NONE")){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1B67BCFF
		/// @DnDParent : 65D3065E
		/// @DnDArgument : "expr" "augment + " ""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += augment + " ";}}

/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 7D5A0B9A
/// @DnDComment : // Name the enemy based on the difficulty
/// @DnDArgument : "expr" "global.save.enemy_diff"
var l7D5A0B9A_0 = global.save.enemy_diff;switch(l7D5A0B9A_0){	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 749899FB
	/// @DnDParent : 7D5A0B9A
	case 0:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5244328B
		/// @DnDParent : 749899FB
		/// @DnDArgument : "expr" ""Planetary Wasp""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Planetary Wasp";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 3610403A
	/// @DnDParent : 7D5A0B9A
	/// @DnDArgument : "const" "1"
	case 1:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 699D751A
		/// @DnDParent : 3610403A
		/// @DnDArgument : "expr" ""Interstellar Ant""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Interstellar Ant";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 5B85BF82
	/// @DnDParent : 7D5A0B9A
	/// @DnDArgument : "const" "2"
	case 2:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 69D0888A
		/// @DnDParent : 5B85BF82
		/// @DnDArgument : "expr" ""Strange Beetle""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Strange Beetle";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 5303E30E
	/// @DnDParent : 7D5A0B9A
	/// @DnDArgument : "const" "3"
	case 3:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 43BBC63C
		/// @DnDParent : 5303E30E
		/// @DnDArgument : "expr" ""Advanced Wasp""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Advanced Wasp";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 0A0BE29D
	/// @DnDParent : 7D5A0B9A
	/// @DnDArgument : "const" "4"
	case 4:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 45FCAB39
		/// @DnDParent : 0A0BE29D
		/// @DnDArgument : "expr" ""Lunar Ant""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Lunar Ant";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 18AEAF01
	/// @DnDParent : 7D5A0B9A
	/// @DnDArgument : "const" "5"
	case 5:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 79BDCADA
		/// @DnDParent : 18AEAF01
		/// @DnDArgument : "expr" ""Experimental Beetle""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Experimental Beetle";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 1948FF37
	/// @DnDParent : 7D5A0B9A
	/// @DnDArgument : "const" "6"
	case 6:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2E3ACD47
		/// @DnDParent : 1948FF37
		/// @DnDArgument : "expr" ""Cosmic Wasp""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Cosmic Wasp";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 776C970F
	/// @DnDParent : 7D5A0B9A
	/// @DnDArgument : "const" "7"
	case 7:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1EC42E8E
		/// @DnDParent : 776C970F
		/// @DnDArgument : "expr" ""Stellar Ant""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Stellar Ant";	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 3873915E
	/// @DnDParent : 7D5A0B9A
	/// @DnDArgument : "const" "8"
	case 8:	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3140ADCC
		/// @DnDParent : 3873915E
		/// @DnDArgument : "expr" ""Infinite Beetle""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "name"
		name += "Infinite Beetle";	break;}

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 75E4CD53
/// @DnDComment : // Create a name plate to store the enemy's name
/// @DnDArgument : "xpos" "room_width / 2"
/// @DnDArgument : "ypos" "180"
/// @DnDArgument : "var" "name_plate"
/// @DnDArgument : "objectid" "obj_enemy_name"
/// @DnDArgument : "layer" ""UI_Interactible""
/// @DnDSaveInfo : "objectid" "obj_enemy_name"
name_plate = instance_create_layer(room_width / 2, 180, "UI_Interactible", obj_enemy_name);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 60B95E2B
/// @DnDApplyTo : name_plate
/// @DnDArgument : "expr" "other.name"
/// @DnDArgument : "var" "name"
with(name_plate) {
name = other.name;

}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6304CA4E
/// @DnDComment : // Set a place to store the enemy's maximum health
/// @DnDArgument : "expr" "10"
/// @DnDArgument : "var" "max_hp"
max_hp = 10;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0C5B790A
/// @DnDComment : // Enemies have different maximum health amounts depending on the enemy's difficulty$(13_10)// At level 0, it starts at 5, moves up to at 1 per enemy defeated, and then that amount goes up by 1 each enemy past 6
/// @DnDArgument : "var" "global.save.enemy_diff"
if(global.save.enemy_diff == 0){	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 41ABD5C7
	/// @DnDInput : 3
	/// @DnDParent : 0C5B790A
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
	/// @DnDHash : 4EB1CC72
	/// @DnDParent : 0C5B790A
	/// @DnDArgument : "expr" "5 + add + sum"
	/// @DnDArgument : "var" "max_hp"
	max_hp = 5 + add + sum;}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 4AA436A9
/// @DnDComment : // Regular enemies' hp goes up by 10 after the first enemy defeated and then that amount goes up by 1$(13_10)// For every difficulty past the initial, the increase is multiplied by 10
else{	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 31DDED89
	/// @DnDParent : 4AA436A9
	/// @DnDArgument : "var" "global.save.enemy_num[global.save.enemy_diff]"
	/// @DnDArgument : "not" "1"
	if(!(global.save.enemy_num[global.save.enemy_diff] == 0)){	/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 59784BDB
		/// @DnDComment : // Build the sum of all numbers above and including 10 and the number of this enemy defeated to add to the hp
		/// @DnDInput : 2
		/// @DnDParent : 31DDED89
		/// @DnDArgument : "var" "n"
		/// @DnDArgument : "value" "9 + global.save.enemy_num[global.save.enemy_diff]"
		/// @DnDArgument : "var_1" "sum"
		/// @DnDArgument : "value_1" "(n * (n + 1)) / 2"
		var n = 9 + global.save.enemy_num[global.save.enemy_diff];
		var sum = (n * (n + 1)) / 2;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6AE85B2F
		/// @DnDParent : 31DDED89
		/// @DnDArgument : "expr" "-45"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "sum"
		sum += -45;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 09349DF2
		/// @DnDComment : // Add 100 to reach the basic health level
		/// @DnDInput : 2
		/// @DnDParent : 31DDED89
		/// @DnDArgument : "expr" "100 + sum"
		/// @DnDArgument : "expr_1" "max_hp * power(10, global.save.enemy_diff - 1)"
		/// @DnDArgument : "var" "max_hp"
		/// @DnDArgument : "var_1" "max_hp"
		max_hp = 100 + sum;
		max_hp = max_hp * power(10, global.save.enemy_diff - 1);}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 6FC261E8
	/// @DnDComment : // However, we don't want to add anything if no enemies at this level have been defeated yet
	/// @DnDParent : 4AA436A9
	else{	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2A104797
		/// @DnDInput : 2
		/// @DnDParent : 6FC261E8
		/// @DnDArgument : "expr" "100"
		/// @DnDArgument : "expr_1" "max_hp * power(10, global.save.enemy_diff - 1)"
		/// @DnDArgument : "var" "max_hp"
		/// @DnDArgument : "var_1" "max_hp"
		max_hp = 100;
		max_hp = max_hp * power(10, global.save.enemy_diff - 1);}}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 20B162E5
/// @DnDComment : // Set the current hp level to equal the max hp
/// @DnDArgument : "expr" "max_hp"
/// @DnDArgument : "var" "hp"
hp = max_hp;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 531800AF
/// @DnDComment : // If the enemy has been damaged at another time and its health has been saved, instead make that the current hp value
/// @DnDArgument : "var" "global.save.enemy_hp[global.save.enemy_diff]"
/// @DnDArgument : "not" "1"
if(!(global.save.enemy_hp[global.save.enemy_diff] == 0)){	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 64443D90
	/// @DnDInput : 2
	/// @DnDParent : 531800AF
	/// @DnDArgument : "expr" "global.save.enemy_hp[global.save.enemy_diff]"
	/// @DnDArgument : "var" "hp"
	/// @DnDArgument : "var_1" "global.save.enemy_hp[global.save.enemy_diff]"
	hp = global.save.enemy_hp[global.save.enemy_diff];
	global.save.enemy_hp[global.save.enemy_diff] = 0;}

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 511BCF2A
/// @DnDComment : // Create an instance to display the health
/// @DnDArgument : "xpos_relative" "1"
/// @DnDArgument : "ypos" "289"
/// @DnDArgument : "ypos_relative" "1"
/// @DnDArgument : "var" "health_bar"
/// @DnDArgument : "objectid" "obj_enemy_healthbar"
/// @DnDArgument : "layer" ""UI_Interactible""
/// @DnDSaveInfo : "objectid" "obj_enemy_healthbar"
health_bar = instance_create_layer(x + 0, y + 289, "UI_Interactible", obj_enemy_healthbar);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1250963E
/// @DnDApplyTo : health_bar
/// @DnDArgument : "expr" "other"
/// @DnDArgument : "var" "enemy"
with(health_bar) {
enemy = other;

}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2B9ED453
/// @DnDComment : // Set out variables dictating fire
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
/// @DnDHash : 083A890A
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
/// @DnDHash : 52B42DF5
/// @DnDComment : // Enact the augment's effects on the enemy if it has one
/// @DnDArgument : "expr" "augment"
var l52B42DF5_0 = augment;switch(l52B42DF5_0){	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 0BCFFF0B
	/// @DnDComment : // Tough means hp increases
	/// @DnDParent : 52B42DF5
	/// @DnDArgument : "const" ""Tough""
	case "Tough":	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 50D286A7
		/// @DnDParent : 0BCFFF0B
		/// @DnDArgument : "expr" "round(max_hp * 1.5)"
		/// @DnDArgument : "var" "max_hp"
		max_hp = round(max_hp * 1.5);	break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 1D3C84D5
	/// @DnDComment : // Rich means double gold value
	/// @DnDParent : 52B42DF5
	/// @DnDArgument : "const" ""Rich""
	case "Rich":	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6AB135D7
		/// @DnDParent : 1D3C84D5
		/// @DnDArgument : "expr" "gold * 2"
		/// @DnDArgument : "var" "gold"
		gold = gold * 2;	break;}

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 76E52C1A
/// @DnDComment : // Create an instance to show how much gold this enemy is worth
/// @DnDArgument : "xpos" "1248"
/// @DnDArgument : "ypos" "672"
/// @DnDArgument : "var" "gold_indicator"
/// @DnDArgument : "objectid" "obj_gold_indicator"
/// @DnDArgument : "layer" "layer"
/// @DnDSaveInfo : "objectid" "obj_gold_indicator"
gold_indicator = instance_create_layer(1248, 672, layer, obj_gold_indicator);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1C1CAE0D
/// @DnDApplyTo : gold_indicator
/// @DnDArgument : "expr" "other"
/// @DnDArgument : "var" "enemy"
with(gold_indicator) {
enemy = other;

}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 0D6CDE6F
/// @DnDComment : // Trigger any on-appear effects
/// @DnDApplyTo : obj_game_manager
/// @DnDArgument : "function" "on_appear"
with(obj_game_manager) {
	on_appear();
}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 46CBCBFA
/// @DnDComment : // Create a particle system to give the enemy a powerful aura
/// @DnDArgument : "var" "particle"
/// @DnDArgument : "function" "part_system_create"
/// @DnDArgument : "arg" "ps_character_idle"
particle = part_system_create(ps_character_idle);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 2ED01842
/// @DnDInput : 3
/// @DnDArgument : "function" "part_system_position"
/// @DnDArgument : "arg" "particle"
/// @DnDArgument : "arg_1" "x"
/// @DnDArgument : "arg_2" "y + sprite_height / 2"
part_system_position(particle, x, y + sprite_height / 2);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 600F6292
/// @DnDInput : 2
/// @DnDArgument : "function" "part_system_automatic_draw"
/// @DnDArgument : "arg" "particle"
/// @DnDArgument : "arg_1" "false"
part_system_automatic_draw(particle, false);