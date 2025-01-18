/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 66766A7E
/// @DnDComment : // The player should only be able to damage the enemy if it's not transitioning
/// @DnDArgument : "var" "obj_button_enemy_down.transitioning"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "true"
if(!(obj_button_enemy_down.transitioning == true)){	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 36D11420
	/// @DnDParent : 66766A7E
	/// @DnDArgument : "var" "obj_button_enemy_up.transitioning"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	if(!(obj_button_enemy_up.transitioning == true)){	/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 47ADE597
		/// @DnDComment : // Create a temporary place to store how much extra damage a click on the enemy should do$(13_10)// Check for a crit
		/// @DnDInput : 2
		/// @DnDParent : 36D11420
		/// @DnDArgument : "var" "click_mod"
		/// @DnDArgument : "value" "accumulate_stats("click")"
		/// @DnDArgument : "var_1" "crit_chance"
		/// @DnDArgument : "value_1" "accumulate_stats("crit")"
		var click_mod = accumulate_stats("click");
		var crit_chance = accumulate_stats("crit");
	
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7DCD81DB
		/// @DnDComment : // Store the damage that a click causes: 1 plus the click modifier just created$(13_10)// Determine whether the player has hit a critical hit
		/// @DnDInput : 2
		/// @DnDParent : 36D11420
		/// @DnDArgument : "var" "dmg"
		/// @DnDArgument : "value" "1 + click_mod"
		/// @DnDArgument : "var_1" "crit"
		/// @DnDArgument : "value_1" "random(100) < crit_chance"
		var dmg = 1 + click_mod;
		var crit = random(100) < crit_chance;
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 59C1ADA2
		/// @DnDComment : // If the player scores a crit, double the damage
		/// @DnDParent : 36D11420
		/// @DnDArgument : "var" "crit"
		/// @DnDArgument : "value" "true"
		if(crit == true){	/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 78EC92C5
			/// @DnDParent : 59C1ADA2
			/// @DnDArgument : "soundid" "snd_enemy_crit"
			/// @DnDArgument : "pitch" "random_range(0.8, 1.2)"
			/// @DnDSaveInfo : "soundid" "snd_enemy_crit"
			audio_play_sound(snd_enemy_crit, 0, 0, 1.0, undefined, random_range(0.8, 1.2));
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 43FBEEEA
			/// @DnDParent : 59C1ADA2
			/// @DnDArgument : "expr" "dmg * 2"
			/// @DnDArgument : "var" "dmg"
			dmg = dmg * 2;}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 1E63B857
		/// @DnDParent : 36D11420
		else{	/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 245E5B31
			/// @DnDParent : 1E63B857
			/// @DnDArgument : "soundid" "snd_enemy_click"
			/// @DnDArgument : "pitch" "random_range(0.8, 1.2)"
			/// @DnDSaveInfo : "soundid" "snd_enemy_click"
			audio_play_sound(snd_enemy_click, 0, 0, 1.0, undefined, random_range(0.8, 1.2));}
	
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 47B84DBC
		/// @DnDComment : // Store the time that the click took place and the amount of damage it did so that it can be added to the dps representation
		/// @DnDParent : 36D11420
		/// @DnDArgument : "var" "click"
		/// @DnDArgument : "value" "{ time : current_time, damage : dmg }"
		var click = { time : current_time, damage : dmg };
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2D1A4FB3
		/// @DnDComment : // Damage the enemy
		/// @DnDParent : 36D11420
		/// @DnDArgument : "expr" "-dmg"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "hp"
		hp += -dmg;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 590AC0CD
		/// @DnDComment : // Trigger any on-click effects
		/// @DnDApplyTo : obj_game_manager
		/// @DnDParent : 36D11420
		/// @DnDArgument : "function" "on_click"
		with(obj_game_manager) {
			on_click();
		}
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 40725A82
		/// @DnDComment : // Send the stored time/damage structure to the dps object
		/// @DnDInput : 2
		/// @DnDApplyTo : obj_dps
		/// @DnDParent : 36D11420
		/// @DnDArgument : "function" "array_push"
		/// @DnDArgument : "arg" "recent_clicks"
		/// @DnDArgument : "arg_1" "click"
		with(obj_dps) {
			array_push(recent_clicks, click);
		}
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 7BD8C033
		/// @DnDComment : // Create a burst of a particle to show that the enemy has been damaged
		/// @DnDApplyTo : obj_particle_manager
		/// @DnDParent : 36D11420
		with(obj_particle_manager) {
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1F3AAC71
			/// @DnDParent : 7BD8C033
			/// @DnDArgument : "var" "crit"
			/// @DnDArgument : "not" "1"
			/// @DnDArgument : "value" "true"
			if(!(crit == true)){	/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 19249E0A
				/// @DnDInput : 4
				/// @DnDParent : 1F3AAC71
				/// @DnDArgument : "function" "part_particles_burst"
				/// @DnDArgument : "arg" "particle_system"
				/// @DnDArgument : "arg_1" "mouse_x"
				/// @DnDArgument : "arg_2" "mouse_y"
				/// @DnDArgument : "arg_3" "ps_damage"
				part_particles_burst(particle_system, mouse_x, mouse_y, ps_damage);}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 1FC21575
			/// @DnDParent : 7BD8C033
			else{	/// @DnDAction : YoYo Games.Random.Choose
				/// @DnDVersion : 1
				/// @DnDHash : 52A6C976
				/// @DnDInput : 2
				/// @DnDParent : 1FC21575
				/// @DnDArgument : "var" "fx"
				/// @DnDArgument : "var_temp" "1"
				/// @DnDArgument : "option" "ps_Crit"
				/// @DnDArgument : "option_1" "ps_Crit_1"
				var fx = choose(ps_Crit, ps_Crit_1);
			
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 5F51115A
				/// @DnDInput : 4
				/// @DnDParent : 1FC21575
				/// @DnDArgument : "function" "part_particles_burst"
				/// @DnDArgument : "arg" "particle_system"
				/// @DnDArgument : "arg_1" "mouse_x"
				/// @DnDArgument : "arg_2" "mouse_y"
				/// @DnDArgument : "arg_3" "fx"
				part_particles_burst(particle_system, mouse_x, mouse_y, fx);}
		}}}