/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 685588BB
/// @DnDComment : // Save the application surface so it serves as a background for the away popup/tutorials
/// @DnDArgument : "var" "first_run"
/// @DnDArgument : "value" "true"
if(first_run == true)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 196C8589
	/// @DnDComment : // Mark that this is no longer the first frame
	/// @DnDParent : 685588BB
	/// @DnDArgument : "expr" "false"
	/// @DnDArgument : "var" "first_run"
	first_run = false;

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 1FAB5D56
	/// @DnDComment : // Pause the game
	/// @DnDParent : 685588BB
	/// @DnDArgument : "value" "true"
	/// @DnDArgument : "var" "paused"
	global.paused = true;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 0A58574E
	/// @DnDInput : 2
	/// @DnDParent : 685588BB
	/// @DnDArgument : "var" "global.paused_surf"
	/// @DnDArgument : "function" "surface_create"
	/// @DnDArgument : "arg" "room_width"
	/// @DnDArgument : "arg_1" "room_height"
	global.paused_surf = surface_create(room_width, room_height);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 54B4C899
	/// @DnDComment : // Save the application surface
	/// @DnDParent : 685588BB
	/// @DnDArgument : "function" "surface_set_target"
	/// @DnDArgument : "arg" "global.paused_surf"
	surface_set_target(global.paused_surf);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 40050404
	/// @DnDParent : 685588BB
	/// @DnDArgument : "function" "gpu_set_blendenable"
	/// @DnDArgument : "arg" "false"
	gpu_set_blendenable(false);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1ECD5C17
	/// @DnDInput : 3
	/// @DnDParent : 685588BB
	/// @DnDArgument : "function" "draw_surface"
	/// @DnDArgument : "arg" "application_surface"
	/// @DnDArgument : "arg_1" "0"
	/// @DnDArgument : "arg_2" "0"
	draw_surface(application_surface, 0, 0);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 62C0DFA3
	/// @DnDParent : 685588BB
	/// @DnDArgument : "function" "gpu_set_blendenable"
	/// @DnDArgument : "arg" "true"
	gpu_set_blendenable(true);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 30BCE2A9
	/// @DnDParent : 685588BB
	/// @DnDArgument : "function" "surface_reset_target"
	surface_reset_target();

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 125A06E1
	/// @DnDComment : // Pause all the objects
	/// @DnDParent : 685588BB
	/// @DnDArgument : "function" "pause_everything"
	pause_everything();

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 06AE6B7B
	/// @DnDParent : 685588BB
	/// @DnDArgument : "function" "instance_deactivate_object"
	/// @DnDArgument : "arg" "obj_button_options"
	instance_deactivate_object(obj_button_options);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4375914D
	/// @DnDComment : // Spawn the first tutorial or activate the away popup
	/// @DnDParent : 685588BB
	/// @DnDArgument : "var" "tutorialed"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	if(!(tutorialed == true))
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 76668874
		/// @DnDParent : 4375914D
		/// @DnDArgument : "function" "spawn_tut_enemy"
		spawn_tut_enemy();
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 5F0633EB
	/// @DnDParent : 685588BB
	else
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 2CD7F0CD
		/// @DnDParent : 5F0633EB
		/// @DnDArgument : "function" "instance_activate_object"
		/// @DnDArgument : "arg" "obj_away_popup"
		instance_activate_object(obj_away_popup);
	}
}