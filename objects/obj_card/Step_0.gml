/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0FEDE037
/// @DnDComment : // Only animate if the card should be unlocking
/// @DnDArgument : "var" "unlocked"
/// @DnDArgument : "value" "true"
if(unlocked == true)
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4DC5FEB8
	/// @DnDParent : 0FEDE037
	/// @DnDArgument : "var" "flipped"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	if(!(flipped == true))
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 530B76BC
		/// @DnDComment : // If the card still has the card back sprite, it should become thinner and taller
		/// @DnDParent : 4DC5FEB8
		/// @DnDArgument : "var" "sprite_index"
		/// @DnDArgument : "not" "1"
		/// @DnDArgument : "value" "spr_card_front"
		if(!(sprite_index == spr_card_front))
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 35B62370
			/// @DnDComment : // Run the animation curve forwards
			/// @DnDParent : 530B76BC
			/// @DnDArgument : "expr" "delta_time / 200000"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "ac_timer"
			ac_timer += delta_time / 200000;
		
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6287CF27
			/// @DnDComment : // If the animation timer is complete, it should be effectively "unlocked"
			/// @DnDParent : 530B76BC
			/// @DnDArgument : "var" "ac_timer"
			/// @DnDArgument : "op" "4"
			/// @DnDArgument : "value" "1"
			if(ac_timer >= 1)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 6C439B1C
				/// @DnDComment : // Reflect the timer about 1
				/// @DnDParent : 6287CF27
				/// @DnDArgument : "expr" "2 - ac_timer"
				/// @DnDArgument : "var" "ac_timer"
				ac_timer = 2 - ac_timer;
			
				/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
				/// @DnDVersion : 1
				/// @DnDHash : 460BAFEB
				/// @DnDComment : // Set the sprite to the actual card sprite
				/// @DnDParent : 6287CF27
				/// @DnDArgument : "value" "spr_card_front"
				/// @DnDArgument : "instvar" "10"
				sprite_index = spr_card_front;
			
				/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 3CD0A5B4
				/// @DnDComment : // Add the card's ability to the game manager
				/// @DnDParent : 6287CF27
				/// @DnDArgument : "var" "onclick"
				/// @DnDArgument : "value" "true"
				if(onclick == true)
				{
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 6F10833B
					/// @DnDInput : 2
					/// @DnDParent : 3CD0A5B4
					/// @DnDArgument : "function" "array_push"
					/// @DnDArgument : "arg" "obj_game_manager.onclick_methods"
					/// @DnDArgument : "arg_1" "func"
					array_push(obj_game_manager.onclick_methods, func);
				}
			
				/// @DnDAction : YoYo Games.Common.Else
				/// @DnDVersion : 1
				/// @DnDHash : 2CAD7D35
				/// @DnDParent : 6287CF27
				else
				{
					/// @DnDAction : YoYo Games.Common.If_Variable
					/// @DnDVersion : 1
					/// @DnDHash : 26504059
					/// @DnDParent : 2CAD7D35
					/// @DnDArgument : "var" "onappear"
					/// @DnDArgument : "value" "true"
					if(onappear == true)
					{
						/// @DnDAction : YoYo Games.Common.Function_Call
						/// @DnDVersion : 1
						/// @DnDHash : 4B45E5EB
						/// @DnDInput : 2
						/// @DnDParent : 26504059
						/// @DnDArgument : "function" "array_push"
						/// @DnDArgument : "arg" "obj_game_manager.onappear_methods"
						/// @DnDArgument : "arg_1" "func"
						array_push(obj_game_manager.onappear_methods, func);
					}
				
					/// @DnDAction : YoYo Games.Common.Else
					/// @DnDVersion : 1
					/// @DnDHash : 6C0598C4
					/// @DnDParent : 2CAD7D35
					else
					{
						/// @DnDAction : YoYo Games.Common.If_Variable
						/// @DnDVersion : 1
						/// @DnDHash : 2FA50709
						/// @DnDParent : 6C0598C4
						/// @DnDArgument : "var" "onkill"
						/// @DnDArgument : "value" "true"
						if(onkill == true)
						{
							/// @DnDAction : YoYo Games.Common.Function_Call
							/// @DnDVersion : 1
							/// @DnDHash : 0EB0F112
							/// @DnDInput : 2
							/// @DnDParent : 2FA50709
							/// @DnDArgument : "function" "array_push"
							/// @DnDArgument : "arg" "obj_game_manager.onkill_methods"
							/// @DnDArgument : "arg_1" "func"
							array_push(obj_game_manager.onkill_methods, func);
						}
					}
				}
			}
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 1BC9EE5F
		/// @DnDComment : // Otherwise, it should be running backwards so it returns to normal dimensions
		/// @DnDParent : 4DC5FEB8
		else
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 35724C52
			/// @DnDParent : 1BC9EE5F
			/// @DnDArgument : "expr" "-delta_time / 200000"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "ac_timer"
			ac_timer += -delta_time / 200000;
		
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 47EB956A
			/// @DnDComment : // If the animation is complete backwards, mark it as complete
			/// @DnDParent : 1BC9EE5F
			/// @DnDArgument : "var" "ac_timer"
			/// @DnDArgument : "op" "3"
			if(ac_timer <= 0)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 4E955BC3
				/// @DnDInput : 2
				/// @DnDParent : 47EB956A
				/// @DnDArgument : "expr" "true"
				/// @DnDArgument : "expr_relative_1" "1"
				/// @DnDArgument : "var" "flipped"
				/// @DnDArgument : "var_1" "ac_timer"
				flipped = true;
				ac_timer += 0;
			}
		}
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 72F88780
		/// @DnDComment : // Set the x scale and y scale according to the animation curve
		/// @DnDInput : 2
		/// @DnDParent : 4DC5FEB8
		/// @DnDArgument : "var" "xscale_channel"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "animcurve_get_channel"
		/// @DnDArgument : "arg" "ac"
		/// @DnDArgument : "arg_1" ""xScale""
		var xscale_channel = animcurve_get_channel(ac, "xScale");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 32F72431
		/// @DnDInput : 2
		/// @DnDParent : 4DC5FEB8
		/// @DnDArgument : "var" "image_xscale"
		/// @DnDArgument : "function" "animcurve_channel_evaluate"
		/// @DnDArgument : "arg" "xscale_channel"
		/// @DnDArgument : "arg_1" "ac_timer"
		image_xscale = animcurve_channel_evaluate(xscale_channel, ac_timer);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 58BA06EC
		/// @DnDInput : 2
		/// @DnDParent : 4DC5FEB8
		/// @DnDArgument : "var" "yscale_channel"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "animcurve_get_channel"
		/// @DnDArgument : "arg" "ac"
		/// @DnDArgument : "arg_1" ""yScale""
		var yscale_channel = animcurve_get_channel(ac, "yScale");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 442CE0F9
		/// @DnDInput : 2
		/// @DnDParent : 4DC5FEB8
		/// @DnDArgument : "var" "image_yscale"
		/// @DnDArgument : "function" "animcurve_channel_evaluate"
		/// @DnDArgument : "arg" "yscale_channel"
		/// @DnDArgument : "arg_1" "ac_timer"
		image_yscale = animcurve_channel_evaluate(yscale_channel, ac_timer);
	}
}