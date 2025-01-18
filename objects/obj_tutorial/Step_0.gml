/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 20370E47
/// @DnDComment : // If the tutorial is not fully open yet
/// @DnDArgument : "var" "close"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "true"
if(!(close == true))
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1B838390
	/// @DnDParent : 20370E47
	/// @DnDArgument : "var" "open"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	if(!(open == true))
	{
		/// @DnDAction : YoYo Games.Loops.For_Loop
		/// @DnDVersion : 1
		/// @DnDHash : 519B7D14
		/// @DnDComment : // LERP the current corners towards the target corners
		/// @DnDParent : 1B838390
		/// @DnDArgument : "init_temp" "1"
		/// @DnDArgument : "cond" "i < 4"
		for(var i = 0; i < 4; i += 1) {
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 18D43CE1
			/// @DnDParent : 519B7D14
			/// @DnDArgument : "expr" "lerp(window[i], target_window[i], 0.2)"
			/// @DnDArgument : "var" "window[i]"
			window[i] = lerp(window[i], target_window[i], 0.2);
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1A3D9EA3
		/// @DnDComment : // If the window's corners are close enough to the targets, set them to the target and set the tutorial as open
		/// @DnDParent : 1B838390
		/// @DnDArgument : "var" "abs(window[0] - target_window[0])"
		/// @DnDArgument : "op" "3"
		/// @DnDArgument : "value" "5"
		if(abs(window[0] - target_window[0]) <= 5)
		{
			/// @DnDAction : YoYo Games.Loops.For_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 3EEA07E6
			/// @DnDParent : 1A3D9EA3
			/// @DnDArgument : "init_temp" "1"
			/// @DnDArgument : "cond" "i < 4"
			for(var i = 0; i < 4; i += 1) {
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 2BBEE912
				/// @DnDParent : 3EEA07E6
				/// @DnDArgument : "expr" "target_window[i]"
				/// @DnDArgument : "var" "window[i]"
				window[i] = target_window[i];
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 192DFF0B
			/// @DnDParent : 1A3D9EA3
			/// @DnDArgument : "expr" "true"
			/// @DnDArgument : "var" "open"
			open = true;
		}
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 260DD336
/// @DnDComment : // If the tutorial is should be closing, rpeeat the process
else
{
	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 58467820
	/// @DnDParent : 260DD336
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "i < 4"
	for(var i = 0; i < 4; i += 1) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 206D5DD4
		/// @DnDParent : 58467820
		/// @DnDArgument : "expr" "lerp(window[i], target_window[i], 0.2)"
		/// @DnDArgument : "var" "window[i]"
		window[i] = lerp(window[i], target_window[i], 0.2);
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0CD28C39
	/// @DnDComment : // If it has reached the smallest it should be, destroy the tutorial
	/// @DnDParent : 260DD336
	/// @DnDArgument : "var" "abs(window[0] - target_window[0])"
	/// @DnDArgument : "op" "3"
	/// @DnDArgument : "value" "5"
	if(abs(window[0] - target_window[0]) <= 5)
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 3F30463A
		/// @DnDParent : 0CD28C39
		instance_destroy();
	}
}