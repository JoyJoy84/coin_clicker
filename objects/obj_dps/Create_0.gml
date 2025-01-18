/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 070EF0CC
/// @DnDComment : // Create a function to add the click damage to the dps variable
/// @DnDInput : 2
/// @DnDArgument : "funcName" "add_to_dps"
/// @DnDArgument : "arg" "element"
/// @DnDArgument : "arg_1" "index"
function add_to_dps(element, index) 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5400D03B
	/// @DnDParent : 070EF0CC
	/// @DnDArgument : "expr" "element.damage"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "dps"
	dps += element.damage;
}