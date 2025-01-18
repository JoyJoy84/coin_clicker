/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 0A0C0B89
/// @DnDComment : // Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 0715F6AC
/// @DnDComment : // Create a function to trigger when the button is pressed
/// @DnDArgument : "funcName" "press_function"
function press_function() 
{
	/// @DnDAction : YoYo Games.Game.End_Game
	/// @DnDVersion : 1
	/// @DnDHash : 2E1FA82B
	/// @DnDComment : // Close the game
	/// @DnDParent : 0715F6AC
	game_end();
}