/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 590E7BE4
/// @DnDComment : // Find whether the game has already been run by checking if there's a save file already
/// @DnDInput : 2
/// @DnDArgument : "expr" "file_exists("idle.sav")"
/// @DnDArgument : "expr_1" "true"
/// @DnDArgument : "var" "tutorialed"
/// @DnDArgument : "var_1" "first_run"
tutorialed = file_exists("idle.sav");
first_run = true;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 19279C90
/// @DnDComment : // Depending on whether the game has been run, either spawn all the cards and load the game, or spawn the tutorials
/// @DnDArgument : "var" "tutorialed"
/// @DnDArgument : "value" "true"
if(tutorialed == true){	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 6911D6A1
	/// @DnDApplyTo : obj_card_dock
	/// @DnDParent : 19279C90
	with(obj_card_dock) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 07C7FB57
		/// @DnDParent : 6911D6A1
		/// @DnDArgument : "function" "spawn_cards"
		spawn_cards();
	}

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 7DFC9D82
	/// @DnDApplyTo : obj_save_manager
	/// @DnDParent : 19279C90
	with(obj_save_manager) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 4BAC7290
		/// @DnDParent : 7DFC9D82
		/// @DnDArgument : "function" "load"
		load();
	}}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 57E79684
else{	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 37E21BF5
	/// @DnDParent : 57E79684
	/// @DnDArgument : "value" "1"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "var" "global.save.enemy_num[global.save.enemy_diff]"
	global.save.enemy_num[global.save.enemy_diff] += 1;}

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 42D46BFA
/// @DnDComment : // Create an enemy
/// @DnDArgument : "xpos" "room_width / 2"
/// @DnDArgument : "ypos" "446"
/// @DnDArgument : "objectid" "obj_enemy"
/// @DnDArgument : "layer" ""Enemy""
/// @DnDSaveInfo : "objectid" "obj_enemy"
instance_create_layer(room_width / 2, 446, "Enemy", obj_enemy);