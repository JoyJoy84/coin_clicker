/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 198F37A7
/// @DnDComment : // Draw the card regardles of current sprite
draw_self();

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 631C31AB
/// @DnDComment : // If the card's sprite is the front then draw the text onto it
/// @DnDArgument : "var" "sprite_index"
/// @DnDArgument : "value" "spr_card_front"
if(sprite_index == spr_card_front)
{
	/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 6FD6B9B7
	/// @DnDComment : // Draw the icon on the card
	/// @DnDParent : 631C31AB
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "-55 * image_yscale"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "xscale" "sprite_scale * image_xscale"
	/// @DnDArgument : "yscale" "sprite_scale * image_yscale"
	/// @DnDArgument : "rot_relative" "1"
	/// @DnDArgument : "sprite" "sprite"
	draw_sprite_ext(sprite, 0, x + 0, y + -55 * image_yscale, sprite_scale * image_xscale, sprite_scale * image_yscale, image_angle + 0, $FFFFFF & $ffffff, 1);

	/// @DnDAction : YoYo Games.Drawing.Set_Alignment
	/// @DnDVersion : 1.1
	/// @DnDHash : 069C5D30
	/// @DnDComment : // Set the alignments
	/// @DnDParent : 631C31AB
	/// @DnDArgument : "halign" "fa_center"
	/// @DnDArgument : "valign" "fa_middle"
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	/// @DnDAction : YoYo Games.Drawing.Set_Font
	/// @DnDVersion : 1
	/// @DnDHash : 61EC84A8
	/// @DnDComment : // Set the font for the card's name
	/// @DnDParent : 631C31AB
	/// @DnDArgument : "font" "fnt_card_name"
	/// @DnDSaveInfo : "font" "fnt_card_name"
	draw_set_font(fnt_card_name);

	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 18366F8E
	/// @DnDComment : // Set the draw colour
	/// @DnDParent : 631C31AB
	/// @DnDArgument : "color" "$FFCDD8EE"
	draw_set_colour($FFCDD8EE & $ffffff);
	var l18366F8E_0=($FFCDD8EE >> 24);
	draw_set_alpha(l18366F8E_0 / $ff);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 3917C138
	/// @DnDComment : // Draw the card's name
	/// @DnDParent : 631C31AB
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "9 * image_yscale"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "xscale" "0"
	/// @DnDArgument : "xscale_relative" "1"
	/// @DnDArgument : "yscale" "0"
	/// @DnDArgument : "yscale_relative" "1"
	/// @DnDArgument : "caption" ""
	/// @DnDArgument : "text" "name"
	/// @DnDArgument : "angle" "image_angle"
	draw_text_transformed(x + 0, y + 9 * image_yscale, "" + string(name), image_xscale + 0, image_yscale + 0, image_angle);

	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 04CA77F6
	/// @DnDComment : // Reset the draw colour
	/// @DnDParent : 631C31AB
	draw_set_colour($FFFFFFFF & $ffffff);
	var l04CA77F6_0=($FFFFFFFF >> 24);
	draw_set_alpha(l04CA77F6_0 / $ff);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6B13F343
	/// @DnDComment : // Shorten the card's dps amount
	/// @DnDParent : 631C31AB
	/// @DnDArgument : "var" "_dps"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "shorten_num"
	/// @DnDArgument : "arg" "dps"
	var _dps = shorten_num(dps);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 52D582A9
	/// @DnDComment : // Write the text onto the card with the same scaling as the card so it looks like one piece
	/// @DnDInput : 7
	/// @DnDParent : 631C31AB
	/// @DnDArgument : "function" "draw_text_line"
	/// @DnDArgument : "arg" "fnt_card"
	/// @DnDArgument : "arg_1" ""DPS: " + _dps + "\n" + description"
	/// @DnDArgument : "arg_2" "x"
	/// @DnDArgument : "arg_3" "y + 72 * image_yscale"
	/// @DnDArgument : "arg_4" "image_xscale"
	/// @DnDArgument : "arg_5" "image_yscale"
	/// @DnDArgument : "arg_6" "160"
	draw_text_line(fnt_card, "DPS: " + _dps + "\n" + description, x, y + 72 * image_yscale, image_xscale, image_yscale, 160);

	/// @DnDAction : YoYo Games.Drawing.Set_Alignment
	/// @DnDVersion : 1.1
	/// @DnDHash : 14650F37
	/// @DnDComment : // Reset the alignment
	/// @DnDParent : 631C31AB
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}