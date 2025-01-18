/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 5F657350
/// @DnDComment : // Trigger the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 658C689D
/// @DnDComment : // Set the button's text
/// @DnDInput : 3
/// @DnDArgument : "expr" ""Resume""
/// @DnDArgument : "expr_1" "true"
/// @DnDArgument : "expr_2" "noone"
/// @DnDArgument : "var" "text"
/// @DnDArgument : "var_1" "has_text"
/// @DnDArgument : "var_2" "owner"
text = "Resume";
has_text = true;
owner = noone;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 0B09E304
/// @DnDComment : // Create a function to trigger when the button is pressed
/// @DnDArgument : "funcName" "press_function"
function press_function() 
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 0BA665FE
	/// @DnDComment : // Resume the game
	/// @DnDParent : 0B09E304
	/// @DnDArgument : "value" "false"
	/// @DnDArgument : "var" "paused"
	global.paused = false;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 42D63610
	/// @DnDParent : 0B09E304
	/// @DnDArgument : "function" "surface_free"
	/// @DnDArgument : "arg" "global.paused_surf"
	surface_free(global.paused_surf);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 4D63E095
	/// @DnDParent : 0B09E304
	/// @DnDArgument : "function" "resume_everything"
	resume_everything();

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 10197ED9
	/// @DnDComment : // Destroy the pause menu
	/// @DnDApplyTo : obj_button_options
	/// @DnDParent : 0B09E304
	with(obj_button_options) {
		/// @DnDAction : YoYo Games.Sequences.Sequence_Destroy
		/// @DnDVersion : 1
		/// @DnDHash : 697C56E9
		/// @DnDParent : 10197ED9
		/// @DnDArgument : "var" "pause_seq"
		layer_sequence_destroy(pause_seq);
	}
}