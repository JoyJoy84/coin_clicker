/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 3E761EA2
/// @DnDComment : // Resume the game
/// @DnDArgument : "function" "resume_everything"
resume_everything();

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 10BC40F0
/// @DnDArgument : "function" "instance_activate_object"
/// @DnDArgument : "arg" "obj_button_options"
instance_activate_object(obj_button_options);

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 7B760268
/// @DnDArgument : "value" "false"
/// @DnDArgument : "var" "paused"
global.paused = false;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 14C65D45
/// @DnDArgument : "function" "surface_free"
/// @DnDArgument : "arg" "global.paused_surf"
surface_free(global.paused_surf);

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 5C426F28
/// @DnDComment : // Destroy the buttons
/// @DnDApplyTo : menu_button
with(menu_button) instance_destroy();

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 7006F4CF
/// @DnDApplyTo : reset_button
with(reset_button) instance_destroy();

/// @DnDAction : YoYo Games.Files.If_File_Exists
/// @DnDVersion : 1
/// @DnDHash : 41691E0F
/// @DnDComment : // Delete the save file
/// @DnDArgument : "file" ""idle.sav""
var l41691E0F_0 = file_exists("idle.sav");
if(l41691E0F_0)
{
	/// @DnDAction : YoYo Games.Files.File_Delete
	/// @DnDVersion : 1
	/// @DnDHash : 30941E45
	/// @DnDParent : 41691E0F
	/// @DnDArgument : "file" ""idle.sav""
	file_delete("idle.sav");
}