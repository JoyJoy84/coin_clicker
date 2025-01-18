/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 6DDA8EE1
/// @DnDComment : // Draw the background
draw_self();

/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
/// @DnDVersion : 1
/// @DnDHash : 5EBBF463
/// @DnDComment : // Draw a gold coin sprite
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "-20"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "xscale" "0"
/// @DnDArgument : "xscale_relative" "1"
/// @DnDArgument : "yscale" "0"
/// @DnDArgument : "yscale_relative" "1"
/// @DnDArgument : "rot_relative" "1"
/// @DnDArgument : "alpha" "image_alpha"
/// @DnDArgument : "sprite" "spr_gold_coin"
/// @DnDArgument : "col" "image_blend"
/// @DnDSaveInfo : "sprite" "spr_gold_coin"
draw_sprite_ext(spr_gold_coin, 0, x + 0, y + -20, image_xscale + 0, image_yscale + 0, image_angle + 0, image_blend & $ffffff, image_alpha);

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 29094E3A
/// @DnDComment : // Set the font
/// @DnDArgument : "font" "fnt_UI"
/// @DnDSaveInfo : "font" "fnt_UI"
draw_set_font(fnt_UI);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 044437FF
/// @DnDComment : // Set the text alignments
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 3B4A9ED6
/// @DnDComment : // Find how many coins the enemy is worth
/// @DnDArgument : "var" "coins"
/// @DnDArgument : "value" "enemy.gold"
var coins = enemy.gold;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 13B95230
/// @DnDArgument : "var" "num"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "shorten_num"
/// @DnDArgument : "arg" "coins"
var num = shorten_num(coins);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 639F7C31
/// @DnDComment : // Set the draw colour
/// @DnDArgument : "color" "$FFCDD8EE"
draw_set_colour($FFCDD8EE & $ffffff);
var l639F7C31_0=($FFCDD8EE >> 24);
draw_set_alpha(l639F7C31_0 / $ff);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 41538FFE
/// @DnDComment : // Set the draw opacity
/// @DnDArgument : "alpha" "image_alpha"
draw_set_alpha(image_alpha);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 6940BD5D
/// @DnDComment : // Draw that number to the screen
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "25"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "caption" ""
/// @DnDArgument : "var" "num"
draw_text(x + 0, y + 25,  + string(num));

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 65ABC870
/// @DnDComment : // Reset the draw colour
draw_set_colour($FFFFFFFF & $ffffff);
var l65ABC870_0=($FFFFFFFF >> 24);
draw_set_alpha(l65ABC870_0 / $ff);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 1C379B54
/// @DnDComment : // Reset the draw opacity
draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 395BD437
/// @DnDComment : // Reset the text alignments
draw_set_halign(fa_left);
draw_set_valign(fa_top);