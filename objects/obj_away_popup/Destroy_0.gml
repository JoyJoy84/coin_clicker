/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5C9EC40A
/// @DnDComment : // If the game isn't won, resume the game
/// @DnDArgument : "var" "global.won"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "true"
if(!(global.won == true)){	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 3B622117
	/// @DnDComment : // Reactivate objects
	/// @DnDParent : 5C9EC40A
	/// @DnDArgument : "function" "resume_everything"
	resume_everything();

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 2BDB9EBC
	/// @DnDParent : 5C9EC40A
	/// @DnDArgument : "function" "instance_activate_object"
	/// @DnDArgument : "arg" "obj_button_options"
	instance_activate_object(obj_button_options);

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 43A575E5
	/// @DnDComment : // Set that the game is not paused any more
	/// @DnDParent : 5C9EC40A
	/// @DnDArgument : "value" "false"
	/// @DnDArgument : "var" "paused"
	global.paused = false;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6F971BD0
	/// @DnDComment : // Free the pause surface
	/// @DnDParent : 5C9EC40A
	/// @DnDArgument : "function" "surface_free"
	/// @DnDArgument : "arg" "global.paused_surf"
	surface_free(global.paused_surf);

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 1771D825
	/// @DnDParent : 5C9EC40A
	/// @DnDArgument : "soundid" "snd_popup"
	/// @DnDArgument : "pitch" "0.6"
	/// @DnDSaveInfo : "soundid" "snd_popup"
	audio_play_sound(snd_popup, 0, 0, 1.0, undefined, 0.6);}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 055A46E2
/// @DnDComment : // Otherwise, create the win interface object
else{	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 0913A228
	/// @DnDComment : // Create the object
	/// @DnDParent : 055A46E2
	/// @DnDArgument : "xpos" "room_width / 2"
	/// @DnDArgument : "ypos" "room_height / 2"
	/// @DnDArgument : "objectid" "obj_win_box"
	/// @DnDArgument : "layer" ""Popups""
	/// @DnDSaveInfo : "objectid" "obj_win_box"
	instance_create_layer(room_width / 2, room_height / 2, "Popups", obj_win_box);}