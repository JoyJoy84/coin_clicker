/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 67FACDE6
/// @DnDComment : // If there is no higher difficulty then the button should be deactivated$(13_10)// To show that it's deactivated, make it slightly transparent
/// @DnDArgument : "var" "global.save.enemy_diff"
/// @DnDArgument : "op" "4"
/// @DnDArgument : "value" "8"
if(global.save.enemy_diff >= 8)
{
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 64D3FB80
	/// @DnDParent : 67FACDE6
	/// @DnDArgument : "value" "0.5"
	/// @DnDArgument : "instvar" "13"
	image_alpha = 0.5;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 699C8FA0
	/// @DnDParent : 67FACDE6
	/// @DnDArgument : "expr" "1"
	/// @DnDArgument : "var" "target_scale"
	target_scale = 1;
}

/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 72724DC6
/// @DnDComment : // Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
/// @DnDVersion : 1
/// @DnDHash : 6C940435
/// @DnDComment : // Reset the image alpha for the next frame
/// @DnDArgument : "value" "1"
/// @DnDArgument : "instvar" "13"
image_alpha = 1;