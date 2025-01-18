/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 52D13D75
/// @DnDArgument : "funcName" "get_cards"
function get_cards() {	/// @DnDAction : YoYo Games.Common.Execute_Code
	/// @DnDVersion : 1
	/// @DnDHash : 4F35A9DB
	/// @DnDParent : 52D13D75
	/// @DnDArgument : "code" "return $(13_10)[$(13_10)	 $(13_10)	{$(13_10)		sprite : spr_icon_phaser,$(13_10)		sprite_scale : 0.6,$(13_10)		name : "Phaser",$(13_10)		dps : 1,$(13_10)		description : "+3 Click Power",$(13_10)		onkill : false,$(13_10)		onappear : false,$(13_10)		onclick : false,$(13_10)		stat_buff : true,$(13_10)		stat_type : "click_base",$(13_10)		stat_value : 3,$(13_10)		func : function(){ }$(13_10)	}, $(13_10)	{$(13_10)		sprite : spr_icon_sonic,$(13_10)		sprite_scale : 0.4,$(13_10)		name : "Sonic Driver",$(13_10)		dps : 20,$(13_10)		description : "50% Gold on click",$(13_10)		onkill : false,$(13_10)		onappear : false,$(13_10)		onclick : true,$(13_10)		stat_buff : false,$(13_10)		stat_type : "",$(13_10)		stat_value : 0,$(13_10)		func : function(){ if(irandom(100) < 20) { global.save.bank += 7; audio_play_sound(snd_gold, 0, 0); }}$(13_10)	},$(13_10)	{$(13_10)		sprite : spr_icon_blaster,$(13_10)		sprite_scale : 0.5,$(13_10)		name : "Blaster",$(13_10)		dps : 400,$(13_10)		description : "40% Gold Chance on kill",$(13_10)		onkill : true,$(13_10)		onappear : false,$(13_10)		onclick : false,$(13_10)		stat_buff : false,$(13_10)		stat_type : "",$(13_10)		stat_value : 0,$(13_10)		func : function(){ if(irandom(100) < 40) { global.save.bank += obj_enemy.gold / 10; }}$(13_10)	}, $(13_10)	{$(13_10)		sprite : spr_icon_blowtorch,$(13_10)		sprite_scale : 0.5,$(13_10)		name : "Blowtorch",$(13_10)		dps : 3500,$(13_10)		description : "30% Fire Chance on click",$(13_10)		onkill : false,$(13_10)		onappear : false,$(13_10)		onclick : true,$(13_10)		stat_buff : false,$(13_10)		stat_type : "",$(13_10)		stat_value : 0,$(13_10)		func : function(){ if(irandom(100) < 30) { with(obj_enemy) onfire = true; }}$(13_10)	}, $(13_10)	{$(13_10)		sprite : spr_icon_chemical_pink,$(13_10)		sprite_scale : 0.4,$(13_10)		name : "Chemical D",$(13_10)		dps : 195000,$(13_10)		description : "40% Crit Chance",$(13_10)		onkill : false,$(13_10)		onappear : false,$(13_10)		onclick : false,$(13_10)		stat_buff : true,$(13_10)		stat_type : "crit_base",$(13_10)		stat_value : 40,$(13_10)		func : function(){ }$(13_10)	}, $(13_10)	{$(13_10)		sprite : spr_icon_chemical_purple,$(13_10)		sprite_scale : 0.4,$(13_10)		name : "Chemical N",$(13_10)		dps : 1800000,$(13_10)		description : "30% Augment Chance",$(13_10)		onkill : false,$(13_10)		onappear : false,$(13_10)		onclick : false,$(13_10)		stat_buff : true,$(13_10)		stat_type : "augment_base",$(13_10)		stat_value : 30,$(13_10)		func : function(){ }$(13_10)	}, $(13_10)	{$(13_10)		sprite : spr_icon_blaster_laser,$(13_10)		sprite_scale : 0.5,$(13_10)		name : "Laser",$(13_10)		dps : 2000000,$(13_10)		description : "15% 1/2 HP Chance on spawn",$(13_10)		onkill : false,$(13_10)		onappear : true,$(13_10)		onclick : false,$(13_10)		stat_buff : false,$(13_10)		stat_type : "",$(13_10)		stat_value : 0,$(13_10)		func : function(){ if(irandom(100) < 15) { with(obj_enemy) hp = max_hp / 2; }}$(13_10)	}, $(13_10)	{$(13_10)		sprite : spr_icon_plasma,$(13_10)		sprite_scale : 0.5,$(13_10)		name : "Plasma Sword",$(13_10)		dps : 20000000,$(13_10)		description : "30% chance x2 DPS on kill",$(13_10)		onkill : true,$(13_10)		onappear : false,$(13_10)		onclick : false,$(13_10)		stat_buff : false,$(13_10)		stat_type : "",$(13_10)		stat_value : 0,$(13_10)		func : function(){ if(irandom(100) < 30) { obj_game_manager.double_dps = true; }}$(13_10)	}$(13_10)]"
	return 
	[
		 
		{
			sprite : spr_icon_phaser,
			sprite_scale : 0.6,
			name : "Phaser",
			dps : 1,
			description : "+3 Click Power",
			onkill : false,
			onappear : false,
			onclick : false,
			stat_buff : true,
			stat_type : "click_base",
			stat_value : 3,
			func : function(){ }
		}, 
		{
			sprite : spr_icon_sonic,
			sprite_scale : 0.4,
			name : "Sonic Driver",
			dps : 20,
			description : "50% Gold on click",
			onkill : false,
			onappear : false,
			onclick : true,
			stat_buff : false,
			stat_type : "",
			stat_value : 0,
			func : function(){ if(irandom(100) < 20) { global.save.bank += 7; audio_play_sound(snd_gold, 0, 0); }}
		},
		{
			sprite : spr_icon_blaster,
			sprite_scale : 0.5,
			name : "Blaster",
			dps : 400,
			description : "40% Gold Chance on kill",
			onkill : true,
			onappear : false,
			onclick : false,
			stat_buff : false,
			stat_type : "",
			stat_value : 0,
			func : function(){ if(irandom(100) < 40) { global.save.bank += obj_enemy.gold / 10; }}
		}, 
		{
			sprite : spr_icon_blowtorch,
			sprite_scale : 0.5,
			name : "Blowtorch",
			dps : 3500,
			description : "30% Fire Chance on click",
			onkill : false,
			onappear : false,
			onclick : true,
			stat_buff : false,
			stat_type : "",
			stat_value : 0,
			func : function(){ if(irandom(100) < 30) { with(obj_enemy) onfire = true; }}
		}, 
		{
			sprite : spr_icon_chemical_pink,
			sprite_scale : 0.4,
			name : "Chemical D",
			dps : 195000,
			description : "40% Crit Chance",
			onkill : false,
			onappear : false,
			onclick : false,
			stat_buff : true,
			stat_type : "crit_base",
			stat_value : 40,
			func : function(){ }
		}, 
		{
			sprite : spr_icon_chemical_purple,
			sprite_scale : 0.4,
			name : "Chemical N",
			dps : 1800000,
			description : "30% Augment Chance",
			onkill : false,
			onappear : false,
			onclick : false,
			stat_buff : true,
			stat_type : "augment_base",
			stat_value : 30,
			func : function(){ }
		}, 
		{
			sprite : spr_icon_blaster_laser,
			sprite_scale : 0.5,
			name : "Laser",
			dps : 2000000,
			description : "15% 1/2 HP Chance on spawn",
			onkill : false,
			onappear : true,
			onclick : false,
			stat_buff : false,
			stat_type : "",
			stat_value : 0,
			func : function(){ if(irandom(100) < 15) { with(obj_enemy) hp = max_hp / 2; }}
		}, 
		{
			sprite : spr_icon_plasma,
			sprite_scale : 0.5,
			name : "Plasma Sword",
			dps : 20000000,
			description : "30% chance x2 DPS on kill",
			onkill : true,
			onappear : false,
			onclick : false,
			stat_buff : false,
			stat_type : "",
			stat_value : 0,
			func : function(){ if(irandom(100) < 30) { obj_game_manager.double_dps = true; }}
		}
	]}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 6E5F1145
/// @DnDArgument : "funcName" "accumulate_stats"
/// @DnDArgument : "arg" "stat_name"
function accumulate_stats(stat_name) {	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4DEAB0FA
	/// @DnDInput : 2
	/// @DnDParent : 6E5F1145
	/// @DnDArgument : "var" "base_name"
	/// @DnDArgument : "value" "stat_name + "_base""
	/// @DnDArgument : "var_1" "mult_name"
	/// @DnDArgument : "value_1" "stat_name + "_mult""
	var base_name = stat_name + "_base";
	var mult_name = stat_name + "_mult";

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6FCA00F3
	/// @DnDParent : 6E5F1145
	/// @DnDArgument : "var" "stat_amount"
	/// @DnDArgument : "value" "0"
	var stat_amount = 0;

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 53C3F8BA
	/// @DnDApplyTo : obj_card
	/// @DnDParent : 6E5F1145
	with(obj_card) {
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 577BE126
		/// @DnDParent : 53C3F8BA
		/// @DnDArgument : "var" "flipped"
		/// @DnDArgument : "value" "true"
		if(flipped == true){	/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 20CD9136
			/// @DnDParent : 577BE126
			/// @DnDArgument : "var" "stat_buff"
			/// @DnDArgument : "value" "true"
			if(stat_buff == true){	/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 06CF3DA5
				/// @DnDParent : 20CD9136
				/// @DnDArgument : "var" "stat_type"
				/// @DnDArgument : "value" "base_name"
				if(stat_type == base_name){	/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 2B06E8AD
					/// @DnDParent : 06CF3DA5
					/// @DnDArgument : "expr" "stat_value"
					/// @DnDArgument : "expr_relative" "1"
					/// @DnDArgument : "var" "stat_amount"
					stat_amount += stat_value;}}}
	}

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 5D3F1232
	/// @DnDApplyTo : obj_card
	/// @DnDParent : 6E5F1145
	with(obj_card) {
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 06A5E593
		/// @DnDParent : 5D3F1232
		/// @DnDArgument : "var" "flipped"
		/// @DnDArgument : "value" "true"
		if(flipped == true){	/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 750A5C35
			/// @DnDParent : 06A5E593
			/// @DnDArgument : "var" "stat_buff"
			/// @DnDArgument : "value" "true"
			if(stat_buff == true){	/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 033BCF11
				/// @DnDParent : 750A5C35
				/// @DnDArgument : "var" "stat_type"
				/// @DnDArgument : "value" "mult_name"
				if(stat_type == mult_name){	/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 52FE275D
					/// @DnDParent : 033BCF11
					/// @DnDArgument : "expr" "stat_amount * stat_value"
					/// @DnDArgument : "var" "stat_amount"
					stat_amount = stat_amount * stat_value;}}}
	}

	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 113F3834
	/// @DnDParent : 6E5F1145
	/// @DnDArgument : "value" "stat_amount"
	return stat_amount;}