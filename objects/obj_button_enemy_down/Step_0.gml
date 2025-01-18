/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0EEA9D42
/// @DnDComment : // If this object should be transitioning out the enemy
/// @DnDArgument : "var" "transitioning"
/// @DnDArgument : "value" "true"
if(transitioning == true)
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1E30BA86
	/// @DnDComment : // If the transition is within the first 0.1 seconds, the original enemy should be transitioning out
	/// @DnDParent : 0EEA9D42
	/// @DnDArgument : "var" "transition_timer"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "0.1"
	if(transition_timer < 0.1)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 42CFD889
		/// @DnDComment : // Increase the time into the transition
		/// @DnDParent : 1E30BA86
		/// @DnDArgument : "expr" "delta_time / 1000000"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "transition_timer"
		transition_timer += delta_time / 1000000;
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 0145C02E
		/// @DnDComment : // Move the enemy off-screen and fade them out according to the animation curve
		/// @DnDApplyTo : obj_enemy
		/// @DnDParent : 1E30BA86
		with(obj_enemy) {
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 37C2F743
			/// @DnDInput : 2
			/// @DnDParent : 0145C02E
			/// @DnDArgument : "var" "xpos_channel"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "animcurve_get_channel"
			/// @DnDArgument : "arg" "other.ac"
			/// @DnDArgument : "arg_1" ""xPosition""
			var xpos_channel = animcurve_get_channel(other.ac, "xPosition");
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 5746C528
			/// @DnDInput : 2
			/// @DnDParent : 0145C02E
			/// @DnDArgument : "var" "xpos"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "animcurve_channel_evaluate"
			/// @DnDArgument : "arg" "xpos_channel"
			/// @DnDArgument : "arg_1" "other.transition_timer * 10"
			var xpos = animcurve_channel_evaluate(xpos_channel, other.transition_timer * 10);
		
			/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
			/// @DnDVersion : 1
			/// @DnDHash : 47731A8F
			/// @DnDInput : 2
			/// @DnDParent : 0145C02E
			/// @DnDArgument : "value" "xstart + xpos"
			/// @DnDArgument : "value_1" "1 - other.transition_timer * 10"
			/// @DnDArgument : "instvar_1" "13"
			x = xstart + xpos;
			image_alpha = 1 - other.transition_timer * 10;
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 31801250
		/// @DnDComment : // If the time element is at 0.1 seconds, move to the second phase of the transition
		/// @DnDParent : 1E30BA86
		/// @DnDArgument : "var" "transition_timer"
		/// @DnDArgument : "op" "4"
		/// @DnDArgument : "value" "0.1"
		if(transition_timer >= 0.1)
		{
			/// @DnDAction : YoYo Games.Instances.Destroy_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 4CDCB8FA
			/// @DnDComment : // Destroy the current enemy
			/// @DnDApplyTo : obj_enemy
			/// @DnDParent : 31801250
			with(obj_enemy) instance_destroy();
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1B6A0E80
			/// @DnDParent : 31801250
			/// @DnDArgument : "expr" "-1"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "global.save.enemy_diff"
			global.save.enemy_diff += -1;
		
			/// @DnDAction : YoYo Games.Instances.Create_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 7731B88F
			/// @DnDComment : // Create a new enemy on the other side of the screen and hide it
			/// @DnDParent : 31801250
			/// @DnDArgument : "xpos" "room_width / 2"
			/// @DnDArgument : "ypos" "446"
			/// @DnDArgument : "var" "e"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "objectid" "obj_enemy"
			/// @DnDArgument : "layer" ""Enemy""
			/// @DnDSaveInfo : "objectid" "obj_enemy"
			var e = instance_create_layer(room_width / 2, 446, "Enemy", obj_enemy);
		
			/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
			/// @DnDVersion : 1
			/// @DnDHash : 535786E3
			/// @DnDApplyTo : e
			/// @DnDParent : 31801250
			/// @DnDArgument : "instvar" "13"
			with(e) {
			image_alpha = 0;
			}
		}
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 67FB7263
	/// @DnDParent : 0EEA9D42
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5001D492
		/// @DnDComment : // Increase the time into the transition
		/// @DnDParent : 67FB7263
		/// @DnDArgument : "expr" "delta_time / 1000000"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "transition_timer"
		transition_timer += delta_time / 1000000;
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 3205A5D9
		/// @DnDComment : // Move the enemy on-screen and fade them in according to the animation curve
		/// @DnDApplyTo : obj_enemy
		/// @DnDParent : 67FB7263
		with(obj_enemy) {
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 069B0DBF
			/// @DnDInput : 2
			/// @DnDParent : 3205A5D9
			/// @DnDArgument : "var" "xpos_channel"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "animcurve_get_channel"
			/// @DnDArgument : "arg" "other.ac"
			/// @DnDArgument : "arg_1" ""xPosition""
			var xpos_channel = animcurve_get_channel(other.ac, "xPosition");
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 6D4F33DF
			/// @DnDInput : 2
			/// @DnDParent : 3205A5D9
			/// @DnDArgument : "var" "xpos"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "animcurve_channel_evaluate"
			/// @DnDArgument : "arg" "xpos_channel"
			/// @DnDArgument : "arg_1" "1 - (other.transition_timer - 0.1) * 10"
			var xpos = animcurve_channel_evaluate(xpos_channel, 1 - (other.transition_timer - 0.1) * 10);
		
			/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
			/// @DnDVersion : 1
			/// @DnDHash : 385D6BA6
			/// @DnDInput : 2
			/// @DnDParent : 3205A5D9
			/// @DnDArgument : "value" "xstart - xpos"
			/// @DnDArgument : "value_1" "(other.transition_timer - 0.1) * 10"
			/// @DnDArgument : "instvar_1" "13"
			x = xstart - xpos;
			image_alpha = (other.transition_timer - 0.1) * 10;
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5F0C2C99
		/// @DnDComment : // If the time element is over 0.2 seconds, mark it as complete
		/// @DnDParent : 67FB7263
		/// @DnDArgument : "var" "transition_timer"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "0.2"
		if(transition_timer > 0.2)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2DA3416F
			/// @DnDInput : 2
			/// @DnDParent : 5F0C2C99
			/// @DnDArgument : "expr" "false"
			/// @DnDArgument : "var" "transitioning"
			/// @DnDArgument : "var_1" "transition_timer"
			transitioning = false;
			transition_timer = 0;
		}
	}
}