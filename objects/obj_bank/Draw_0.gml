/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 06B826D6
/// @DnDComment : // Draw the icon
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 7F83BB61
/// @DnDComment : // Set the draw colour
/// @DnDArgument : "color" "$FFCDD8EE"
draw_set_colour($FFCDD8EE & $ffffff);
var l7F83BB61_0=($FFCDD8EE >> 24);
draw_set_alpha(l7F83BB61_0 / $ff);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 1CDDC8EB
/// @DnDComment : // Set the vertical text alignment
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 353C669A
/// @DnDComment : // Draw the DPS value
/// @DnDInput : 6
/// @DnDArgument : "function" "draw_num"
/// @DnDArgument : "arg" "x + sprite_width / 2 + 20"
/// @DnDArgument : "arg_1" "y - 3"
/// @DnDArgument : "arg_2" "image_xscale"
/// @DnDArgument : "arg_3" "image_yscale"
/// @DnDArgument : "arg_4" "fnt_HUD"
/// @DnDArgument : "arg_5" "global.save.bank"
draw_num(x + sprite_width / 2 + 20, y - 3, image_xscale, image_yscale, fnt_HUD, global.save.bank);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 161A3CB4
/// @DnDComment : // Reset the colour and the vertical alignment
draw_set_colour($FFFFFFFF & $ffffff);
var l161A3CB4_0=($FFFFFFFF >> 24);
draw_set_alpha(l161A3CB4_0 / $ff);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 2698A28D
draw_set_halign(fa_left);
draw_set_valign(fa_top);