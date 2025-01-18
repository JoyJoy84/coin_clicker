/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 01327196
/// @DnDComment : // Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 1DCEB6E3
/// @DnDComment : // Create a function to trigger when the button is pressed
/// @DnDArgument : "funcName" "press_function"
function press_function() {	/// @DnDAction : YoYo Games.Audio.Audio_Get_Master_Volume
	/// @DnDVersion : 1
	/// @DnDHash : 43CF1597
	/// @DnDComment : // Set the master gain to the opposite of its current state (muted => unmuted and vice versa)
	/// @DnDParent : 1DCEB6E3
	/// @DnDArgument : "var" "gain"
	gain = audio_get_master_gain(0);

	/// @DnDAction : YoYo Games.Audio.Audo_Set_Master_Volume
	/// @DnDVersion : 1
	/// @DnDHash : 0D575BF2
	/// @DnDParent : 1DCEB6E3
	/// @DnDArgument : "volume" "!gain"
	audio_set_master_gain(0, !gain);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0B741D6A
	/// @DnDComment : // Set the sprite depending on the current master gain mute state
	/// @DnDParent : 1DCEB6E3
	/// @DnDArgument : "var" "gain"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	if(!(gain == true)){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 33675E25
		/// @DnDParent : 0B741D6A
		/// @DnDArgument : "expr" "spr_button_mute"
		/// @DnDArgument : "var" "icon"
		icon = spr_button_mute;}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 08181999
	/// @DnDParent : 1DCEB6E3
	else{	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2523962E
		/// @DnDParent : 08181999
		/// @DnDArgument : "expr" "spr_button_unmute"
		/// @DnDArgument : "var" "icon"
		icon = spr_button_unmute;}}