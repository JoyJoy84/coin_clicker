/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 19443469
/// @DnDArgument : "funcName" "spawn_tutorial"
/// @DnDArgument : "arg" "tut_setup"
function spawn_tutorial(tut_setup) 
{
	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 614E8DA1
	/// @DnDParent : 19443469
	/// @DnDArgument : "var" "tut"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_tutorial"
	/// @DnDArgument : "layer" ""Popups""
	/// @DnDSaveInfo : "objectid" "obj_tutorial"
	var tut = instance_create_layer(0, 0, "Popups", obj_tutorial);

	/// @DnDAction : YoYo Games.Drawing.Set_Font
	/// @DnDVersion : 1
	/// @DnDHash : 7CB56B1D
	/// @DnDParent : 19443469
	/// @DnDArgument : "font" "fnt_UI"
	/// @DnDSaveInfo : "font" "fnt_UI"
	draw_set_font(fnt_UI);

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 4289A070
	/// @DnDApplyTo : tut
	/// @DnDParent : 19443469
	with(tut) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 661338AE
		/// @DnDInput : 2
		/// @DnDParent : 4289A070
		/// @DnDArgument : "expr" "tut_setup.text"
		/// @DnDArgument : "expr_1" "tut_setup.target_window"
		/// @DnDArgument : "var" "text"
		/// @DnDArgument : "var_1" "target_window"
		text = tut_setup.text;
		target_window = tut_setup.target_window;
	
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 490CE279
		/// @DnDInput : 3
		/// @DnDParent : 4289A070
		/// @DnDArgument : "var" "win_width "
		/// @DnDArgument : "value" "target_window[2] - target_window[0]"
		/// @DnDArgument : "var_1" "win_height"
		/// @DnDArgument : "value_1" "target_window[3] - target_window[1]"
		/// @DnDArgument : "var_2" "center"
		/// @DnDArgument : "value_2" "[0, 0]"
		var win_width  = target_window[2] - target_window[0];
		var win_height = target_window[3] - target_window[1];
		var center = [0, 0];
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0796650F
		/// @DnDInput : 2
		/// @DnDParent : 4289A070
		/// @DnDArgument : "expr" "target_window[0] + win_width / 2"
		/// @DnDArgument : "expr_1" "target_window[1] + win_height / 2"
		/// @DnDArgument : "var" "center[0]"
		/// @DnDArgument : "var_1" "center[1]"
		center[0] = target_window[0] + win_width / 2;
		center[1] = target_window[1] + win_height / 2;
	
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2E9917B8
		/// @DnDInput : 2
		/// @DnDParent : 4289A070
		/// @DnDArgument : "var" "bracket_width"
		/// @DnDArgument : "value" "sprite_get_width(spr_brackets)"
		/// @DnDArgument : "var_1" "bracket_height"
		/// @DnDArgument : "value_1" "sprite_get_height(spr_brackets)"
		var bracket_width = sprite_get_width(spr_brackets);
		var bracket_height = sprite_get_height(spr_brackets);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 32B69108
		/// @DnDInput : 4
		/// @DnDParent : 4289A070
		/// @DnDArgument : "expr" "target_window[0] + 2 * win_width / 5"
		/// @DnDArgument : "expr_1" "target_window[1] + 2 * win_height / 5"
		/// @DnDArgument : "expr_2" "target_window[2] - 2 * win_width / 5"
		/// @DnDArgument : "expr_3" "target_window[3] - 2 * win_height / 5"
		/// @DnDArgument : "var" "window[0]"
		/// @DnDArgument : "var_1" "window[1]"
		/// @DnDArgument : "var_2" "window[2]"
		/// @DnDArgument : "var_3" "window[3]"
		window[0] = target_window[0] + 2 * win_width / 5;
		window[1] = target_window[1] + 2 * win_height / 5;
		window[2] = target_window[2] - 2 * win_width / 5;
		window[3] = target_window[3] - 2 * win_height / 5;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6164CF44
		/// @DnDInput : 4
		/// @DnDParent : 4289A070
		/// @DnDArgument : "expr" "min(window[0], center[0] - bracket_width / 2)"
		/// @DnDArgument : "expr_1" "min(window[1], center[1] - bracket_height / 2)"
		/// @DnDArgument : "expr_2" "max(window[2], center[0] + bracket_width / 2)"
		/// @DnDArgument : "expr_3" "max(window[3], center[1] + bracket_height / 2)"
		/// @DnDArgument : "var" "window[0]"
		/// @DnDArgument : "var_1" "window[1]"
		/// @DnDArgument : "var_2" "window[2]"
		/// @DnDArgument : "var_3" "window[3]"
		window[0] = min(window[0], center[0] - bracket_width / 2);
		window[1] = min(window[1], center[1] - bracket_height / 2);
		window[2] = max(window[2], center[0] + bracket_width / 2);
		window[3] = max(window[3], center[1] + bracket_height / 2);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6F30B260
		/// @DnDParent : 4289A070
		/// @DnDArgument : "expr" "tut_setup.next_method"
		/// @DnDArgument : "var" "next_spawn_method"
		next_spawn_method = tut_setup.next_method;
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 65E439F2
/// @DnDArgument : "funcName" "spawn_tut_enemy"
function spawn_tut_enemy() 
{
	/// @DnDAction : YoYo Games.Common.Execute_Code
	/// @DnDVersion : 1
	/// @DnDHash : 0D62BE41
	/// @DnDParent : 65E439F2
	/// @DnDArgument : "code" "var tut_setup = { $(13_10)		text : "Use the arrows to switch enemy\nTougher enemies give greater rewards!",$(13_10)		target_window : [590, 340, 1330, 480],$(13_10)		next_method : spawn_tut_cards$(13_10)	};"
	var tut_setup = { 
			text : "Use the arrows to switch enemy\nTougher enemies give greater rewards!",
			target_window : [590, 340, 1330, 480],
			next_method : spawn_tut_cards
		};

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 72F707DF
	/// @DnDParent : 65E439F2
	/// @DnDArgument : "function" "spawn_tutorial"
	/// @DnDArgument : "arg" "tut_setup"
	spawn_tutorial(tut_setup);
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 11AE0885
/// @DnDArgument : "funcName" "spawn_tut_difficulty"
function spawn_tut_difficulty() 
{
	/// @DnDAction : YoYo Games.Common.Execute_Code
	/// @DnDVersion : 1
	/// @DnDHash : 0EC68799
	/// @DnDParent : 11AE0885
	/// @DnDArgument : "code" "var tut_setup = { $(13_10)		text : "Use the arrows to switch enemy\nTougher enemies give greater rewards!",$(13_10)		target_window : [590, 340, 1330, 480],$(13_10)		next_method : spawn_tut_cards$(13_10)	};"
	var tut_setup = { 
			text : "Use the arrows to switch enemy\nTougher enemies give greater rewards!",
			target_window : [590, 340, 1330, 480],
			next_method : spawn_tut_cards
		};

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 0316227C
	/// @DnDParent : 11AE0885
	/// @DnDArgument : "function" "spawn_tutorial"
	/// @DnDArgument : "arg" "tut_setup"
	spawn_tutorial(tut_setup);
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 3F0A06EE
/// @DnDArgument : "funcName" "spawn_tut_cards"
function spawn_tut_cards() 
{
	/// @DnDAction : YoYo Games.Common.Execute_Code
	/// @DnDVersion : 1
	/// @DnDHash : 5A463CE6
	/// @DnDParent : 3F0A06EE
	/// @DnDArgument : "code" "var tut_setup = { $(13_10)		text : "Use gold to unlock cards and increase your DPS\nand gain new abilities!",$(13_10)		target_window : [100, 350, 476, 750],$(13_10)		next_method : 0$(13_10)	};"
	var tut_setup = { 
			text : "Use gold to unlock cards and increase your DPS\nand gain new abilities!",
			target_window : [100, 350, 476, 750],
			next_method : 0
		};

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6AA9ED3C
	/// @DnDParent : 3F0A06EE
	/// @DnDArgument : "function" "spawn_tutorial"
	/// @DnDArgument : "arg" "tut_setup"
	spawn_tutorial(tut_setup);
}