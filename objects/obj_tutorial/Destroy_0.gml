/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5A8EDCF4
/// @DnDComment : // If there is another tutorial to spawn after this one, spawn it
/// @DnDArgument : "var" "next_spawn_method"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "false"
if(!(next_spawn_method == false)){	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 0306B26E
	/// @DnDInput : 2
	/// @DnDParent : 5A8EDCF4
	/// @DnDArgument : "function" "method_call"
	/// @DnDArgument : "arg" "next_spawn_method"
	/// @DnDArgument : "arg_1" "[]"
	method_call(next_spawn_method, []);}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 065230C9
/// @DnDComment : // Otherwise resume the game
else{	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1A0B8730
	/// @DnDComment : // Activate the objects
	/// @DnDParent : 065230C9
	/// @DnDArgument : "function" "resume_everything"
	resume_everything();

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1793ECD4
	/// @DnDParent : 065230C9
	/// @DnDArgument : "function" "instance_activate_object"
	/// @DnDArgument : "arg" "obj_button_options"
	instance_activate_object(obj_button_options);

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 17D1B1A2
	/// @DnDComment : // Set that the game is not paused
	/// @DnDParent : 065230C9
	/// @DnDArgument : "value" "false"
	/// @DnDArgument : "var" "paused"
	global.paused = false;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 14ADE5AE
	/// @DnDComment : // Free the pause surface
	/// @DnDParent : 065230C9
	/// @DnDArgument : "function" "surface_free"
	/// @DnDArgument : "arg" "global.paused_surf"
	surface_free(global.paused_surf);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 42BBF49F
	/// @DnDComment : // Spawn the cards
	/// @DnDApplyTo : obj_card_dock
	/// @DnDParent : 065230C9
	/// @DnDArgument : "function" "spawn_cards"
	with(obj_card_dock) {
		spawn_cards();
	}

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 067F4AB6
	/// @DnDParent : 065230C9
	/// @DnDArgument : "soundid" "snd_popup"
	/// @DnDArgument : "pitch" "0.6"
	/// @DnDSaveInfo : "soundid" "snd_popup"
	audio_play_sound(snd_popup, 0, 0, 1.0, undefined, 0.6);}