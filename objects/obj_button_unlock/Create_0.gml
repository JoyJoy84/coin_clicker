/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 3461DDB3
/// @DnDComment : // Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 78309884
/// @DnDComment : // Set the base unlock price
/// @DnDArgument : "expr" "30"
/// @DnDArgument : "var" "card_unlock"
card_unlock = 30;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 08E45D9E
/// @DnDComment : // Create a function to remake the card unlock price
/// @DnDArgument : "funcName" "setup"
function setup() {	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 353ACF65
	/// @DnDComment : // Set the base price
	/// @DnDParent : 08E45D9E
	/// @DnDArgument : "expr" "30"
	/// @DnDArgument : "var" "card_unlock"
	card_unlock = 30;

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 6BC7155F
	/// @DnDComment : // Multiply the price by 10 for each currently unlocked card
	/// @DnDApplyTo : obj_card
	/// @DnDParent : 08E45D9E
	with(obj_card) {
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1343B53C
		/// @DnDParent : 6BC7155F
		/// @DnDArgument : "var" "unlocked"
		/// @DnDArgument : "value" "true"
		if(unlocked == true){	/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 3F3BF5EA
			/// @DnDParent : 1343B53C
			/// @DnDArgument : "expr" "other.card_unlock * 10"
			/// @DnDArgument : "var" "other.card_unlock"
			other.card_unlock = other.card_unlock * 10;}
	}}

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 32A929A1
/// @DnDComment : // Create a lock object instance to show better that a you can unlock a card or not
/// @DnDArgument : "xpos_relative" "1"
/// @DnDArgument : "ypos" "- sprite_get_height(spr_card_back) / 2"
/// @DnDArgument : "ypos_relative" "1"
/// @DnDArgument : "var" "lock"
/// @DnDArgument : "objectid" "obj_lock"
/// @DnDArgument : "layer" "layer"
/// @DnDSaveInfo : "objectid" "obj_lock"
lock = instance_create_layer(x + 0, y + - sprite_get_height(spr_card_back) / 2, layer, obj_lock);

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 19E73E3C
/// @DnDComment : // Create a function to trigger when the button is pressed
/// @DnDArgument : "funcName" "press_function"
function press_function() {	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5736860B
	/// @DnDComment : // If the player does not have the gold to unlock a card, do not trigger this function
	/// @DnDParent : 19E73E3C
	/// @DnDArgument : "var" "card_unlock"
	/// @DnDArgument : "op" "2"
	/// @DnDArgument : "value" "global.save.bank"
	if(card_unlock > global.save.bank){	/// @DnDAction : YoYo Games.Common.Exit_Event
		/// @DnDVersion : 1
		/// @DnDHash : 50E551FF
		/// @DnDParent : 5736860B
		exit;}

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 27AC337D
	/// @DnDComment : // Find the number of cards still currently locked
	/// @DnDParent : 19E73E3C
	/// @DnDArgument : "var" "num_locked"
	/// @DnDArgument : "value" "8"
	var num_locked = 8;

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 226DF592
	/// @DnDApplyTo : obj_card
	/// @DnDParent : 19E73E3C
	with(obj_card) {
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0154F8FF
		/// @DnDParent : 226DF592
		/// @DnDArgument : "var" "unlocked"
		/// @DnDArgument : "value" "true"
		if(unlocked == true){	/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 72AD4991
			/// @DnDParent : 0154F8FF
			/// @DnDArgument : "expr" "-1"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "num_locked"
			num_locked += -1;}
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6ACE4B02
	/// @DnDComment : // If there are no cards to unlock, do not trigger this function
	/// @DnDParent : 19E73E3C
	/// @DnDArgument : "var" "num_locked"
	if(num_locked == 0){	/// @DnDAction : YoYo Games.Common.Exit_Event
		/// @DnDVersion : 1
		/// @DnDHash : 36804C95
		/// @DnDParent : 6ACE4B02
		exit;}

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5996D3BC
	/// @DnDComment : // Find the next card to unlock
	/// @DnDParent : 19E73E3C
	/// @DnDArgument : "var" "unlock"
	/// @DnDArgument : "value" "num_locked - 1"
	var unlock = num_locked - 1;

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 5CED9794
	/// @DnDComment : // Take the gold needed from the player's bank
	/// @DnDParent : 19E73E3C
	/// @DnDArgument : "value" "-card_unlock"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "var" "save.bank"
	global.save.bank += -card_unlock;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 55DD39BD
	/// @DnDComment : // Increase the amount of gold needed to unlock the next card
	/// @DnDParent : 19E73E3C
	/// @DnDArgument : "expr" "card_unlock * 10"
	/// @DnDArgument : "var" "card_unlock"
	card_unlock = card_unlock * 10;

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 0149C979
	/// @DnDComment : // Loop through the cards
	/// @DnDApplyTo : obj_card
	/// @DnDParent : 19E73E3C
	with(obj_card) {
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 289E0F06
		/// @DnDComment : // Check if it's unlocked
		/// @DnDParent : 0149C979
		/// @DnDArgument : "var" "unlocked"
		/// @DnDArgument : "not" "1"
		/// @DnDArgument : "value" "true"
		if(!(unlocked == true)){	/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 67A89CFA
			/// @DnDComment : // If the unlock number is at zero, unlock this card
			/// @DnDParent : 289E0F06
			/// @DnDArgument : "var" "unlock"
			if(unlock == 0){	/// @DnDAction : YoYo Games.Audio.Play_Audio
				/// @DnDVersion : 1.1
				/// @DnDHash : 16B35E9E
				/// @DnDParent : 67A89CFA
				/// @DnDArgument : "soundid" "snd_flip"
				/// @DnDSaveInfo : "soundid" "snd_flip"
				audio_play_sound(snd_flip, 0, 0, 1.0, undefined, 1.0);
			
				/// @DnDAction : YoYo Games.Common.Apply_To
				/// @DnDVersion : 1
				/// @DnDHash : 10AA2B66
				/// @DnDComment : // Create a burst of particles
				/// @DnDApplyTo : obj_particle_manager
				/// @DnDParent : 67A89CFA
				with(obj_particle_manager) {
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 5510A7DB
					/// @DnDInput : 4
					/// @DnDParent : 10AA2B66
					/// @DnDArgument : "function" "part_particles_burst"
					/// @DnDArgument : "arg" "particle_system"
					/// @DnDArgument : "arg_1" "other.x"
					/// @DnDArgument : "arg_2" "other.y"
					/// @DnDArgument : "arg_3" "ps_card_reveal"
					part_particles_burst(particle_system, other.x, other.y, ps_card_reveal);
				}
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 1A264598
				/// @DnDComment : // Unlock this card
				/// @DnDParent : 67A89CFA
				/// @DnDArgument : "expr" "true"
				/// @DnDArgument : "var" "unlocked"
				unlocked = true;
			
				/// @DnDAction : YoYo Games.Common.Exit_Event
				/// @DnDVersion : 1
				/// @DnDHash : 0A28BA24
				/// @DnDComment : // Exit the function
				/// @DnDParent : 67A89CFA
				exit;}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 30F8C19A
			/// @DnDComment : // Otherwise decrease the unlock number
			/// @DnDParent : 289E0F06
			else{	/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 17E6199B
				/// @DnDParent : 30F8C19A
				/// @DnDArgument : "expr" "-1"
				/// @DnDArgument : "expr_relative" "1"
				/// @DnDArgument : "var" "unlock"
				unlock += -1;}}
	}}