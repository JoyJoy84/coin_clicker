/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0BAB2581
/// @DnDComment : // If there is no lower difficulty then the button should be deactivated$(13_10)// To show that it's deactivated, make it slightly transparent
/// @DnDArgument : "var" "global.save.enemy_diff"
/// @DnDArgument : "op" "3"
if(global.save.enemy_diff <= 0)
{
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 6C02E0C0
	/// @DnDParent : 0BAB2581
	/// @DnDArgument : "value" "0.5"
	/// @DnDArgument : "instvar" "13"
	image_alpha = 0.5;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 14CDE898
	/// @DnDParent : 0BAB2581
	/// @DnDArgument : "expr" "1"
	/// @DnDArgument : "var" "target_scale"
	target_scale = 1;
}

/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 0ECE867C
/// @DnDComment : // Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
/// @DnDVersion : 1
/// @DnDHash : 747E7024
/// @DnDComment : // Reset the image alpha for the next frame
/// @DnDArgument : "value" "1"
/// @DnDArgument : "instvar" "13"
image_alpha = 1;