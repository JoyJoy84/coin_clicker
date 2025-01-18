/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 2B01E820
/// @DnDComment : // Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 730FB054
/// @DnDComment : // Set the button's text
/// @DnDInput : 2
/// @DnDArgument : "expr" ""Menu""
/// @DnDArgument : "expr_1" "true"
/// @DnDArgument : "var" "text"
/// @DnDArgument : "var_1" "has_text"
text = "Menu";
has_text = true;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 4716DF7B
/// @DnDComment : // Create the function to trigger when the button is clicked
/// @DnDArgument : "funcName" "press_function"
function press_function() 
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 5F74C632
	/// @DnDComment : // Resume the game
	/// @DnDParent : 4716DF7B
	/// @DnDArgument : "function" "resume_everything"
	resume_everything();

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 74071BC6
	/// @DnDComment : // Save the current enemy's health
	/// @DnDParent : 4716DF7B
	/// @DnDArgument : "expr" "obj_enemy.hp"
	/// @DnDArgument : "var" "global.save.enemy_hp[global.save.enemy_diff]"
	global.save.enemy_hp[global.save.enemy_diff] = obj_enemy.hp;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 09481E05
	/// @DnDComment : // If the game has been won, delete the save file
	/// @DnDParent : 4716DF7B
	/// @DnDArgument : "var" "global.won"
	/// @DnDArgument : "value" "true"
	if(global.won == true)
	{
		/// @DnDAction : YoYo Games.Files.File_Delete
		/// @DnDVersion : 1
		/// @DnDHash : 12C6C365
		/// @DnDParent : 09481E05
		/// @DnDArgument : "file" ""idle.sav""
		file_delete("idle.sav");
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 668C56C9
	/// @DnDComment : // Otherwise, save the game
	/// @DnDParent : 4716DF7B
	else
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 0921B220
		/// @DnDApplyTo : obj_save_manager
		/// @DnDParent : 668C56C9
		/// @DnDArgument : "function" "save"
		with(obj_save_manager) {
			save();
		}
	}

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 6298310A
	/// @DnDComment : // Destroy the save manager
	/// @DnDApplyTo : obj_save_manager
	/// @DnDParent : 4716DF7B
	with(obj_save_manager) instance_destroy();

	/// @DnDAction : YoYo Games.Particles.Part_Syst_Destroy
	/// @DnDVersion : 1.1
	/// @DnDHash : 303C08D1
	/// @DnDComment : // Destroy the particle manager
	/// @DnDApplyTo : obj_enemy
	/// @DnDParent : 4716DF7B
	/// @DnDArgument : "system" "particle"
	with(obj_enemy) part_system_destroy(particle);

	/// @DnDAction : YoYo Games.Rooms.Go_To_Room
	/// @DnDVersion : 1
	/// @DnDHash : 152A5C34
	/// @DnDComment : // Go to the main menu
	/// @DnDParent : 4716DF7B
	/// @DnDArgument : "room" "rm_main_menu"
	/// @DnDSaveInfo : "room" "rm_main_menu"
	room_goto(rm_main_menu);
}