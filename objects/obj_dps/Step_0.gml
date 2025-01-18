/// @DnDAction : YoYo Games.Loops.While_Loop
/// @DnDVersion : 1
/// @DnDHash : 5DB5E1B9
/// @DnDComment : // Run through the array and check if the clicks were over a second ago
/// @DnDArgument : "var" "true"
/// @DnDArgument : "value" "true"
while ((true == true)) {
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 39B1F304
	/// @DnDComment : // If there are any clicks to parse
	/// @DnDParent : 5DB5E1B9
	/// @DnDArgument : "var" "array_length(recent_clicks)"
	/// @DnDArgument : "op" "2"
	if(array_length(recent_clicks) > 0)
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 216676C2
		/// @DnDComment : // If the time difference is over a second
		/// @DnDParent : 39B1F304
		/// @DnDArgument : "var" "current_time - recent_clicks[0].time"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "1000"
		if(current_time - recent_clicks[0].time > 1000)
		{
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 3C28AF00
			/// @DnDComment : // Delete the element from the array
			/// @DnDInput : 3
			/// @DnDParent : 216676C2
			/// @DnDArgument : "function" "array_delete"
			/// @DnDArgument : "arg" "recent_clicks"
			/// @DnDArgument : "arg_1" "0"
			/// @DnDArgument : "arg_2" "1"
			array_delete(recent_clicks, 0, 1);
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 22776762
		/// @DnDComment : // Otherwise break the loop
		/// @DnDParent : 39B1F304
		else
		{
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 7864ADD0
			/// @DnDParent : 22776762
			break;
		}
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 3B033EB0
	/// @DnDComment : // Otherwise break the loop
	/// @DnDParent : 5DB5E1B9
	else
	{
		/// @DnDAction : YoYo Games.Loops.Break
		/// @DnDVersion : 1
		/// @DnDHash : 0805096F
		/// @DnDParent : 3B033EB0
		break;
	}
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 034A858C
/// @DnDComment : // Set the baseline dps to the global variable
/// @DnDArgument : "expr" "global.dps"
/// @DnDArgument : "var" "dps"
dps = global.dps;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 71A4087D
/// @DnDComment : //Add the click damage to the dps
/// @DnDInput : 2
/// @DnDArgument : "function" "array_foreach"
/// @DnDArgument : "arg" "recent_clicks"
/// @DnDArgument : "arg_1" "add_to_dps"
array_foreach(recent_clicks, add_to_dps);