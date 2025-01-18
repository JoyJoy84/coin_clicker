/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 26C6042E
/// @DnDComment : // Copy the target draw scale for manipulation
/// @DnDArgument : "var" "draw_scale"
/// @DnDArgument : "value" "target_scale"
var draw_scale = target_scale;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 7EAD63FB
/// @DnDComment : // Find if there are any cards to unlock$(13_10)// Find if any cards exist as a baseline
/// @DnDArgument : "var" "any_locked"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "instance_exists"
/// @DnDArgument : "arg" "obj_card"
var any_locked = instance_exists(obj_card);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 73B2F27E
/// @DnDArgument : "expr" "!any_locked"
/// @DnDArgument : "var" "any_locked"
any_locked = !any_locked;

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 7581D316
/// @DnDApplyTo : obj_card
with(obj_card) {
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2511F971
	/// @DnDParent : 7581D316
	/// @DnDArgument : "var" "unlocked"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	if(!(unlocked == true))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5D5A528C
		/// @DnDParent : 2511F971
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "any_locked"
		any_locked = true;
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 69802BCA
/// @DnDComment : // Check if there is nothing more for the player to unlock
/// @DnDArgument : "expr" "card_unlock > global.save.bank || !any_locked"
if(card_unlock > global.save.bank || !any_locked)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 12112A22
	/// @DnDComment : // Reset the draw scale and set the button to draw in greyscale
	/// @DnDParent : 69802BCA
	/// @DnDArgument : "expr" "1"
	/// @DnDArgument : "var" "draw_scale"
	draw_scale = 1;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 40B560E2
	/// @DnDParent : 69802BCA
	/// @DnDArgument : "function" "shader_set"
	/// @DnDArgument : "arg" "sh_greyscale"
	shader_set(sh_greyscale);
}

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 28417B0D
/// @DnDComment : // Multiply the draw scale by the current image scale to find the proper draw scale$(13_10)// Store the center of the text to draw as 4 pixels above the center of the object
/// @DnDInput : 3
/// @DnDArgument : "var" "draw_xscale"
/// @DnDArgument : "value" "draw_scale * image_xscale"
/// @DnDArgument : "var_1" "draw_yscale"
/// @DnDArgument : "value_1" "draw_scale * image_yscale"
/// @DnDArgument : "var_2" "center_y"
/// @DnDArgument : "value_2" "y - 4"
var draw_xscale = draw_scale * image_xscale;
var draw_yscale = draw_scale * image_yscale;
var center_y = y - 4;

/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
/// @DnDVersion : 1
/// @DnDHash : 772E4BE9
/// @DnDComment : // Draw the background sprite
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "xscale" "draw_xscale"
/// @DnDArgument : "yscale" "draw_yscale"
/// @DnDArgument : "rot_relative" "1"
/// @DnDArgument : "alpha" "image_alpha"
/// @DnDArgument : "sprite" "sprite_index"
/// @DnDArgument : "col" "image_blend"
draw_sprite_ext(sprite_index, 0, x + 0, y + 0, draw_xscale, draw_yscale, image_angle + 0, image_blend & $ffffff, image_alpha);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 58E394AC
/// @DnDComment : // If there are any more locked cards, draw a gold icon
/// @DnDArgument : "var" "any_locked"
/// @DnDArgument : "value" "true"
if(any_locked == true)
{
	/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 162FC54E
	/// @DnDParent : 58E394AC
	/// @DnDArgument : "x" "60 * draw_xscale"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "center_y"
	/// @DnDArgument : "xscale" "draw_xscale * 0.8"
	/// @DnDArgument : "yscale" "draw_yscale * 0.8"
	/// @DnDArgument : "rot_relative" "1"
	/// @DnDArgument : "alpha" "image_alpha"
	/// @DnDArgument : "sprite" "icon"
	/// @DnDArgument : "col" "image_blend"
	draw_sprite_ext(icon, 0, x + 60 * draw_xscale, center_y, draw_xscale * 0.8, draw_yscale * 0.8, image_angle + 0, image_blend & $ffffff, image_alpha);
}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 66C36843
/// @DnDComment : // Reset the shader
/// @DnDArgument : "function" "shader_reset"
shader_reset();

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 353B2D92
/// @DnDComment : // Set the text draw colour depending on if there are any more cards to unlock
/// @DnDArgument : "expr" "card_unlock > global.save.bank || !any_locked"
if(card_unlock > global.save.bank || !any_locked)
{
	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 576CCFC7
	/// @DnDParent : 353B2D92
	/// @DnDArgument : "color" "$FFDCDCDC"
	draw_set_colour($FFDCDCDC & $ffffff);
	var l576CCFC7_0=($FFDCDCDC >> 24);
	draw_set_alpha(l576CCFC7_0 / $ff);
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 5E35DF98
else
{
	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 7223F093
	/// @DnDParent : 5E35DF98
	/// @DnDArgument : "color" "$FFCDD8EE"
	draw_set_colour($FFCDD8EE & $ffffff);
	var l7223F093_0=($FFCDD8EE >> 24);
	draw_set_alpha(l7223F093_0 / $ff);
}

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 7A9BBEEA
/// @DnDComment : // Set the text alignments
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 0D4138D2
/// @DnDComment : // Set the font
/// @DnDArgument : "font" "fnt_UI"
/// @DnDSaveInfo : "font" "fnt_UI"
draw_set_font(fnt_UI);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 289920CC
/// @DnDComment : // Draw the text on the button
/// @DnDArgument : "var" "any_locked"
/// @DnDArgument : "value" "true"
if(any_locked == true)
{
	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 60410FF4
	/// @DnDParent : 289920CC
	/// @DnDArgument : "x" "-60 * draw_xscale"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "center_y"
	/// @DnDArgument : "xscale" "draw_xscale"
	/// @DnDArgument : "yscale" "draw_yscale"
	/// @DnDArgument : "caption" ""
	/// @DnDArgument : "text" ""Unlock""
	/// @DnDArgument : "angle" "image_angle"
	draw_text_transformed(x + -60 * draw_xscale, center_y, "" + string("Unlock"), draw_xscale, draw_yscale, image_angle);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1623D988
	/// @DnDInput : 6
	/// @DnDParent : 289920CC
	/// @DnDArgument : "function" "draw_num"
	/// @DnDArgument : "arg" "x + 100 * draw_scale"
	/// @DnDArgument : "arg_1" "center_y"
	/// @DnDArgument : "arg_2" "draw_xscale"
	/// @DnDArgument : "arg_3" "draw_yscale"
	/// @DnDArgument : "arg_4" "fnt_UI"
	/// @DnDArgument : "arg_5" "card_unlock"
	draw_num(x + 100 * draw_scale, center_y, draw_xscale, draw_yscale, fnt_UI, card_unlock);
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 5DCBB7C0
else
{
	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 44B055A5
	/// @DnDParent : 5DCBB7C0
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "center_y"
	/// @DnDArgument : "xscale" "draw_xscale"
	/// @DnDArgument : "yscale" "draw_yscale"
	/// @DnDArgument : "caption" ""
	/// @DnDArgument : "text" ""All unlocked""
	/// @DnDArgument : "angle" "image_angle"
	draw_text_transformed(x + 0, center_y, "" + string("All unlocked"), draw_xscale, draw_yscale, image_angle);
}

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 2B75BE85
/// @DnDComment : // Reset the text alignment and colour
draw_set_halign(fa_left);
draw_set_valign(fa_top);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 0423429E
draw_set_colour($FFFFFFFF & $ffffff);
var l0423429E_0=($FFFFFFFF >> 24);
draw_set_alpha(l0423429E_0 / $ff);