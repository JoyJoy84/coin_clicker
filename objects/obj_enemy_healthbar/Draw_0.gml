/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 75B95D19
/// @DnDComment : // Draw the background
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 6E2446C0
/// @DnDComment : // Set the font
/// @DnDArgument : "font" "fnt_UI"
/// @DnDSaveInfo : "font" "fnt_UI"
draw_set_font(fnt_UI);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 20D37F06
/// @DnDComment : // Set the alignment
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 70AEEF7D
/// @DnDComment : // Set the draw colour
/// @DnDArgument : "color" "$FFCDD8EE"
/// @DnDArgument : "alpha" "false"
draw_set_colour($FFCDD8EE & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 47BE720B
/// @DnDComment : // Set the draw opacity
/// @DnDArgument : "alpha" "image_alpha"
draw_set_alpha(image_alpha);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 5DF2488E
/// @DnDComment : // Draw the text in the form of: current hp / maximum hp
/// @DnDArgument : "x" "- sprite_width / 4"
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "caption" ""
/// @DnDArgument : "var" "shorten_num(enemy.hp)"
draw_text(x + - sprite_width / 4, y + 0,  + string(shorten_num(enemy.hp)));

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 54B5E910
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "caption" ""
/// @DnDArgument : "var" ""/""
draw_text(x + 0, y + 0,  + string("/"));

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 5BFA5863
/// @DnDArgument : "x" "sprite_width / 4"
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "caption" ""
/// @DnDArgument : "var" "shorten_num(enemy.max_hp)"
draw_text(x + sprite_width / 4, y + 0,  + string(shorten_num(enemy.max_hp)));

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 50DC7FDB
/// @DnDComment : // Reset the text alignments
draw_set_halign(fa_left);
draw_set_valign(fa_top);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 73BE3BF0
/// @DnDComment : // Reset the draw colour
/// @DnDArgument : "color" "c_white"
/// @DnDArgument : "alpha" "false"
draw_set_colour(c_white & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 32F2B9C7
/// @DnDComment : // Reset the draw alpha
draw_set_alpha(1);