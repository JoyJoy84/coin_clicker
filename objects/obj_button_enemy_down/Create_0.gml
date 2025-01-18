/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 03DA3762
/// @DnDComment : // Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4E74D9EF
/// @DnDComment : // Set up variables to use with transitioning in/out enemies
/// @DnDInput : 2
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "transitioning"
/// @DnDArgument : "var_1" "transition_timer"
transitioning = false;
transition_timer = 0;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 2487594F
/// @DnDArgument : "var" "ac"
/// @DnDArgument : "function" "animcurve_get"
/// @DnDArgument : "arg" "ac_enemy_transition"
ac = animcurve_get(ac_enemy_transition);

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 710EF71D
/// @DnDComment : // Override the press function$(13_10)// Function to decrease the difficulty of the enemy
/// @DnDArgument : "funcName" "press_function"
function press_function() {	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 054D7022
	/// @DnDComment : // If there is already a transition happening, don't replay the sound effect
	/// @DnDParent : 710EF71D
	/// @DnDArgument : "var" "transitioning"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	if(!(transitioning == true)){	/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4C7FC5B0
		/// @DnDComment : // Only trigger if the enemy is not already transitioning
		/// @DnDParent : 054D7022
		/// @DnDArgument : "var" "obj_button_enemy_up.transitioning"
		/// @DnDArgument : "not" "1"
		/// @DnDArgument : "value" "true"
		if(!(obj_button_enemy_up.transitioning == true)){	/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 725F20F1
			/// @DnDComment : // If there is a lower difficulty to go to
			/// @DnDParent : 4C7FC5B0
			/// @DnDArgument : "var" "global.save.enemy_diff"
			/// @DnDArgument : "op" "2"
			if(global.save.enemy_diff > 0){	/// @DnDAction : YoYo Games.Audio.Play_Audio
				/// @DnDVersion : 1.1
				/// @DnDHash : 03A1FBDF
				/// @DnDParent : 725F20F1
				/// @DnDArgument : "soundid" "snd_enemy_scroll"
				/// @DnDSaveInfo : "soundid" "snd_enemy_scroll"
				audio_play_sound(snd_enemy_scroll, 0, 0, 1.0, undefined, 1.0);
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 2ABB691C
				/// @DnDComment : // Set that this object should transition out the enemy
				/// @DnDParent : 725F20F1
				/// @DnDArgument : "expr" "true"
				/// @DnDArgument : "var" "transitioning"
				transitioning = true;}}}}