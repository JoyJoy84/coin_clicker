/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 446EB8EE
/// @DnDComment : // Extract the number of minutes from the amount of time since the last save$(13_10)// Extract the number of seconds remaining in that time$(13_10)// Turn the number of minutes into hours
/// @DnDInput : 3
/// @DnDArgument : "var" "mins"
/// @DnDArgument : "value" "floor(time_since / 60)"
/// @DnDArgument : "var_1" "secs"
/// @DnDArgument : "value_1" "floor(time_since - mins * 60)"
/// @DnDArgument : "var_2" "hours"
/// @DnDArgument : "value_2" "floor(mins / 60)"
var mins = floor(time_since / 60);
var secs = floor(time_since - mins * 60);
var hours = floor(mins / 60);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3D651769
/// @DnDArgument : "expr" "-hours * 60"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "mins"
mins += -hours * 60;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 778452A0
/// @DnDComment : // Create a string with all the information
/// @DnDArgument : "var" "text"
/// @DnDArgument : "value" "string("You have been away for {0}:{1}:{2}!\nYou earned {3} gold!", (hours > 9 ? "" : "0") + string(hours), (mins > 9 ? "" : "0") + string(mins), (secs > 9 ? "" : "0") + string(secs), shorten_num(gold_earned))"
var text = string("You have been away for {0}:{1}:{2}!\nYou earned {3} gold!", (hours > 9 ? "" : "0") + string(hours), (mins > 9 ? "" : "0") + string(mins), (secs > 9 ? "" : "0") + string(secs), shorten_num(gold_earned));

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 7ED42B66
/// @DnDComment : // Align the text to the desired width
/// @DnDInput : 2
/// @DnDArgument : "var" "str"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "align_string"
/// @DnDArgument : "arg" "text"
/// @DnDArgument : "arg_1" "600"
var str = align_string(text, 600);

/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
/// @DnDVersion : 1
/// @DnDHash : 7F1C45E0
/// @DnDComment : // Set the scale so that it fits the text
/// @DnDInput : 2
/// @DnDArgument : "value" "(string_width(str) + 100) / sprite_get_width(sprite_index)"
/// @DnDArgument : "value_1" "(string_height(str) + 100) / sprite_get_height(sprite_index)"
/// @DnDArgument : "instvar" "15"
/// @DnDArgument : "instvar_1" "16"
image_xscale = (string_width(str) + 100) / sprite_get_width(sprite_index);
image_yscale = (string_height(str) + 100) / sprite_get_height(sprite_index);

/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 449A8797
/// @DnDComment : // Draw the box
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 21E61E6A
/// @DnDComment : // Set text alignment
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 0233FC1B
/// @DnDComment : // Set the font and colour
/// @DnDArgument : "font" "fnt_UI"
/// @DnDSaveInfo : "font" "fnt_UI"
draw_set_font(fnt_UI);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 0A6A0A57
/// @DnDArgument : "color" "$FFCDD8EE"
draw_set_colour($FFCDD8EE & $ffffff);
var l0A6A0A57_0=($FFCDD8EE >> 24);
draw_set_alpha(l0A6A0A57_0 / $ff);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 619D437B
/// @DnDComment : // Draw the text
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "caption" ""
/// @DnDArgument : "var" "str"
draw_text(x + 0, y + 0,  + string(str));

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 7E45C0C0
/// @DnDComment : // Reset the alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 68586BF7
/// @DnDComment : // Reset the colour
draw_set_colour($FFFFFFFF & $ffffff);
var l68586BF7_0=($FFFFFFFF >> 24);
draw_set_alpha(l68586BF7_0 / $ff);