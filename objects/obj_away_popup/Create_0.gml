/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 70B87230
/// @DnDComment : // Create a function to set the 3 important stats
/// @DnDInput : 3
/// @DnDArgument : "funcName" "setup"
/// @DnDArgument : "arg" "time"
/// @DnDArgument : "arg_1" "enemies"
/// @DnDArgument : "arg_2" "gold"
function setup(time, enemies, gold) {	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1CE3082D
	/// @DnDInput : 3
	/// @DnDParent : 70B87230
	/// @DnDArgument : "expr" "time"
	/// @DnDArgument : "expr_1" "enemies"
	/// @DnDArgument : "expr_2" "gold"
	/// @DnDArgument : "var" "time_since"
	/// @DnDArgument : "var_1" "enemies_killed"
	/// @DnDArgument : "var_2" "gold_earned"
	time_since = time;
	enemies_killed = enemies;
	gold_earned = gold;}

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 62F74C0B
/// @DnDArgument : "soundid" "snd_popup"
/// @DnDSaveInfo : "soundid" "snd_popup"
audio_play_sound(snd_popup, 0, 0, 1.0, undefined, 1.0);