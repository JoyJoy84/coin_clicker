/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 7686EA4C
/// @DnDComment : // The effect should happen over the coin so trigger it there
/// @DnDArgument : "var" "global.save.bank"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "prev_coins"
if(!(global.save.bank == prev_coins))
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 140351AE
	/// @DnDParent : 7686EA4C
	/// @DnDArgument : "var" "global.save.bank"
	/// @DnDArgument : "not" "1"
	if(!(global.save.bank == 0))
	{
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 3C4F01CD
		/// @DnDComment : // The effect should happen over the coin so trigger it there
		/// @DnDApplyTo : obj_bank
		/// @DnDParent : 140351AE
		with(obj_bank) {
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 49831A2A
			/// @DnDInput : 4
			/// @DnDParent : 3C4F01CD
			/// @DnDArgument : "function" "part_particles_burst"
			/// @DnDArgument : "arg" "other.particle_system"
			/// @DnDArgument : "arg_1" "x"
			/// @DnDArgument : "arg_2" "y"
			/// @DnDArgument : "arg_3" "ps_gold"
			part_particles_burst(other.particle_system, x, y, ps_gold);
		}
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2190FBBE
		/// @DnDComment : // Save the new amount of coins
		/// @DnDParent : 140351AE
		/// @DnDArgument : "expr" "global.save.bank"
		/// @DnDArgument : "var" "prev_coins"
		prev_coins = global.save.bank;
	}
}