/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 01606AFB
/// @DnDComment : // Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 2B166333
/// @DnDComment : // Create the function to trigger when the button is pressed
/// @DnDArgument : "funcName" "press_function"
function press_function() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 3FF1A3F8
	/// @DnDComment : // Restart the game
	/// @DnDApplyTo : obj_save_manager
	/// @DnDParent : 2B166333
	with(obj_save_manager) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 470CEE94
		/// @DnDComment : // Reset the save file
		/// @DnDParent : 3FF1A3F8
		/// @DnDArgument : "function" "reset"
		reset();
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 19170A5F
		/// @DnDComment : // Load the new save file
		/// @DnDParent : 3FF1A3F8
		/// @DnDArgument : "function" "load"
		load();
	
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 4F530696
		/// @DnDComment : // Destroy the enemy object and create a new one
		/// @DnDApplyTo : obj_enemy
		/// @DnDParent : 3FF1A3F8
		with(obj_enemy) instance_destroy();
	
		/// @DnDAction : YoYo Games.Instances.Create_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 5E04A31B
		/// @DnDParent : 3FF1A3F8
		/// @DnDArgument : "xpos" "room_width / 2"
		/// @DnDArgument : "ypos" "446"
		/// @DnDArgument : "objectid" "obj_enemy"
		/// @DnDArgument : "layer" ""Enemy""
		/// @DnDSaveInfo : "objectid" "obj_enemy"
		instance_create_layer(room_width / 2, 446, "Enemy", obj_enemy);
	
		/// @DnDAction : YoYo Games.Common.Set_Global
		/// @DnDVersion : 1
		/// @DnDHash : 0581A02C
		/// @DnDComment : // Mark that the game is not won
		/// @DnDParent : 3FF1A3F8
		/// @DnDArgument : "value" "false"
		/// @DnDArgument : "var" "won"
		global.won = false;
	}

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 7A170701
	/// @DnDComment : // Resume the game and destroy the pause menu
	/// @DnDApplyTo : obj_button_options
	/// @DnDParent : 2B166333
	with(obj_button_options) {
		/// @DnDAction : YoYo Games.Common.Set_Global
		/// @DnDVersion : 1
		/// @DnDHash : 532C4A4A
		/// @DnDParent : 7A170701
		/// @DnDArgument : "value" "false"
		/// @DnDArgument : "var" "paused"
		global.paused = false;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 7D20B81B
		/// @DnDParent : 7A170701
		/// @DnDArgument : "function" "surface_free"
		/// @DnDArgument : "arg" "global.paused_surf"
		surface_free(global.paused_surf);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 18069B27
		/// @DnDParent : 7A170701
		/// @DnDArgument : "function" "resume_everything"
		resume_everything();
	
		/// @DnDAction : YoYo Games.Sequences.Sequence_Destroy
		/// @DnDVersion : 1
		/// @DnDHash : 5B01B2E5
		/// @DnDParent : 7A170701
		/// @DnDArgument : "var" "pause_seq"
		layer_sequence_destroy(pause_seq);
	}

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 69F76333
	/// @DnDComment : // Destroy the win UI
	/// @DnDApplyTo : obj_win_box
	/// @DnDParent : 2B166333
	with(obj_win_box) {
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 510879EE
		/// @DnDParent : 69F76333
		instance_destroy();
	}

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 38242318
	/// @DnDComment : // Reset the game manager's abilities
	/// @DnDApplyTo : obj_game_manager
	/// @DnDParent : 2B166333
	with(obj_game_manager) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3D3D9D09
		/// @DnDInput : 3
		/// @DnDParent : 38242318
		/// @DnDArgument : "expr" "[]"
		/// @DnDArgument : "expr_1" "[]"
		/// @DnDArgument : "expr_2" "[]"
		/// @DnDArgument : "var" "onclick_methods"
		/// @DnDArgument : "var_1" "onappear_methods"
		/// @DnDArgument : "var_2" "onkill_methods"
		onclick_methods = [];
		onappear_methods = [];
		onkill_methods = [];
	}

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 5A31AB65
	/// @DnDComment : // Clear the particle effects
	/// @DnDApplyTo : obj_particle_manager
	/// @DnDParent : 2B166333
	with(obj_particle_manager) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 018BAABE
		/// @DnDParent : 5A31AB65
		/// @DnDArgument : "function" "reset"
		reset();
	}
}