/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 25395B21
/// @DnDComment : // Draw the background
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 6E6E4D41
/// @DnDComment : // Set the font
/// @DnDArgument : "font" "fnt_UI"
/// @DnDSaveInfo : "font" "fnt_UI"
draw_set_font(fnt_UI);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 3CAF299B
/// @DnDComment : // Set the alignment
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 6662C178
/// @DnDComment : // Set the draw colour
/// @DnDArgument : "color" "$FFCDD8EE"
/// @DnDArgument : "alpha" "false"
draw_set_colour($FFCDD8EE & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 6EEE69B7
/// @DnDComment : // Set the draw opacity
/// @DnDArgument : "alpha" "image_alpha"
draw_set_alpha(image_alpha);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 044C75F3
/// @DnDComment : // Draw the name
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "caption" ""
/// @DnDArgument : "var" "name"
draw_text(x + 0, y + 0,  + string(name));

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 6462DCD1
/// @DnDComment : // Reset the text alignments
draw_set_halign(fa_left);
draw_set_valign(fa_top);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 25616F08
/// @DnDComment : // Reset the draw colour
/// @DnDArgument : "color" "c_white"
/// @DnDArgument : "alpha" "false"
draw_set_colour(c_white & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 10B4D4CA
/// @DnDComment : // Reset the draw opacity
draw_set_alpha(1);