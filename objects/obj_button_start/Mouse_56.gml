/// @DnDAction : YoYo Games.Collisions.If_Collision_Point
/// @DnDVersion : 1
/// @DnDHash : 2908D2DD
/// @DnDArgument : "x" "mouse_x"
/// @DnDArgument : "y" "mouse_y"
/// @DnDArgument : "obj" "obj_button_parent"
/// @DnDArgument : "notme" "0"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "destroylist" "false"
/// @DnDSaveInfo : "obj" "obj_button_parent"
var l2908D2DD_0 = collision_point(mouse_x, mouse_y, obj_button_parent, true, 0);
if(!(l2908D2DD_0))
{
	/// @DnDAction : YoYo Games.Rooms.Next_Room
	/// @DnDVersion : 1
	/// @DnDHash : 509844B1
	/// @DnDParent : 2908D2DD
	room_goto_next();
}