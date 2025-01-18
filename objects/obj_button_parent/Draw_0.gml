/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 795A9677
/// @DnDComment : // The buttons will have different formats such as an icon on a background, text on a background, or just an icon$(13_10)// If it has a background and an icon
/// @DnDArgument : "var" "has_background"
/// @DnDArgument : "value" "true"
if(has_background == true)
{
	/// @DnDAction : YoYo Games.Drawing.Draw_Self
	/// @DnDVersion : 1
	/// @DnDHash : 6F53087E
	/// @DnDComment : // Draw this object's sprite as the background
	/// @DnDParent : 795A9677
	draw_self();

	/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 3794DE02
	/// @DnDComment : // Draw the icon sprite at the target scale and transparency
	/// @DnDParent : 795A9677
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "xscale" "image_xscale * target_scale"
	/// @DnDArgument : "yscale" "image_yscale * target_scale"
	/// @DnDArgument : "rot_relative" "1"
	/// @DnDArgument : "alpha" "image_alpha"
	/// @DnDArgument : "sprite" "icon"
	/// @DnDArgument : "col" "image_blend"
	draw_sprite_ext(icon, 0, x + 0, y + 0, image_xscale * target_scale, image_yscale * target_scale, image_angle + 0, image_blend & $ffffff, image_alpha);
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 12BBDB91
/// @DnDComment : // Otherwise, if it's a background with text
else
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 20CCC419
	/// @DnDParent : 12BBDB91
	/// @DnDArgument : "var" "has_text"
	/// @DnDArgument : "value" "true"
	if(has_text == true)
	{
		/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
		/// @DnDVersion : 1
		/// @DnDHash : 57C93842
		/// @DnDComment : // Draw this object's background at the target scale
		/// @DnDParent : 20CCC419
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y_relative" "1"
		/// @DnDArgument : "xscale" "image_xscale * target_scale"
		/// @DnDArgument : "yscale" "image_yscale * target_scale"
		/// @DnDArgument : "rot_relative" "1"
		/// @DnDArgument : "sprite" "sprite_index"
		/// @DnDArgument : "col" "image_blend"
		draw_sprite_ext(sprite_index, 0, x + 0, y + 0, image_xscale * target_scale, image_yscale * target_scale, image_angle + 0, image_blend & $ffffff, 1);
	
		/// @DnDAction : YoYo Games.Drawing.Set_Font
		/// @DnDVersion : 1
		/// @DnDHash : 44912869
		/// @DnDComment : // Set the font
		/// @DnDParent : 20CCC419
		/// @DnDArgument : "font" "fnt_UI"
		/// @DnDSaveInfo : "font" "fnt_UI"
		draw_set_font(fnt_UI);
	
		/// @DnDAction : YoYo Games.Drawing.Set_Alignment
		/// @DnDVersion : 1.1
		/// @DnDHash : 09DBDC53
		/// @DnDComment : // Set the text alignments
		/// @DnDParent : 20CCC419
		/// @DnDArgument : "halign" "fa_center"
		/// @DnDArgument : "valign" "fa_middle"
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
		/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
		/// @DnDVersion : 1
		/// @DnDHash : 1F3761D9
		/// @DnDComment : // Draw the text at the target scale
		/// @DnDParent : 20CCC419
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y_relative" "1"
		/// @DnDArgument : "xscale" "image_xscale * target_scale"
		/// @DnDArgument : "yscale" "image_yscale * target_scale"
		/// @DnDArgument : "caption" ""
		/// @DnDArgument : "text" "text"
		/// @DnDArgument : "angle" "image_angle"
		draw_text_transformed(x + 0, y + 0, "" + string(text), image_xscale * target_scale, image_yscale * target_scale, image_angle);
	
		/// @DnDAction : YoYo Games.Drawing.Set_Alignment
		/// @DnDVersion : 1.1
		/// @DnDHash : 7FE71DEE
		/// @DnDComment : // Reset the text alignments
		/// @DnDParent : 20CCC419
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 13D6D72F
	/// @DnDComment : // Otherwise, it's just an icon
	/// @DnDParent : 12BBDB91
	else
	{
		/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
		/// @DnDVersion : 1
		/// @DnDHash : 3A014ADB
		/// @DnDComment : // Draw this object's sprite at the target scale
		/// @DnDParent : 13D6D72F
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y_relative" "1"
		/// @DnDArgument : "xscale" "image_xscale * target_scale"
		/// @DnDArgument : "yscale" "image_yscale * target_scale"
		/// @DnDArgument : "rot_relative" "1"
		/// @DnDArgument : "alpha" "image_alpha"
		/// @DnDArgument : "sprite" "sprite_index"
		/// @DnDArgument : "col" "image_blend"
		draw_sprite_ext(sprite_index, 0, x + 0, y + 0, image_xscale * target_scale, image_yscale * target_scale, image_angle + 0, image_blend & $ffffff, image_alpha);
	}
}