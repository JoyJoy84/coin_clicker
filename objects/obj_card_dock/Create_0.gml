/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 4FE4D510
/// @DnDComment : // Function to spawn the cards
/// @DnDArgument : "funcName" "spawn_cards"
function spawn_cards() 
{
	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 12626818
	/// @DnDComment : // Create 8 cards
	/// @DnDParent : 4FE4D510
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "i < 8"
	for(var i = 0; i < 8; i += 1) {
		/// @DnDAction : YoYo Games.Instances.Create_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 77701BF9
		/// @DnDComment : // Create the card and set up its build
		/// @DnDParent : 12626818
		/// @DnDArgument : "xpos" "197.5 + (sprite_get_width(spr_card_back) + 40) * i"
		/// @DnDArgument : "ypos" "- sprite_get_height(spr_card_back) / 2 - 4"
		/// @DnDArgument : "ypos_relative" "1"
		/// @DnDArgument : "var" "card"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "objectid" "obj_card"
		/// @DnDArgument : "layer" ""UI_Interactible""
		/// @DnDSaveInfo : "objectid" "obj_card"
		var card = instance_create_layer(197.5 + (sprite_get_width(spr_card_back) + 40) * i, y + - sprite_get_height(spr_card_back) / 2 - 4, "UI_Interactible", obj_card);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 4218ECF8
		/// @DnDParent : 12626818
		/// @DnDArgument : "var" "builds"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "get_cards"
		var builds = get_cards();
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 7CBF8FDC
		/// @DnDParent : 12626818
		/// @DnDArgument : "function" "card.set_build"
		/// @DnDArgument : "arg" "builds[i]"
		card.set_build(builds[i]);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 6FDE4230
		/// @DnDComment : // Store the card's ID for access later
		/// @DnDInput : 2
		/// @DnDParent : 12626818
		/// @DnDArgument : "function" "array_push"
		/// @DnDArgument : "arg" "cards"
		/// @DnDArgument : "arg_1" "card"
		array_push(cards, card);
	}
}