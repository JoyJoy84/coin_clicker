/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5045F98B
/// @DnDComment : // If there is a pause surface to draw
/// @DnDArgument : "var" "surface_exists(global.paused_surf)"
/// @DnDArgument : "value" "true"
if(surface_exists(global.paused_surf) == true)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 2BB509C6
	/// @DnDComment : // Set the shader to the window shader
	/// @DnDParent : 5045F98B
	/// @DnDArgument : "function" "shader_set"
	/// @DnDArgument : "arg" "sh_draw_window"
	shader_set(sh_draw_window);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6E8235FD
	/// @DnDComment : // Find the shader handles to set the window corners
	/// @DnDInput : 2
	/// @DnDParent : 5045F98B
	/// @DnDArgument : "var" "win_handle"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "shader_get_uniform"
	/// @DnDArgument : "arg" "sh_draw_window"
	/// @DnDArgument : "arg_1" ""window""
	var win_handle = shader_get_uniform(sh_draw_window, "window");

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 7BDDCADB
	/// @DnDInput : 5
	/// @DnDParent : 5045F98B
	/// @DnDArgument : "function" "shader_set_uniform_f"
	/// @DnDArgument : "arg" "win_handle"
	/// @DnDArgument : "arg_1" "window[0]"
	/// @DnDArgument : "arg_2" "window[1]"
	/// @DnDArgument : "arg_3" "window[2]"
	/// @DnDArgument : "arg_4" "window[3]"
	shader_set_uniform_f(win_handle, window[0], window[1], window[2], window[3]);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1CDBBC50
	/// @DnDInput : 2
	/// @DnDParent : 5045F98B
	/// @DnDArgument : "var" "res_handle"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "shader_get_uniform"
	/// @DnDArgument : "arg" "sh_draw_window"
	/// @DnDArgument : "arg_1" ""resolution""
	var res_handle = shader_get_uniform(sh_draw_window, "resolution");

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 4A0D7E7E
	/// @DnDInput : 3
	/// @DnDParent : 5045F98B
	/// @DnDArgument : "function" "shader_set_uniform_f"
	/// @DnDArgument : "arg" "res_handle"
	/// @DnDArgument : "arg_1" "room_width"
	/// @DnDArgument : "arg_2" "room_height"
	shader_set_uniform_f(res_handle, room_width, room_height);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 136FAEBB
	/// @DnDComment : // Draw the pause surface
	/// @DnDParent : 5045F98B
	/// @DnDArgument : "function" "gpu_set_blendenable"
	/// @DnDArgument : "arg" "false"
	gpu_set_blendenable(false);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 070EA4E6
	/// @DnDInput : 3
	/// @DnDParent : 5045F98B
	/// @DnDArgument : "function" "draw_surface"
	/// @DnDArgument : "arg" "global.paused_surf"
	/// @DnDArgument : "arg_1" "0"
	/// @DnDArgument : "arg_2" "0"
	draw_surface(global.paused_surf, 0, 0);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 4EFAA58C
	/// @DnDParent : 5045F98B
	/// @DnDArgument : "function" "gpu_set_blendenable"
	/// @DnDArgument : "arg" "true"
	gpu_set_blendenable(true);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 624F0A7F
	/// @DnDComment : // Reset the shader
	/// @DnDParent : 5045F98B
	/// @DnDArgument : "function" "shader_reset"
	shader_reset();
}

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 3A748157
/// @DnDComment : // Translate the pixel size of the window into a scale size for the brackets
/// @DnDInput : 2
/// @DnDArgument : "var" "window_xscale"
/// @DnDArgument : "value" "(window[2] - window[0] + 24) / sprite_get_width(spr_brackets)"
/// @DnDArgument : "var_1" "window_yscale"
/// @DnDArgument : "value_1" "(window[3] - window[1] + 24) / sprite_get_height(spr_brackets)"
var window_xscale = (window[2] - window[0] + 24) / sprite_get_width(spr_brackets);
var window_yscale = (window[3] - window[1] + 24) / sprite_get_height(spr_brackets);

/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
/// @DnDVersion : 1
/// @DnDHash : 54D7B95C
/// @DnDComment : // Draw the brackets - they are 9-sliced so the corners will line up
/// @DnDArgument : "x" "window[0] - 12"
/// @DnDArgument : "y" "window[1] - 12"
/// @DnDArgument : "xscale" "window_xscale"
/// @DnDArgument : "yscale" "window_yscale"
/// @DnDArgument : "sprite" "spr_brackets"
/// @DnDSaveInfo : "sprite" "spr_brackets"
draw_sprite_ext(spr_brackets, 0, window[0] - 12, window[1] - 12, window_xscale, window_yscale, 0, $FFFFFF & $ffffff, 1);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 4A9397B0
/// @DnDComment : // Set the text alignments
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 01399633
/// @DnDComment : // Set the font
/// @DnDArgument : "font" "fnt_HUD"
/// @DnDSaveInfo : "font" "fnt_HUD"
draw_set_font(fnt_HUD);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 30C5A3F9
/// @DnDComment : // Draw the text
/// @DnDArgument : "x" "room_width / 2"
/// @DnDArgument : "y" "938"
/// @DnDArgument : "caption" ""
/// @DnDArgument : "var" "text"
draw_text(room_width / 2, 938,  + string(text));

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 6FE153F8
/// @DnDComment : // Reset the text alignments
draw_set_halign(fa_left);
draw_set_valign(fa_top);