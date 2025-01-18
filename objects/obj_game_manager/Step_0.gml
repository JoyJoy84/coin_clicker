/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 02EA6957
/// @DnDComment : // Don't perform this event if the game is paused because it's moment-to-moment game logic
/// @DnDArgument : "var" "global.paused"
/// @DnDArgument : "value" "true"
if(global.paused == true){	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 61103C0F
	/// @DnDParent : 02EA6957
	exit;}

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 1F7B432C
/// @DnDComment : // Reset the dps amount
/// @DnDArgument : "var" "dps"
global.dps = 0;

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 43014EFB
/// @DnDComment : // Build up a baseline dps from the cards
/// @DnDApplyTo : obj_card
with(obj_card) {
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4CFC3EB8
	/// @DnDComment : // Only add the cards' dps if they're unlocked
	/// @DnDParent : 43014EFB
	/// @DnDArgument : "var" "flipped"
	/// @DnDArgument : "value" "true"
	if(flipped == true){	/// @DnDAction : YoYo Games.Common.Set_Global
		/// @DnDVersion : 1
		/// @DnDHash : 723BCD0C
		/// @DnDParent : 4CFC3EB8
		/// @DnDArgument : "value" "dps"
		/// @DnDArgument : "value_relative" "1"
		/// @DnDArgument : "var" "dps"
		global.dps += dps;}
}

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 07578AB2
/// @DnDComment : // Multiply the dps by the amount provided by the cards
/// @DnDApplyTo : obj_card
with(obj_card) {
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 55A0DFF0
	/// @DnDComment : // Only use the card if it's unlocked
	/// @DnDParent : 07578AB2
	/// @DnDArgument : "var" "flipped"
	/// @DnDArgument : "value" "true"
	if(flipped == true){	/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4C6E25AB
		/// @DnDComment : // Only use the multiplier if it has a stat buff and the correct stat
		/// @DnDParent : 55A0DFF0
		/// @DnDArgument : "var" "stat_buff"
		/// @DnDArgument : "value" "true"
		if(stat_buff == true){	/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 024B5893
			/// @DnDParent : 4C6E25AB
			/// @DnDArgument : "var" "stat_type"
			/// @DnDArgument : "value" ""dps_mult""
			if(stat_type == "dps_mult"){	/// @DnDAction : YoYo Games.Common.Set_Global
				/// @DnDVersion : 1
				/// @DnDHash : 31C1339D
				/// @DnDParent : 024B5893
				/// @DnDArgument : "value" "global.dps * stat_value"
				/// @DnDArgument : "var" "dps"
				global.dps = global.dps * stat_value;}}}
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 7EACD53E
/// @DnDComment : // If double dps is active, multiply the total by 2
/// @DnDArgument : "var" "double_dps"
/// @DnDArgument : "value" "true"
if(double_dps == true){	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 565AC4F4
	/// @DnDParent : 7EACD53E
	/// @DnDArgument : "value" "global.dps * 2"
	/// @DnDArgument : "var" "dps"
	global.dps = global.dps * 2;}

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 11FCAFAE
/// @DnDComment : // Round the amount so that it's easier to manage
/// @DnDArgument : "value" "round(global.dps)"
/// @DnDArgument : "var" "dps"
global.dps = round(global.dps);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 655B73E5
/// @DnDComment : // Manage double dps
/// @DnDArgument : "var" "double_dps"
/// @DnDArgument : "value" "true"
if(double_dps == true){	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6E7A6CE8
	/// @DnDComment : // Add to the double dps timer
	/// @DnDParent : 655B73E5
	/// @DnDArgument : "expr" "delta_time / 1000000"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "double_timer"
	double_timer += delta_time / 1000000;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5030D488
	/// @DnDComment : // If double dps has been active for over 5 seconds reset it
	/// @DnDParent : 655B73E5
	/// @DnDArgument : "var" "double_timer"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "5"
	if(double_timer >= 5){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 636AE6E2
		/// @DnDInput : 2
		/// @DnDParent : 5030D488
		/// @DnDArgument : "expr" "false"
		/// @DnDArgument : "var" "double_dps"
		/// @DnDArgument : "var_1" "double_timer"
		double_dps = false;
		double_timer = 0;}}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7AC5B768
/// @DnDComment : // Log the amount of time since the last frame
/// @DnDArgument : "expr" "delta_time / 1000000"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "damage_timer"
damage_timer += delta_time / 1000000;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 4821C69E
/// @DnDComment : // If the cards would deal any damage
/// @DnDArgument : "var" "global.dps"
/// @DnDArgument : "op" "2"
if(global.dps > 0){	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 19368D77
	/// @DnDComment : // Check whether the amount of time logged over the amount needed to deal 1 damage to the enemy
	/// @DnDParent : 4821C69E
	/// @DnDArgument : "var" "damage_timer"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "1 / global.dps"
	if(damage_timer >= 1 / global.dps){	/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7A3CB106
		/// @DnDComment : // If the amount of time between frames is over that amount of time then multiple ticks of damage need to happen between frames$(13_10)// If multiple ticks need to happen then find how many ticks should happen so that it doesn't lag the game
		/// @DnDParent : 19368D77
		/// @DnDArgument : "var" "delta_time"
		/// @DnDArgument : "op" "4"
		/// @DnDArgument : "value" "1 /  global.dps"
		if(delta_time >= 1 /  global.dps){	/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 033F1D33
			/// @DnDParent : 7A3CB106
			/// @DnDArgument : "var" "ticks"
			/// @DnDArgument : "value" "floor(damage_timer / (1 / global.dps))"
			var ticks = floor(damage_timer / (1 / global.dps));
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 33141AC8
			/// @DnDApplyTo : obj_enemy
			/// @DnDParent : 7A3CB106
			/// @DnDArgument : "expr" "-ticks"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "hp"
			with(obj_enemy) {
			hp += -ticks;
			
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 5C5F1AD9
			/// @DnDParent : 7A3CB106
			/// @DnDArgument : "expr" "-ticks / global.dps"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "damage_timer"
			damage_timer += -ticks / global.dps;}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 13C0EC1A
		/// @DnDComment : // Otherwise just deal 1 damage
		/// @DnDParent : 19368D77
		else{	/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1284E62D
			/// @DnDApplyTo : obj_enemy
			/// @DnDParent : 13C0EC1A
			/// @DnDArgument : "expr" "-1"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "hp"
			with(obj_enemy) {
			hp += -1;
			
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 57BC1A75
			/// @DnDParent : 13C0EC1A
			/// @DnDArgument : "expr" "-1 / global.dps"
			/// @DnDArgument : "var" "damage_timer"
			damage_timer = -1 / global.dps;}}}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 4C6C843F
/// @DnDComment : // If the player has over 5 billion gold, the game is won$(13_10)// Only do it once and only if there's no other popup on screen
/// @DnDArgument : "var" "global.save.bank"
/// @DnDArgument : "op" "4"
/// @DnDArgument : "value" "5000000000"
if(global.save.bank >= 5000000000){	/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
	/// @DnDVersion : 1
	/// @DnDHash : 29433361
	/// @DnDParent : 4C6C843F
	/// @DnDArgument : "obj" "obj_win_box"
	/// @DnDArgument : "not" "1"
	/// @DnDSaveInfo : "obj" "obj_win_box"
	var l29433361_0 = false;l29433361_0 = instance_exists(obj_win_box);if(!l29433361_0){	/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
		/// @DnDVersion : 1
		/// @DnDHash : 449C37ED
		/// @DnDParent : 29433361
		/// @DnDArgument : "obj" "obj_away_popup"
		/// @DnDArgument : "not" "1"
		/// @DnDSaveInfo : "obj" "obj_away_popup"
		var l449C37ED_0 = false;l449C37ED_0 = instance_exists(obj_away_popup);if(!l449C37ED_0){	/// @DnDAction : YoYo Games.Common.Set_Global
			/// @DnDVersion : 1
			/// @DnDHash : 2442078E
			/// @DnDComment : // Set that the game is won and paused
			/// @DnDInput : 2
			/// @DnDParent : 449C37ED
			/// @DnDArgument : "value" "true"
			/// @DnDArgument : "value_1" "true"
			/// @DnDArgument : "var" "won"
			/// @DnDArgument : "var_1" "paused"
			global.won = true;
			global.paused = true;
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 6A5EBE67
			/// @DnDComment : // Draw the game to a surface to display while paused
			/// @DnDInput : 2
			/// @DnDParent : 449C37ED
			/// @DnDArgument : "var" "global.paused_surf"
			/// @DnDArgument : "function" "surface_create"
			/// @DnDArgument : "arg" "room_width"
			/// @DnDArgument : "arg_1" "room_height"
			global.paused_surf = surface_create(room_width, room_height);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 717D2788
			/// @DnDParent : 449C37ED
			/// @DnDArgument : "function" "surface_set_target"
			/// @DnDArgument : "arg" "global.paused_surf"
			surface_set_target(global.paused_surf);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 7B2452CA
			/// @DnDParent : 449C37ED
			/// @DnDArgument : "function" "gpu_set_blendenable"
			/// @DnDArgument : "arg" "false"
			gpu_set_blendenable(false);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 03394CF3
			/// @DnDInput : 3
			/// @DnDParent : 449C37ED
			/// @DnDArgument : "function" "draw_surface"
			/// @DnDArgument : "arg" "application_surface"
			/// @DnDArgument : "arg_1" "0"
			/// @DnDArgument : "arg_2" "0"
			draw_surface(application_surface, 0, 0);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 1010C3E5
			/// @DnDParent : 449C37ED
			/// @DnDArgument : "function" "gpu_set_blendenable"
			/// @DnDArgument : "arg" "true"
			gpu_set_blendenable(true);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 3C99F302
			/// @DnDParent : 449C37ED
			/// @DnDArgument : "function" "surface_reset_target"
			surface_reset_target();
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 0B3C6C86
			/// @DnDComment : // Pause the game layers
			/// @DnDParent : 449C37ED
			/// @DnDArgument : "function" "pause_everything"
			pause_everything();
		
			/// @DnDAction : YoYo Games.Instances.Create_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 3B2C6E04
			/// @DnDComment : // Create an instance of the win interface
			/// @DnDParent : 449C37ED
			/// @DnDArgument : "xpos" "room_width / 2"
			/// @DnDArgument : "ypos" "room_height / 2"
			/// @DnDArgument : "objectid" "obj_win_box"
			/// @DnDArgument : "layer" ""Popups""
			/// @DnDSaveInfo : "objectid" "obj_win_box"
			instance_create_layer(room_width / 2, room_height / 2, "Popups", obj_win_box);}}}