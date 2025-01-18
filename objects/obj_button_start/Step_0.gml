/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 234DD5DB
/// @DnDComment : // If the "mode" means that the graphic should be getting larger
/// @DnDArgument : "var" "mode"
if(mode == 0)
{
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 0305B447
	/// @DnDComment : // Make the graphic larger$(13_10)// Make the graphic more transparent
	/// @DnDInput : 3
	/// @DnDParent : 234DD5DB
	/// @DnDArgument : "value" "0.005"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "value_1" "0.005"
	/// @DnDArgument : "value_relative_1" "1"
	/// @DnDArgument : "value_2" "-0.01"
	/// @DnDArgument : "value_relative_2" "1"
	/// @DnDArgument : "instvar" "15"
	/// @DnDArgument : "instvar_1" "16"
	/// @DnDArgument : "instvar_2" "13"
	image_xscale += 0.005;
	image_yscale += 0.005;
	image_alpha += -0.01;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 69884DB8
	/// @DnDComment : // If the graphic is at the upper bound
	/// @DnDParent : 234DD5DB
	/// @DnDArgument : "var" "image_xscale"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "1.3"
	if(image_xscale >= 1.3)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 405DD08E
		/// @DnDComment : // Switch to the mode that makes it smaller
		/// @DnDParent : 69884DB8
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "var" "mode"
		mode = 1;
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 02E62A46
/// @DnDComment : // If the graphic should be getting smaller
else
{
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 355E2647
	/// @DnDComment : // Make the graphic smaller$(13_10)// Make the graphic more opaque
	/// @DnDInput : 3
	/// @DnDParent : 02E62A46
	/// @DnDArgument : "value" "-0.005"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "value_1" "-0.005"
	/// @DnDArgument : "value_relative_1" "1"
	/// @DnDArgument : "value_2" "0.01"
	/// @DnDArgument : "value_relative_2" "1"
	/// @DnDArgument : "instvar" "15"
	/// @DnDArgument : "instvar_1" "16"
	/// @DnDArgument : "instvar_2" "13"
	image_xscale += -0.005;
	image_yscale += -0.005;
	image_alpha += 0.01;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 60CD8618
	/// @DnDComment : // If the graphic is at the lower bound
	/// @DnDParent : 02E62A46
	/// @DnDArgument : "var" "image_xscale"
	/// @DnDArgument : "op" "3"
	/// @DnDArgument : "value" "1"
	if(image_xscale <= 1)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 081A4C51
		/// @DnDComment : // Switch to the mode that makes it larger
		/// @DnDParent : 60CD8618
		/// @DnDArgument : "var" "mode"
		mode = 0;
	}
}