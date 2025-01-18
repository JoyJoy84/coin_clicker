/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 4346E89B
/// @DnDComment : // Draw the icon
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 0B4BE829
/// @DnDComment : // Set the font
/// @DnDArgument : "font" "fnt_HUD"
/// @DnDSaveInfo : "font" "fnt_HUD"
draw_set_font(fnt_HUD);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 444F6BAD
/// @DnDComment : // Set the draw colour
/// @DnDArgument : "color" "$FFCDD8EE"
draw_set_colour($FFCDD8EE & $ffffff);
var l444F6BAD_0=($FFCDD8EE >> 24);
draw_set_alpha(l444F6BAD_0 / $ff);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 3734D524
/// @DnDComment : // Set the text alignment
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
/// @DnDVersion : 1
/// @DnDHash : 3B521995
/// @DnDComment : // Draw the dps amount
/// @DnDArgument : "x" "sprite_width / 2 + 20"
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "55"
/// @DnDArgument : "xscale" "0"
/// @DnDArgument : "xscale_relative" "1"
/// @DnDArgument : "yscale" "0"
/// @DnDArgument : "yscale_relative" "1"
/// @DnDArgument : "caption" "shorten_num(dps) + " DPS""
/// @DnDArgument : "angle" "image_angle"
draw_text_transformed(x + sprite_width / 2 + 20, 55, string(shorten_num(dps) + " DPS") + "", image_xscale + 0, image_yscale + 0, image_angle);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 2960F708
/// @DnDComment : // Reset the draw colour and alignment
draw_set_colour($FFFFFFFF & $ffffff);
var l2960F708_0=($FFFFFFFF >> 24);
draw_set_alpha(l2960F708_0 / $ff);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 1B74D00F
draw_set_halign(fa_left);
draw_set_valign(fa_top);