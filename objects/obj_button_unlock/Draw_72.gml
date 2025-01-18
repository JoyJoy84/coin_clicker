/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 50785A0B
/// @DnDComment : // Find whether there are any locked cards
/// @DnDInput : 2
/// @DnDArgument : "var" "draw_scale"
/// @DnDArgument : "value" "target_scale"
/// @DnDArgument : "var_1" "any_locked"
/// @DnDArgument : "value_1" "false"
var draw_scale = target_scale;
var any_locked = false;

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 1A91A434
/// @DnDApplyTo : obj_card
with(obj_card) {
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 56B29EBB
	/// @DnDParent : 1A91A434
	/// @DnDArgument : "var" "unlocked"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	if(!(unlocked == true))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 67250FF6
		/// @DnDParent : 56B29EBB
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "any_locked"
		any_locked = true;
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 797E45A0
/// @DnDComment : // If the player doesn't have enough money yet or there aren't any more cards to unlock
/// @DnDArgument : "expr" "card_unlock > global.save.bank || !any_locked"
if(card_unlock > global.save.bank || !any_locked)
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 7D63318C
	/// @DnDComment : // Pause the lock sequence and set its position to the start position
	/// @DnDApplyTo : lock
	/// @DnDParent : 797E45A0
	with(lock) {
		/// @DnDAction : YoYo Games.Sequences.Sequence_Pause
		/// @DnDVersion : 1
		/// @DnDHash : 5BE3C84A
		/// @DnDParent : 7D63318C
		/// @DnDArgument : "var" "seq"
		layer_sequence_pause(seq);
	
		/// @DnDAction : YoYo Games.Sequences.Sequence_Set_Head
		/// @DnDVersion : 1
		/// @DnDHash : 5580FC3B
		/// @DnDParent : 7D63318C
		/// @DnDArgument : "sequenceelmid" "seq"
		layer_sequence_headpos(seq, 0);
	}

	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 5CAD7627
	/// @DnDComment : // Make the button transparent
	/// @DnDParent : 797E45A0
	/// @DnDArgument : "value" "0.5"
	/// @DnDArgument : "instvar" "13"
	image_alpha = 0.5;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 44392599
/// @DnDComment : // Otherwise, play the sequence and reset the alpha
else
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 58522604
	/// @DnDApplyTo : lock
	/// @DnDParent : 44392599
	with(lock) {
		/// @DnDAction : YoYo Games.Sequences.Sequence_Play
		/// @DnDVersion : 1
		/// @DnDHash : 0500CA0E
		/// @DnDParent : 58522604
		/// @DnDArgument : "var" "seq"
		layer_sequence_play(seq);
	}

	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 256E0A81
	/// @DnDParent : 44392599
	/// @DnDArgument : "value" "1"
	/// @DnDArgument : "instvar" "13"
	image_alpha = 1;
}