/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 4C21AA1C
/// @DnDComment : // Draw the paused surface if the game is paused
/// @DnDArgument : "var" "global.paused"
/// @DnDArgument : "value" "true"
if(global.paused == true)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1C8D4FBB
	/// @DnDComment : // Turn off blending so the main game below doesn't show through
	/// @DnDParent : 4C21AA1C
	/// @DnDArgument : "function" "gpu_set_blendenable"
	/// @DnDArgument : "arg" "false"
	gpu_set_blendenable(false);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 3A12D46E
	/// @DnDComment : // Draw the paused surface
	/// @DnDInput : 3
	/// @DnDParent : 4C21AA1C
	/// @DnDArgument : "function" "draw_surface"
	/// @DnDArgument : "arg" "global.paused_surf"
	/// @DnDArgument : "arg_1" "0"
	/// @DnDArgument : "arg_2" "0"
	draw_surface(global.paused_surf, 0, 0);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6968D2B7
	/// @DnDComment : // Draw the paused surface
	/// @DnDParent : 4C21AA1C
	/// @DnDArgument : "function" "gpu_set_blendenable"
	/// @DnDArgument : "arg" "true"
	gpu_set_blendenable(true);

	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 06F4EDB9
	/// @DnDComment : // Also draw a black rectangle over the screen to make popups more distinct
	/// @DnDParent : 4C21AA1C
	/// @DnDArgument : "color" "c_black"
	draw_set_colour(c_black & $ffffff);
	var l06F4EDB9_0=(c_black >> 24);
	draw_set_alpha(l06F4EDB9_0 / $ff);

	/// @DnDAction : YoYo Games.Drawing.Set_Alpha
	/// @DnDVersion : 1
	/// @DnDHash : 02995FBE
	/// @DnDParent : 4C21AA1C
	/// @DnDArgument : "alpha" "0.3"
	draw_set_alpha(0.3);

	/// @DnDAction : YoYo Games.Drawing.Draw_Rectangle
	/// @DnDVersion : 1
	/// @DnDHash : 6B9A14C8
	/// @DnDParent : 4C21AA1C
	/// @DnDArgument : "x2" "room_width"
	/// @DnDArgument : "y2" "room_height"
	draw_rectangle(0, 0, room_width, room_height, 1);

	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 4DB21199
	/// @DnDParent : 4C21AA1C
	/// @DnDArgument : "color" "c_white"
	draw_set_colour(c_white & $ffffff);
	var l4DB21199_0=(c_white >> 24);
	draw_set_alpha(l4DB21199_0 / $ff);

	/// @DnDAction : YoYo Games.Drawing.Set_Alpha
	/// @DnDVersion : 1
	/// @DnDHash : 6BCD0023
	/// @DnDParent : 4C21AA1C
	draw_set_alpha(1);
}