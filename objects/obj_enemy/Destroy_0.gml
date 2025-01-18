/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 16046FD2
/// @DnDComment : // Only save the enemy if the enemy is not dead
/// @DnDArgument : "var" "global.paused"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "true"
if(!(global.paused == true))
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 45145B31
	/// @DnDParent : 16046FD2
	/// @DnDArgument : "var" "hp"
	/// @DnDArgument : "op" "2"
	if(hp > 0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 036B9217
		/// @DnDInput : 2
		/// @DnDParent : 45145B31
		/// @DnDArgument : "expr" "hp"
		/// @DnDArgument : "expr_1" "augment"
		/// @DnDArgument : "var" "global.save.enemy_hp[global.save.enemy_diff]"
		/// @DnDArgument : "var_1" "global.save.enemy_augments[global.save.enemy_diff]"
		global.save.enemy_hp[global.save.enemy_diff] = hp;
		global.save.enemy_augments[global.save.enemy_diff] = augment;
	}
}

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 501BB0C8
/// @DnDComment : // Destroy related instances and particle systems
/// @DnDApplyTo : name_plate
with(name_plate) instance_destroy();

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 60F3A6D6
/// @DnDApplyTo : health_bar
with(health_bar) instance_destroy();

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 03AE86AE
/// @DnDApplyTo : gold_indicator
with(gold_indicator) instance_destroy();

/// @DnDAction : YoYo Games.Particles.Part_Syst_Destroy
/// @DnDVersion : 1.1
/// @DnDHash : 7460687D
/// @DnDArgument : "system" "particle"
part_system_destroy(particle);