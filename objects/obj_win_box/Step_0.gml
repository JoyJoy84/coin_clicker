/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 4734427A
/// @DnDComment : // If the box isn't fully open yet
/// @DnDArgument : "var" "open"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "true"
if(!(open == true))
{
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 056210C0
	/// @DnDComment : // LERP the current scale towards the target scale
	/// @DnDInput : 2
	/// @DnDParent : 4734427A
	/// @DnDArgument : "value" "lerp(image_xscale, target_xscale, 0.2)"
	/// @DnDArgument : "value_1" "lerp(image_yscale, target_yscale, 0.2)"
	/// @DnDArgument : "instvar" "15"
	/// @DnDArgument : "instvar_1" "16"
	image_xscale = lerp(image_xscale, target_xscale, 0.2);
	image_yscale = lerp(image_yscale, target_yscale, 0.2);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 052956E6
	/// @DnDComment : // Check if the current scale is close enough to the target scale
	/// @DnDParent : 4734427A
	/// @DnDArgument : "var" "abs(1 - image_xscale / target_xscale)"
	/// @DnDArgument : "op" "3"
	/// @DnDArgument : "value" "0.01"
	if(abs(1 - image_xscale / target_xscale) <= 0.01)
	{
		/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 552B9C2D
		/// @DnDComment : // Set the current scale to the target scale
		/// @DnDInput : 2
		/// @DnDParent : 052956E6
		/// @DnDArgument : "value" "target_xscale"
		/// @DnDArgument : "value_1" "target_yscale"
		/// @DnDArgument : "instvar" "15"
		/// @DnDArgument : "instvar_1" "16"
		image_xscale = target_xscale;
		image_yscale = target_yscale;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 38604C5F
		/// @DnDComment : // Flag that the box is fully open
		/// @DnDParent : 052956E6
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "open"
		open = true;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 7853D7CB
		/// @DnDComment : // Create the buttons
		/// @DnDInput : 4
		/// @DnDParent : 052956E6
		/// @DnDArgument : "var" "menu_button"
		/// @DnDArgument : "function" "instance_create_depth"
		/// @DnDArgument : "arg" "x - 200"
		/// @DnDArgument : "arg_1" "y + 100"
		/// @DnDArgument : "arg_2" "depth - 10"
		/// @DnDArgument : "arg_3" "obj_button_menu"
		menu_button = instance_create_depth(x - 200, y + 100, depth - 10, obj_button_menu);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 26A16BA9
		/// @DnDInput : 4
		/// @DnDParent : 052956E6
		/// @DnDArgument : "var" "reset_button"
		/// @DnDArgument : "function" "instance_create_depth"
		/// @DnDArgument : "arg" "x + 200"
		/// @DnDArgument : "arg_1" "y + 100"
		/// @DnDArgument : "arg_2" "depth - 10"
		/// @DnDArgument : "arg_3" "obj_button_reset"
		reset_button = instance_create_depth(x + 200, y + 100, depth - 10, obj_button_reset);
	}
}