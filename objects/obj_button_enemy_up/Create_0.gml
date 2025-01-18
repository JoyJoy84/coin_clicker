/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 257A2B31
/// @DnDComment : // Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 21F7740A
/// @DnDComment : // Set up variables to use with transitioning in/out enemies
/// @DnDInput : 2
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "transitioning"
/// @DnDArgument : "var_1" "transition_timer"
transitioning = false;
transition_timer = 0;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 5BB05CDA
/// @DnDArgument : "var" "ac"
/// @DnDArgument : "function" "animcurve_get"
/// @DnDArgument : "arg" "ac_enemy_transition"
ac = animcurve_get(ac_enemy_transition);

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 5B91AF11
/// @DnDComment : // Override the press function$(13_10)// Function to decrease the difficulty of the enemy
/// @DnDArgument : "funcName" "press_function"
function press_function() {	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0AE64301
	/// @DnDComment : // If there is already a transition happening, don't replay the sound effect
	/// @DnDParent : 5B91AF11
	/// @DnDArgument : "var" "transitioning"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	if(!(transitioning == true)){	/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 35065D78
		/// @DnDComment : // Only trigger if the enemy is not already transitioning
		/// @DnDParent : 0AE64301
		/// @DnDArgument : "var" "obj_button_enemy_down.transitioning"
		/// @DnDArgument : "not" "1"
		/// @DnDArgument : "value" "true"
		if(!(obj_button_enemy_down.transitioning == true)){	/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 5629EC77
			/// @DnDComment : // If there is a higher difficulty to go to
			/// @DnDParent : 35065D78
			/// @DnDArgument : "var" "global.save.enemy_diff"
			/// @DnDArgument : "op" "1"
			/// @DnDArgument : "value" "8"
			if(global.save.enemy_diff < 8){	/// @DnDAction : YoYo Games.Audio.Play_Audio
				/// @DnDVersion : 1.1
				/// @DnDHash : 7459131A
				/// @DnDParent : 5629EC77
				/// @DnDArgument : "soundid" "snd_enemy_scroll"
				/// @DnDSaveInfo : "soundid" "snd_enemy_scroll"
				audio_play_sound(snd_enemy_scroll, 0, 0, 1.0, undefined, 1.0);
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 77CE2167
				/// @DnDComment : // Set that this object should transition out the enemy
				/// @DnDParent : 5629EC77
				/// @DnDArgument : "expr" "true"
				/// @DnDArgument : "var" "transitioning"
				transitioning = true;}}}}