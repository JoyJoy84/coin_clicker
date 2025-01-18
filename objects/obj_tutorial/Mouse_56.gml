/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 57E75106
/// @DnDComment : // Set that the tutorial should close
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "close"
close = true;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 25CF4094
/// @DnDComment : // Find the width and height of the target window$(13_10)// Find the center of that window
/// @DnDInput : 3
/// @DnDArgument : "var" "win_width"
/// @DnDArgument : "value" "target_window[2] - target_window[0]"
/// @DnDArgument : "var_1" "win_height"
/// @DnDArgument : "value_1" "target_window[3] - target_window[1]"
/// @DnDArgument : "var_2" "center"
/// @DnDArgument : "value_2" "[0, 0]"
var win_width = target_window[2] - target_window[0];
var win_height = target_window[3] - target_window[1];
var center = [0, 0];

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4042D142
/// @DnDInput : 2
/// @DnDArgument : "expr" "window[0] + win_width / 2"
/// @DnDArgument : "expr_1" "window[1] + win_height / 2"
/// @DnDArgument : "var" "center[0]"
/// @DnDArgument : "var_1" "center[1]"
center[0] = window[0] + win_width / 2;
center[1] = window[1] + win_height / 2;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 5B6B588D
/// @DnDComment : // Find the width and height of the bracket sprite
/// @DnDInput : 2
/// @DnDArgument : "var" "bracket_width"
/// @DnDArgument : "value" "sprite_get_width(spr_brackets)"
/// @DnDArgument : "var_1" "bracket_height"
/// @DnDArgument : "value_1" "sprite_get_height(spr_brackets)"
var bracket_width = sprite_get_width(spr_brackets);
var bracket_height = sprite_get_height(spr_brackets);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0319B21B
/// @DnDComment : // Set the target window to 2/5 of its current size
/// @DnDInput : 4
/// @DnDArgument : "expr" "target_window[0] + 2 * win_width / 5"
/// @DnDArgument : "expr_1" "target_window[1] + 2 * win_height / 5"
/// @DnDArgument : "expr_2" "target_window[2] - 2 * win_width / 5"
/// @DnDArgument : "expr_3" "target_window[3] - 2 * win_height / 5"
/// @DnDArgument : "var" "target_window[0]"
/// @DnDArgument : "var_1" "target_window[1]"
/// @DnDArgument : "var_2" "target_window[2]"
/// @DnDArgument : "var_3" "target_window[3]"
target_window[0] = target_window[0] + 2 * win_width / 5;
target_window[1] = target_window[1] + 2 * win_height / 5;
target_window[2] = target_window[2] - 2 * win_width / 5;
target_window[3] = target_window[3] - 2 * win_height / 5;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7F369CED
/// @DnDComment : // Make sure the target window isn't so small it would make the bracket sprite's 9-slicing break
/// @DnDInput : 4
/// @DnDArgument : "expr" "min(target_window[0], center[0] - bracket_width / 2)"
/// @DnDArgument : "expr_1" "min(target_window[1], center[1] - bracket_height / 2)"
/// @DnDArgument : "expr_2" "max(target_window[2], center[0] + bracket_width / 2)"
/// @DnDArgument : "expr_3" "max(target_window[3], center[1] + bracket_height / 2)"
/// @DnDArgument : "var" "target_window[0]"
/// @DnDArgument : "var_1" "target_window[1]"
/// @DnDArgument : "var_2" "target_window[2]"
/// @DnDArgument : "var_3" "target_window[3]"
target_window[0] = min(target_window[0], center[0] - bracket_width / 2);
target_window[1] = min(target_window[1], center[1] - bracket_height / 2);
target_window[2] = max(target_window[2], center[0] + bracket_width / 2);
target_window[3] = max(target_window[3], center[1] + bracket_height / 2);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 27BB670B
/// @DnDArgument : "soundid" "snd_popup"
/// @DnDSaveInfo : "soundid" "snd_popup"
audio_play_sound(snd_popup, 0, 0, 1.0, undefined, 1.0);