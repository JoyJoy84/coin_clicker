/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 5D2431C0
/// @DnDComment : // Reposition the particle system to be in line with the enemy's feet
/// @DnDInput : 3
/// @DnDArgument : "function" "part_system_position"
/// @DnDArgument : "arg" "particle"
/// @DnDArgument : "arg_1" "x"
/// @DnDArgument : "arg_2" "y + sprite_height / 2"
part_system_position(particle, x, y + sprite_height / 2);

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 32F8C80C
/// @DnDComment : // Find the position vector between where the enemy was instantiated and the current position
/// @DnDInput : 2
/// @DnDArgument : "var" "x_diff"
/// @DnDArgument : "value" "x - xstart"
/// @DnDArgument : "var_1" "y_diff"
/// @DnDArgument : "value_1" "y - ystart"
var x_diff = x - xstart;
var y_diff = y - ystart;

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 59965E6F
/// @DnDComment : // With all associated instances, move them 20% of the same movement vector and match the transparency
/// @DnDApplyTo : health_bar
with(health_bar) {
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 521CE96D
	/// @DnDInput : 2
	/// @DnDParent : 59965E6F
	/// @DnDArgument : "value" "xstart + x_diff * 0.2"
	/// @DnDArgument : "value_1" "other.image_alpha"
	/// @DnDArgument : "instvar_1" "13"
	x = xstart + x_diff * 0.2;
	image_alpha = other.image_alpha;
}

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 579573F3
/// @DnDApplyTo : name_plate
with(name_plate) {
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 09F59AA0
	/// @DnDInput : 2
	/// @DnDParent : 579573F3
	/// @DnDArgument : "value" "xstart + x_diff * 0.2"
	/// @DnDArgument : "value_1" "other.image_alpha"
	/// @DnDArgument : "instvar_1" "13"
	x = xstart + x_diff * 0.2;
	image_alpha = other.image_alpha;
}

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 69E7D423
/// @DnDApplyTo : gold_indicator
with(gold_indicator) {
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 2771C2D0
	/// @DnDInput : 2
	/// @DnDParent : 69E7D423
	/// @DnDArgument : "value" "xstart + x_diff * 0.2"
	/// @DnDArgument : "value_1" "other.image_alpha"
	/// @DnDArgument : "instvar_1" "13"
	x = xstart + x_diff * 0.2;
	image_alpha = other.image_alpha;
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5D8F5749
/// @DnDComment : // If the enemy is on fire
/// @DnDArgument : "var" "onfire"
/// @DnDArgument : "value" "true"
if(onfire == true){	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6A3E0740
	/// @DnDParent : 5D8F5749
	/// @DnDArgument : "var" "fire_timer"
	if(fire_timer == 0){	/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5D10EF2C
		/// @DnDParent : 6A3E0740
		/// @DnDArgument : "var" "fire_ticks"
		if(fire_ticks == 0){	/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 5B1B9EFA
			/// @DnDParent : 5D10EF2C
			/// @DnDArgument : "soundid" "snd_fire"
			/// @DnDSaveInfo : "soundid" "snd_fire"
			audio_play_sound(snd_fire, 0, 0, 1.0, undefined, 1.0);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 3308CC00
			/// @DnDInput : 4
			/// @DnDParent : 5D10EF2C
			/// @DnDArgument : "function" "part_particles_burst"
			/// @DnDArgument : "arg" "obj_particle_manager.particle_system"
			/// @DnDArgument : "arg_1" "x + random_range(-sprite_width / 4, sprite_width / 4)"
			/// @DnDArgument : "arg_2" "y + random_range(-sprite_height / 4, sprite_height / 4)"
			/// @DnDArgument : "arg_3" "ps_fire"
			part_particles_burst(obj_particle_manager.particle_system, x + random_range(-sprite_width / 4, sprite_width / 4), y + random_range(-sprite_height / 4, sprite_height / 4), ps_fire);}}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 46AB5B89
	/// @DnDComment : // Increase the timer for the fire
	/// @DnDParent : 5D8F5749
	/// @DnDArgument : "expr" "delta_time / 1000000"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "fire_timer"
	fire_timer += delta_time / 1000000;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 333ABDE7
	/// @DnDComment : // Every 0.2 seconds, damage the enemy proportional to the current dps amount and increment the fire ticks
	/// @DnDParent : 5D8F5749
	/// @DnDArgument : "var" "fire_timer"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "0.2"
	if(fire_timer >= 0.2){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1FE8F6DE
		/// @DnDInput : 3
		/// @DnDParent : 333ABDE7
		/// @DnDArgument : "expr" "floor(hp - global.dps / 3)"
		/// @DnDArgument : "expr_1" "-0.2"
		/// @DnDArgument : "expr_relative_1" "1"
		/// @DnDArgument : "expr_2" "1"
		/// @DnDArgument : "expr_relative_2" "1"
		/// @DnDArgument : "var" "hp"
		/// @DnDArgument : "var_1" "fire_timer"
		/// @DnDArgument : "var_2" "fire_ticks"
		hp = floor(hp - global.dps / 3);
		fire_timer += -0.2;
		fire_ticks += 1;}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5F8BC0EC
	/// @DnDComment : // If there have been 6 fire ticks, extinguish the fire
	/// @DnDParent : 5D8F5749
	/// @DnDArgument : "var" "fire_ticks"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "6"
	if(fire_ticks >= 6){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5CF0E110
		/// @DnDInput : 3
		/// @DnDParent : 5F8BC0EC
		/// @DnDArgument : "expr" "false"
		/// @DnDArgument : "var" "onfire"
		/// @DnDArgument : "var_1" "fire_ticks"
		/// @DnDArgument : "var_2" "fire_timer"
		onfire = false;
		fire_ticks = 0;
		fire_timer = 0;}}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5435631C
/// @DnDComment : // Set the hp to the maximum value between it and 0
/// @DnDArgument : "expr" "max(hp, 0)"
/// @DnDArgument : "var" "hp"
hp = max(hp, 0);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 6EEF0858
/// @DnDComment : // If the hp has reached 0, "kill" the enemy with user event 1
/// @DnDArgument : "var" "hp"
/// @DnDArgument : "op" "3"
if(hp <= 0){	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 16A2AD85
	/// @DnDParent : 6EEF0858
	/// @DnDArgument : "value" "1"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "var" "save.enemy_num[global.save.enemy_diff]"
	global.save.enemy_num[global.save.enemy_diff] += 1;

	/// @DnDAction : YoYo Games.Instances.Call_User_Event
	/// @DnDVersion : 1
	/// @DnDHash : 2C0BC6D4
	/// @DnDParent : 6EEF0858
	/// @DnDArgument : "event" "1"
	event_user(1);}