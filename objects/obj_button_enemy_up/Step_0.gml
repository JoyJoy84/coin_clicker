/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 131EE555
/// @DnDComment : // If this object should be transitioning out the enemy
/// @DnDArgument : "var" "transitioning"
/// @DnDArgument : "value" "true"
if(transitioning == true)
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2D036B03
	/// @DnDComment : // If the transition is within the first 0.1 seconds, the original enemy should be transitioning out
	/// @DnDParent : 131EE555
	/// @DnDArgument : "var" "transition_timer"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "0.1"
	if(transition_timer < 0.1)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 32ABF6E3
		/// @DnDComment : // Increase the time into the transition
		/// @DnDParent : 2D036B03
		/// @DnDArgument : "expr" "delta_time / 1000000"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "transition_timer"
		transition_timer += delta_time / 1000000;
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 5D2F57EE
		/// @DnDComment : // Move the enemy off-screen and fade them out according to the animation curve
		/// @DnDApplyTo : obj_enemy
		/// @DnDParent : 2D036B03
		with(obj_enemy) {
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 464015E9
			/// @DnDInput : 2
			/// @DnDParent : 5D2F57EE
			/// @DnDArgument : "var" "xpos_channel"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "animcurve_get_channel"
			/// @DnDArgument : "arg" "other.ac"
			/// @DnDArgument : "arg_1" ""xPosition""
			var xpos_channel = animcurve_get_channel(other.ac, "xPosition");
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 61155FA6
			/// @DnDInput : 2
			/// @DnDParent : 5D2F57EE
			/// @DnDArgument : "var" "xpos"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "animcurve_channel_evaluate"
			/// @DnDArgument : "arg" "xpos_channel"
			/// @DnDArgument : "arg_1" "other.transition_timer * 10"
			var xpos = animcurve_channel_evaluate(xpos_channel, other.transition_timer * 10);
		
			/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
			/// @DnDVersion : 1
			/// @DnDHash : 5DED5C32
			/// @DnDInput : 2
			/// @DnDParent : 5D2F57EE
			/// @DnDArgument : "value" "xstart - xpos"
			/// @DnDArgument : "value_1" "1 - other.transition_timer * 10"
			/// @DnDArgument : "instvar_1" "13"
			x = xstart - xpos;
			image_alpha = 1 - other.transition_timer * 10;
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0BCCC8DF
		/// @DnDComment : // If the time element is at 0.1 seconds, move to the second phase of the transition
		/// @DnDParent : 2D036B03
		/// @DnDArgument : "var" "transition_timer"
		/// @DnDArgument : "op" "4"
		/// @DnDArgument : "value" "0.1"
		if(transition_timer >= 0.1)
		{
			/// @DnDAction : YoYo Games.Instances.Destroy_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 6684265E
			/// @DnDComment : // Destroy the current enemy
			/// @DnDApplyTo : obj_enemy
			/// @DnDParent : 0BCCC8DF
			with(obj_enemy) instance_destroy();
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 104CC1E1
			/// @DnDParent : 0BCCC8DF
			/// @DnDArgument : "expr" "1"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "global.save.enemy_diff"
			global.save.enemy_diff += 1;
		
			/// @DnDAction : YoYo Games.Instances.Create_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 29B9FD12
			/// @DnDComment : // Create a new enemy on the other side of the screen and hide it
			/// @DnDParent : 0BCCC8DF
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
			/// @DnDHash : 4B7BD1F0
			/// @DnDApplyTo : e
			/// @DnDParent : 0BCCC8DF
			/// @DnDArgument : "instvar" "13"
			with(e) {
			image_alpha = 0;
			}
		}
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 47B00431
	/// @DnDParent : 131EE555
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1DF1C37C
		/// @DnDComment : // Increase the time into the transition
		/// @DnDParent : 47B00431
		/// @DnDArgument : "expr" "delta_time / 1000000"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "transition_timer"
		transition_timer += delta_time / 1000000;
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 09AB9621
		/// @DnDComment : // Move the enemy on-screen and fade them in according to the animation curve
		/// @DnDApplyTo : obj_enemy
		/// @DnDParent : 47B00431
		with(obj_enemy) {
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 18EFDAF4
			/// @DnDInput : 2
			/// @DnDParent : 09AB9621
			/// @DnDArgument : "var" "xpos_channel"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "animcurve_get_channel"
			/// @DnDArgument : "arg" "other.ac"
			/// @DnDArgument : "arg_1" ""xPosition""
			var xpos_channel = animcurve_get_channel(other.ac, "xPosition");
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 54F281A3
			/// @DnDInput : 2
			/// @DnDParent : 09AB9621
			/// @DnDArgument : "var" "xpos"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "animcurve_channel_evaluate"
			/// @DnDArgument : "arg" "xpos_channel"
			/// @DnDArgument : "arg_1" "1 - (other.transition_timer - 0.1) * 10"
			var xpos = animcurve_channel_evaluate(xpos_channel, 1 - (other.transition_timer - 0.1) * 10);
		
			/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
			/// @DnDVersion : 1
			/// @DnDHash : 7D5D7E5C
			/// @DnDInput : 2
			/// @DnDParent : 09AB9621
			/// @DnDArgument : "value" "xstart + xpos"
			/// @DnDArgument : "value_1" "(other.transition_timer - 0.1) * 10"
			/// @DnDArgument : "instvar_1" "13"
			x = xstart + xpos;
			image_alpha = (other.transition_timer - 0.1) * 10;
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 35D938F6
		/// @DnDComment : // If the time element is over 0.2 seconds, mark it as complete
		/// @DnDParent : 47B00431
		/// @DnDArgument : "var" "transition_timer"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "0.2"
		if(transition_timer > 0.2)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 41455D18
			/// @DnDInput : 2
			/// @DnDParent : 35D938F6
			/// @DnDArgument : "expr" "false"
			/// @DnDArgument : "var" "transitioning"
			/// @DnDArgument : "var_1" "transition_timer"
			transitioning = false;
			transition_timer = 0;
		}
	}
}