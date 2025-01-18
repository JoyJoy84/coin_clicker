/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 11A1C1D3
/// @DnDComment : // Draw the text box
draw_self();

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 46E2ACE5
/// @DnDComment : // Only draw the text if it's fully open
/// @DnDArgument : "var" "open"
/// @DnDArgument : "not" "1"
if(!(open == 0))
{
	/// @DnDAction : YoYo Games.Drawing.Set_Alignment
	/// @DnDVersion : 1.1
	/// @DnDHash : 320A3804
	/// @DnDComment : // Set the text alignment
	/// @DnDParent : 46E2ACE5
	/// @DnDArgument : "halign" "fa_center"
	/// @DnDArgument : "valign" "fa_middle"
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	/// @DnDAction : YoYo Games.Drawing.Set_Font
	/// @DnDVersion : 1
	/// @DnDHash : 6523A7D2
	/// @DnDComment : // Set the font
	/// @DnDParent : 46E2ACE5
	/// @DnDArgument : "font" "fnt_UI"
	/// @DnDSaveInfo : "font" "fnt_UI"
	draw_set_font(fnt_UI);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1A3A6B75
	/// @DnDInput : 2
	/// @DnDParent : 46E2ACE5
	/// @DnDArgument : "var" "aligned_text"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "align_string"
	/// @DnDArgument : "arg" "text"
	/// @DnDArgument : "arg_1" "str_length"
	var aligned_text = align_string(text, str_length);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value
	/// @DnDVersion : 1
	/// @DnDHash : 731D948F
	/// @DnDComment : // Draw the text
	/// @DnDParent : 46E2ACE5
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "-100"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "caption" ""
	/// @DnDArgument : "var" "aligned_text"
	draw_text(x + 0, y + -100,  + string(aligned_text));

	/// @DnDAction : YoYo Games.Drawing.Set_Alignment
	/// @DnDVersion : 1.1
	/// @DnDHash : 5C233607
	/// @DnDComment : // Reset the text alignments
	/// @DnDParent : 46E2ACE5
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}