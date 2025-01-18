/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 1BF5367C
/// @DnDComment : // In the pre-create, there are a lot of default variables set. Including this function, they make up the card's abilities$(13_10)// sprite			The icon to display on the card$(13_10)// sprite_scale		The size to display the icon at$(13_10)// name				The name to display on the card$(13_10)// dps				The amount of damage the card adds per second$(13_10)// description		A high-level description of what the card does$(13_10)// onkill			Whether the card's ability triggers on killing an enemy$(13_10)// onappear			Whether the card's ability triggers when a new enemy appears$(13_10)// onclick			Whether the card's ability triggers when the player clicks on the enemy$(13_10)// stat_buff		Whether the card adds another stat than the base DPS$(13_10)// stat_type		The stat other than the DPS to affect$(13_10)// stat_value		The amount of the stat to use$(13_10)// func				The card's ability if it triggers on kill, appear, or click
/// @DnDArgument : "funcName" "func"
function func() 
{

}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 3AB6392E
/// @DnDComment : // Get the animation curve used to animate the card flipping over
/// @DnDArgument : "var" "ac"
/// @DnDArgument : "function" "animcurve_get"
/// @DnDArgument : "arg" "ac_card_flip"
ac = animcurve_get(ac_card_flip);

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 59788627
/// @DnDComment : // Set the card's abilities
/// @DnDArgument : "funcName" "set_build"
/// @DnDArgument : "arg" "new_build"
function set_build(new_build) 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6DC97453
	/// @DnDComment : // With every part of the new build, set the current build to its corresponding value
	/// @DnDInput : 12
	/// @DnDParent : 59788627
	/// @DnDArgument : "expr" "new_build.sprite"
	/// @DnDArgument : "expr_1" "new_build.dps"
	/// @DnDArgument : "expr_2" "new_build.description"
	/// @DnDArgument : "expr_3" "new_build.onkill"
	/// @DnDArgument : "expr_4" "new_build.onappear"
	/// @DnDArgument : "expr_5" "new_build.onclick"
	/// @DnDArgument : "expr_6" "new_build.stat_buff"
	/// @DnDArgument : "expr_7" "new_build.stat_type"
	/// @DnDArgument : "expr_8" "new_build.stat_value"
	/// @DnDArgument : "expr_9" "new_build.func"
	/// @DnDArgument : "expr_10" "new_build.sprite_scale"
	/// @DnDArgument : "expr_11" "new_build.name"
	/// @DnDArgument : "var" "sprite"
	/// @DnDArgument : "var_1" "dps"
	/// @DnDArgument : "var_2" "description"
	/// @DnDArgument : "var_3" "onkill"
	/// @DnDArgument : "var_4" "onappear"
	/// @DnDArgument : "var_5" "onclick"
	/// @DnDArgument : "var_6" "stat_buff"
	/// @DnDArgument : "var_7" "stat_type"
	/// @DnDArgument : "var_8" "stat_value"
	/// @DnDArgument : "var_9" "func"
	/// @DnDArgument : "var_10" "sprite_scale"
	/// @DnDArgument : "var_11" "name"
	sprite = new_build.sprite;
	dps = new_build.dps;
	description = new_build.description;
	onkill = new_build.onkill;
	onappear = new_build.onappear;
	onclick = new_build.onclick;
	stat_buff = new_build.stat_buff;
	stat_type = new_build.stat_type;
	stat_value = new_build.stat_value;
	func = new_build.func;
	sprite_scale = new_build.sprite_scale;
	name = new_build.name;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 019B95E0
/// @DnDComment : // Function to unlock the card without needing to see the full animation
/// @DnDArgument : "funcName" "quick_unlock"
function quick_unlock() 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 16640ACC
	/// @DnDComment : // Unlock the card
	/// @DnDInput : 2
	/// @DnDParent : 019B95E0
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "expr_1" "true"
	/// @DnDArgument : "var" "unlocked"
	/// @DnDArgument : "var_1" "flipped"
	unlocked = true;
	flipped = true;

	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 7BAC4701
	/// @DnDComment : // Set the sprite
	/// @DnDParent : 019B95E0
	/// @DnDArgument : "value" "spr_card_front"
	/// @DnDArgument : "instvar" "10"
	sprite_index = spr_card_front;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4219370F
	/// @DnDComment : // Set up the card's ability in the game manager
	/// @DnDParent : 019B95E0
	/// @DnDArgument : "var" "onclick"
	/// @DnDArgument : "value" "true"
	if(onclick == true)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 7E82B387
		/// @DnDInput : 2
		/// @DnDParent : 4219370F
		/// @DnDArgument : "function" "array_push"
		/// @DnDArgument : "arg" "obj_game_manager.onclick_methods"
		/// @DnDArgument : "arg_1" "func"
		array_push(obj_game_manager.onclick_methods, func);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 2699EAA8
	/// @DnDParent : 019B95E0
	else
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3EA5B0FE
		/// @DnDParent : 2699EAA8
		/// @DnDArgument : "var" "onappear"
		/// @DnDArgument : "value" "true"
		if(onappear == true)
		{
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 3A6C03F8
			/// @DnDInput : 2
			/// @DnDParent : 3EA5B0FE
			/// @DnDArgument : "function" "array_push"
			/// @DnDArgument : "arg" "obj_game_manager.onappear_methods"
			/// @DnDArgument : "arg_1" "func"
			array_push(obj_game_manager.onappear_methods, func);
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 36515F6E
		/// @DnDParent : 2699EAA8
		else
		{
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6AF061F8
			/// @DnDParent : 36515F6E
			/// @DnDArgument : "var" "onkill"
			/// @DnDArgument : "value" "true"
			if(onkill == true)
			{
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 6BC43D9E
				/// @DnDInput : 2
				/// @DnDParent : 6AF061F8
				/// @DnDArgument : "function" "array_push"
				/// @DnDArgument : "arg" "obj_game_manager.onkill_methods"
				/// @DnDArgument : "arg_1" "func"
				array_push(obj_game_manager.onkill_methods, func);
			}
		}
	}
}