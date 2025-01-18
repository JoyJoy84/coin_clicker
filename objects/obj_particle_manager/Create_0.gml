/// @DnDAction : YoYo Games.Particles.Part_Syst_Create
/// @DnDVersion : 1.2
/// @DnDHash : 17D4F470
/// @DnDComment : // Create a particle system for miscellaneous effects
/// @DnDArgument : "var" "particle_system"
/// @DnDArgument : "layer" ""UI_Interactible""
particle_system = part_system_create_layer("UI_Interactible", 0);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 23032890
/// @DnDComment : // Store the amount of coins on the previous frame
/// @DnDArgument : "expr" "global.save.bank"
/// @DnDArgument : "var" "prev_coins"
prev_coins = global.save.bank;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 3919659F
/// @DnDComment : // Function to clear the particle system
/// @DnDArgument : "funcName" "reset"
function reset() 
{
	/// @DnDAction : YoYo Games.Particles.Part_Syst_Clear
	/// @DnDVersion : 1.1
	/// @DnDHash : 4C8EB7EE
	/// @DnDParent : 3919659F
	/// @DnDArgument : "system" "particle_system"
	part_system_clear(particle_system);
}