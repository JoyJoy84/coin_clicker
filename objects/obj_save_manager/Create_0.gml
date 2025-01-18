/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 094A0C14
/// @DnDComment : // Function to load data from the save file
/// @DnDArgument : "funcName" "load"
function load() {	/// @DnDAction : YoYo Games.Files.Buffer_Load
	/// @DnDVersion : 1
	/// @DnDHash : 541A0874
	/// @DnDComment : // Load the data in the file into a buffer
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "target" "buff"
	/// @DnDArgument : "target_temp" "1"
	/// @DnDArgument : "filename" ""idle.sav""
	var buff = buffer_load("idle.sav");

	/// @DnDAction : YoYo Games.Buffers.Buffer_Read
	/// @DnDVersion : 1
	/// @DnDHash : 72159F75
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "target" "buff_str"
	/// @DnDArgument : "target_temp" "1"
	/// @DnDArgument : "buffer" "buff"
	var buff_str = buffer_read(buff, buffer_string);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 4E8835D1
	/// @DnDComment : // Parse the buffer data
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "var" "global.save_buffer"
	/// @DnDArgument : "function" "json_parse"
	/// @DnDArgument : "arg" "buff_str"
	global.save_buffer = json_parse(buff_str);

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 7BC70982
	/// @DnDComment : // Move data from the save buffer to the save structure
	/// @DnDInput : 5
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "value" "global.save_buffer.bank"
	/// @DnDArgument : "value_1" "global.save_buffer.enemy_num"
	/// @DnDArgument : "value_2" "global.save_buffer.enemy_diff"
	/// @DnDArgument : "value_3" "global.save_buffer.enemy_hp"
	/// @DnDArgument : "value_4" "global.save_buffer.enemy_augments"
	/// @DnDArgument : "var" "save.bank"
	/// @DnDArgument : "var_1" "save.enemy_num"
	/// @DnDArgument : "var_2" "save.enemy_diff"
	/// @DnDArgument : "var_3" "save.enemy_hp"
	/// @DnDArgument : "var_4" "save.enemy_augments"
	global.save.bank = global.save_buffer.bank;
	global.save.enemy_num = global.save_buffer.enemy_num;
	global.save.enemy_diff = global.save_buffer.enemy_diff;
	global.save.enemy_hp = global.save_buffer.enemy_hp;
	global.save.enemy_augments = global.save_buffer.enemy_augments;

	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 2C265D72
	/// @DnDComment : // With the save buffer, check which cards should be unlocked
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "i < 8"
	for(var i = 0; i < 8; i += 1) {	/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 21E3A870
		/// @DnDComment : // If the save buffer says it should be unlocked, use the quick_unlock function
		/// @DnDParent : 2C265D72
		/// @DnDArgument : "var" "global.save_buffer.card_unlocks[i]"
		/// @DnDArgument : "value" "true"
		if(global.save_buffer.card_unlocks[i] == true){	/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 717A9C3C
			/// @DnDApplyTo : obj_card_dock.cards[i]
			/// @DnDParent : 21E3A870
			/// @DnDArgument : "function" "quick_unlock"
			with(obj_card_dock.cards[i]) {
				quick_unlock();
			}}}

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 4AAEB1FD
	/// @DnDComment : // Set up the unlock button
	/// @DnDApplyTo : obj_button_unlock
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "function" "setup"
	with(obj_button_unlock) {
		setup();
	}

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 368067EB
	/// @DnDComment : // Find how much time has been since the last save
	/// @DnDInput : 2
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "var" "since_last_save"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "date_second_span"
	/// @DnDArgument : "arg" "date_current_datetime()"
	/// @DnDArgument : "arg_1" "global.save_buffer.last_save"
	var since_last_save = date_second_span(date_current_datetime(), global.save_buffer.last_save);

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 0A753554
	/// @DnDComment : // Reset the dps amount
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "var" "dps"
	global.dps = 0;

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 136CF612
	/// @DnDComment : // Build up a baseline dps from the cards
	/// @DnDApplyTo : obj_card
	/// @DnDParent : 094A0C14
	with(obj_card) {
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4EF7B6D4
		/// @DnDComment : // Only add the cards' dps if they're unlocked
		/// @DnDParent : 136CF612
		/// @DnDArgument : "var" "flipped"
		/// @DnDArgument : "value" "true"
		if(flipped == true){	/// @DnDAction : YoYo Games.Common.Set_Global
			/// @DnDVersion : 1
			/// @DnDHash : 65A61BA7
			/// @DnDParent : 4EF7B6D4
			/// @DnDArgument : "value" "dps"
			/// @DnDArgument : "value_relative" "1"
			/// @DnDArgument : "var" "dps"
			global.dps += dps;}
	}

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 68105481
	/// @DnDComment : // Multiply the dps by the amount provided by the cards
	/// @DnDApplyTo : obj_card
	/// @DnDParent : 094A0C14
	with(obj_card) {
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 08C15847
		/// @DnDComment : // Only use the card if it's unlocked
		/// @DnDParent : 68105481
		/// @DnDArgument : "var" "flipped"
		/// @DnDArgument : "value" "true"
		if(flipped == true){	/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 0C30EDB9
			/// @DnDComment : // Only use the multiplier if it has a stat buff and the correct stat
			/// @DnDParent : 08C15847
			/// @DnDArgument : "var" "stat_buff"
			/// @DnDArgument : "value" "true"
			if(stat_buff == true){	/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 5DBC8D70
				/// @DnDParent : 0C30EDB9
				/// @DnDArgument : "var" "stat_type"
				/// @DnDArgument : "value" ""dps_mult""
				if(stat_type == "dps_mult"){	/// @DnDAction : YoYo Games.Common.Set_Global
					/// @DnDVersion : 1
					/// @DnDHash : 5AC0AB77
					/// @DnDParent : 5DBC8D70
					/// @DnDArgument : "value" "global.dps * stat_value"
					/// @DnDArgument : "var" "dps"
					global.dps = global.dps * stat_value;}}}
	}

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 68FA282B
	/// @DnDComment : // Find how much damage should have been done since the last save$(13_10)// Find the current amount of hp the enemy the save buffer is describing has$(13_10)// Make a temporary variable to track how many enemies should have died between last save and right now
	/// @DnDInput : 3
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "var" "damage_done"
	/// @DnDArgument : "value" "global.dps * since_last_save"
	/// @DnDArgument : "var_1" "curr_hp"
	/// @DnDArgument : "value_1" "global.save.enemy_hp[global.save.enemy_diff]"
	/// @DnDArgument : "var_2" "enemies_killed"
	/// @DnDArgument : "value_2" "0"
	var damage_done = global.dps * since_last_save;
	var curr_hp = global.save.enemy_hp[global.save.enemy_diff];
	var enemies_killed = 0;

	/// @DnDAction : YoYo Games.Loops.While_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 0A261982
	/// @DnDComment : // While the amount of damage done is over the amount of health the current simulated enemy would have, make more enemies
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "var" "damage_done"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "curr_hp"
	while ((damage_done >= curr_hp)) {
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0757D9B9
		/// @DnDComment : // This adds a second condition to the while loop to check if there is damage remaining
		/// @DnDParent : 0A261982
		/// @DnDArgument : "var" "damage_done"
		/// @DnDArgument : "not" "1"
		/// @DnDArgument : "op" "2"
		if(!(damage_done > 0)){	/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 76742286
			/// @DnDParent : 0757D9B9
			break;}
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3BF941FD
		/// @DnDComment : // Increment the amount of enemies killed between saves$(13_10)// Subtract the simulated enemy's health from the total amount of damage done
		/// @DnDInput : 2
		/// @DnDParent : 0A261982
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "expr_1" "-curr_hp"
		/// @DnDArgument : "expr_relative_1" "1"
		/// @DnDArgument : "var" "enemies_killed"
		/// @DnDArgument : "var_1" "damage_done"
		enemies_killed += 1;
		damage_done += -curr_hp;
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 13D93E84
		/// @DnDComment : // Simulate a new enemy's health$(13_10)// At level 0, it starts at 5, moves up to at 1 per enemy defeated, and then that amount goes up by 1 each enemy past 6
		/// @DnDParent : 0A261982
		/// @DnDArgument : "var" "global.save.enemy_diff"
		if(global.save.enemy_diff == 0){	/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 194B80F3
			/// @DnDInput : 3
			/// @DnDParent : 13D93E84
			/// @DnDArgument : "var" "add"
			/// @DnDArgument : "value" "min(4, global.save.enemy_num[global.save.enemy_diff])"
			/// @DnDArgument : "var_1" "n"
			/// @DnDArgument : "value_1" "max(0, global.save.enemy_num[global.save.enemy_diff] - 4)"
			/// @DnDArgument : "var_2" "sum"
			/// @DnDArgument : "value_2" "(n * (n + 1)) / 2"
			var add = min(4, global.save.enemy_num[global.save.enemy_diff]);
			var n = max(0, global.save.enemy_num[global.save.enemy_diff] - 4);
			var sum = (n * (n + 1)) / 2;
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 556A51C5
			/// @DnDParent : 13D93E84
			/// @DnDArgument : "expr" "5 + add + sum"
			/// @DnDArgument : "var" "curr_hp"
			curr_hp = 5 + add + sum;}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 374DCCBA
		/// @DnDParent : 0A261982
		else{	/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 3740CBA2
			/// @DnDComment : // Regular enemies' hp goes up by 10 after the first enemy defeated and then that amount goes up by 1$(13_10)			// For every difficulty past the initial, the increase is multiplied by 10
			/// @DnDParent : 374DCCBA
			/// @DnDArgument : "var" "global.save.enemy_num[global.save.enemy_diff]"
			/// @DnDArgument : "not" "1"
			if(!(global.save.enemy_num[global.save.enemy_diff] == 0)){	/// @DnDAction : YoYo Games.Common.Temp_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 34781CF9
				/// @DnDComment : // Build the sum of all numbers above and including 10 and the number of this enemy defeated to add to the hp
				/// @DnDInput : 2
				/// @DnDParent : 3740CBA2
				/// @DnDArgument : "var" "n"
				/// @DnDArgument : "value" "9 + global.save.enemy_num[global.save.enemy_diff]"
				/// @DnDArgument : "var_1" "sum"
				/// @DnDArgument : "value_1" "(n * (n + 1)) / 2"
				var n = 9 + global.save.enemy_num[global.save.enemy_diff];
				var sum = (n * (n + 1)) / 2;
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 5EB22433
				/// @DnDParent : 3740CBA2
				/// @DnDArgument : "expr" "-45"
				/// @DnDArgument : "expr_relative" "1"
				/// @DnDArgument : "var" "sum"
				sum += -45;
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 0BEAC140
				/// @DnDComment : // Add 100 to reach the basic health level
				/// @DnDInput : 2
				/// @DnDParent : 3740CBA2
				/// @DnDArgument : "expr" "100 + sum"
				/// @DnDArgument : "expr_1" "curr_hp * power(10, global.save.enemy_diff - 1)"
				/// @DnDArgument : "var" "curr_hp"
				/// @DnDArgument : "var_1" "curr_hp"
				curr_hp = 100 + sum;
				curr_hp = curr_hp * power(10, global.save.enemy_diff - 1);}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 65F68ABC
			/// @DnDComment : // Add 100 to reach the basic health level
			/// @DnDParent : 374DCCBA
			else{	/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 6EA9C590
				/// @DnDInput : 2
				/// @DnDParent : 65F68ABC
				/// @DnDArgument : "expr" "100"
				/// @DnDArgument : "expr_1" "curr_hp * power(10, global.save.enemy_diff - 1)"
				/// @DnDArgument : "var" "curr_hp"
				/// @DnDArgument : "var_1" "curr_hp"
				curr_hp = 100;
				curr_hp = curr_hp * power(10, global.save.enemy_diff - 1);}}
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 09AA6E12
	/// @DnDComment : // Subtract the remaining amount of damage from the hp
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "expr" "-damage_done"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "curr_hp"
	curr_hp += -damage_done;

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 515C88EE
	/// @DnDComment : // Find how much gold the simulated enemy would be worth
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "var" "gold"
	/// @DnDArgument : "value" "5"
	var gold = 5;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2B693CB0
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "expr" "gold * power(10, global.save.enemy_diff)"
	/// @DnDArgument : "var" "gold"
	gold = gold * power(10, global.save.enemy_diff);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 62A46713
	/// @DnDComment : // Add that amount of gold per enemy defeated to the bank
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "var" "enemies_killed"
	/// @DnDArgument : "op" "2"
	if(enemies_killed > 0){	/// @DnDAction : YoYo Games.Common.Set_Global
		/// @DnDVersion : 1
		/// @DnDHash : 35F9CB5B
		/// @DnDParent : 62A46713
		/// @DnDArgument : "value" "gold * enemies_killed"
		/// @DnDArgument : "value_relative" "1"
		/// @DnDArgument : "var" "save.bank"
		global.save.bank += gold * enemies_killed;}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 02A41E40
	/// @DnDComment : // If the bank has more than 5 billion gold, the game has been won
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "var" "global.save.bank"
	/// @DnDArgument : "op" "2"
	/// @DnDArgument : "value" "5000000000"
	if(global.save.bank > 5000000000){	/// @DnDAction : YoYo Games.Common.Set_Global
		/// @DnDVersion : 1
		/// @DnDHash : 1D2C7F8E
		/// @DnDParent : 02A41E40
		/// @DnDArgument : "value" "true"
		/// @DnDArgument : "var" "won"
		global.won = true;}

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 77A2D0D9
	/// @DnDComment : // Save the amount of hp the simulated enemy would have
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "value" "round(curr_hp)"
	/// @DnDArgument : "var" "save.enemy_hp[global.save.enemy_diff]"
	global.save.enemy_hp[global.save.enemy_diff] = round(curr_hp);

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 3217082A
	/// @DnDComment : // Create an instance of the away popup to display
	/// @DnDParent : 094A0C14
	/// @DnDArgument : "xpos" "room_width / 2"
	/// @DnDArgument : "ypos" "room_height / 2"
	/// @DnDArgument : "var" "popup"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_away_popup"
	/// @DnDArgument : "layer" ""Popups""
	/// @DnDSaveInfo : "objectid" "obj_away_popup"
	var popup = instance_create_layer(room_width / 2, room_height / 2, "Popups", obj_away_popup);

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 3E99C839
	/// @DnDComment : // Set up the popup's information
	/// @DnDApplyTo : popup
	/// @DnDParent : 094A0C14
	with(popup) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 269ADC61
		/// @DnDInput : 3
		/// @DnDParent : 3E99C839
		/// @DnDArgument : "function" "setup"
		/// @DnDArgument : "arg" "since_last_save"
		/// @DnDArgument : "arg_1" "enemies_killed"
		/// @DnDArgument : "arg_2" "gold * enemies_killed"
		setup(since_last_save, enemies_killed, gold * enemies_killed);
	}}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 76474714
/// @DnDComment : // Function to save data to a file
/// @DnDArgument : "funcName" "save"
function save() {	/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
	/// @DnDVersion : 1
	/// @DnDHash : 0AAC1AD9
	/// @DnDParent : 76474714
	/// @DnDArgument : "obj" "obj_tutorial"
	/// @DnDArgument : "not" "1"
	/// @DnDSaveInfo : "obj" "obj_tutorial"
	var l0AAC1AD9_0 = false;l0AAC1AD9_0 = instance_exists(obj_tutorial);if(!l0AAC1AD9_0){	/// @DnDAction : YoYo Games.Common.Exit_Event
		/// @DnDVersion : 1
		/// @DnDHash : 2E8FAE37
		/// @DnDParent : 0AAC1AD9
		exit;}

	/// @DnDAction : YoYo Games.Common.Execute_Code
	/// @DnDVersion : 1
	/// @DnDHash : 64E0C074
	/// @DnDComment : // Create a structure to save to the file with easily accessible data to it and the current time
	/// @DnDParent : 76474714
	/// @DnDArgument : "code" "var map = {$(13_10)		bank : global.save.bank,$(13_10)		enemy_diff : global.save.enemy_diff,$(13_10)		enemy_num : global.save.enemy_num,$(13_10)		enemy_augments : global.save.enemy_augments,$(13_10)		card_unlocks : [false, false, false, false, false, false, false, false],$(13_10)		enemy_hp : global.save.enemy_hp,$(13_10)		last_save : date_create_datetime(current_year, current_month, current_day, current_hour, current_minute, current_second),$(13_10)	};"
	var map = {
			bank : global.save.bank,
			enemy_diff : global.save.enemy_diff,
			enemy_num : global.save.enemy_num,
			enemy_augments : global.save.enemy_augments,
			card_unlocks : [false, false, false, false, false, false, false, false],
			enemy_hp : global.save.enemy_hp,
			last_save : date_create_datetime(current_year, current_month, current_day, current_hour, current_minute, current_second),
		};

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5A5EA9E9
	/// @DnDComment : // If the game is paused, the cards will be deactivated so activate them
	/// @DnDParent : 76474714
	/// @DnDArgument : "var" "global.paused"
	/// @DnDArgument : "value" "true"
	if(global.paused == true){	/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1070C418
		/// @DnDParent : 5A5EA9E9
		/// @DnDArgument : "function" "instance_activate_object"
		/// @DnDArgument : "arg" "obj_card_dock"
		instance_activate_object(obj_card_dock);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 21954E60
		/// @DnDParent : 5A5EA9E9
		/// @DnDArgument : "function" "instance_activate_object"
		/// @DnDArgument : "arg" "obj_card"
		instance_activate_object(obj_card);}

	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 589722B4
	/// @DnDComment : // Find whether each card is unlocked
	/// @DnDParent : 76474714
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "i < 8"
	for(var i = 0; i < 8; i += 1) {	/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 06CF0B32
		/// @DnDParent : 589722B4
		/// @DnDArgument : "var" "obj_card_dock.cards[i].flipped"
		/// @DnDArgument : "value" "true"
		if(obj_card_dock.cards[i].flipped == true){	/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6E18CCBF
			/// @DnDParent : 06CF0B32
			/// @DnDArgument : "expr" "true"
			/// @DnDArgument : "var" "map.card_unlocks[i]"
			map.card_unlocks[i] = true;}}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4618F000
	/// @DnDComment : // If the game is paused, deactivate the cards again
	/// @DnDParent : 76474714
	/// @DnDArgument : "var" "global.paused"
	/// @DnDArgument : "value" "true"
	if(global.paused == true){	/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 21755BCF
		/// @DnDParent : 4618F000
		/// @DnDArgument : "function" "instance_deactivate_object"
		/// @DnDArgument : "arg" "obj_card_dock"
		instance_deactivate_object(obj_card_dock);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 15EEE82E
		/// @DnDParent : 4618F000
		/// @DnDArgument : "function" "instance_deactivate_object"
		/// @DnDArgument : "arg" "obj_card"
		instance_deactivate_object(obj_card);}

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 06714E85
	/// @DnDComment : // Turn the save structure into a json string
	/// @DnDParent : 76474714
	/// @DnDArgument : "var" "json"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "json_stringify"
	/// @DnDArgument : "arg" "map"
	var json = json_stringify(map);

	/// @DnDAction : YoYo Games.Buffers.Buffer_Create
	/// @DnDVersion : 1
	/// @DnDHash : 624DB18B
	/// @DnDComment : // Create a buffer with length equal to the json string
	/// @DnDParent : 76474714
	/// @DnDArgument : "target" "buff"
	/// @DnDArgument : "target_temp" "1"
	var buff = buffer_create(64, buffer_grow, 1);

	/// @DnDAction : YoYo Games.Buffers.Buffer_Write
	/// @DnDVersion : 1
	/// @DnDHash : 0C068DF9
	/// @DnDComment : // Write the json string to the buffer
	/// @DnDParent : 76474714
	/// @DnDArgument : "buffer" "buff"
	/// @DnDArgument : "value" "json"
	buffer_write(buff, buffer_string, string(json));

	/// @DnDAction : YoYo Games.Files.Buffer_Save
	/// @DnDVersion : 1
	/// @DnDHash : 7ECE83BD
	/// @DnDComment : // Save the buffer to a file
	/// @DnDParent : 76474714
	/// @DnDArgument : "buffer" "buff"
	/// @DnDArgument : "filename" ""idle.sav""
	buffer_save(buff, "idle.sav");}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 0397F791
/// @DnDComment : // Function to reset the game back to its original state
/// @DnDArgument : "funcName" "reset"
function reset() {	/// @DnDAction : YoYo Games.Common.Execute_Code
	/// @DnDVersion : 1
	/// @DnDHash : 47585BD2
	/// @DnDComment : // Create a structure with all save information at where it started
	/// @DnDParent : 0397F791
	/// @DnDArgument : "code" "var map = {$(13_10)		bank : 0,$(13_10)		enemy_diff : 0,$(13_10)		enemy_num : [0, 0, 0, 0, 0, 0, 0, 0, 0],$(13_10)		enemy_augments : ["", "", "", "", "", "", "", "", ""],$(13_10)		card_unlocks : [false, false, false, false, false, false, false, false],$(13_10)		enemy_hp : [0, 0, 0, 0, 0, 0, 0, 0, 0],$(13_10)		last_save : date_create_datetime(current_year, current_month, current_day, current_hour, current_minute, current_second),$(13_10)	};"
	var map = {
			bank : 0,
			enemy_diff : 0,
			enemy_num : [0, 0, 0, 0, 0, 0, 0, 0, 0],
			enemy_augments : ["", "", "", "", "", "", "", "", ""],
			card_unlocks : [false, false, false, false, false, false, false, false],
			enemy_hp : [0, 0, 0, 0, 0, 0, 0, 0, 0],
			last_save : date_create_datetime(current_year, current_month, current_day, current_hour, current_minute, current_second),
		};

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6DDCDEC2
	/// @DnDComment : // Resume and reactivate all the game instances
	/// @DnDParent : 0397F791
	/// @DnDArgument : "function" "resume_everything"
	resume_everything();

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 0CCB1CD6
	/// @DnDComment : // Re-lock each card
	/// @DnDApplyTo : obj_card
	/// @DnDParent : 0397F791
	with(obj_card) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 191A2F7E
		/// @DnDInput : 2
		/// @DnDParent : 0CCB1CD6
		/// @DnDArgument : "expr" "false"
		/// @DnDArgument : "expr_1" "false"
		/// @DnDArgument : "var" "unlocked"
		/// @DnDArgument : "var_1" "flipped"
		unlocked = false;
		flipped = false;
	
		/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 471A2071
		/// @DnDParent : 0CCB1CD6
		/// @DnDArgument : "value" "spr_card_back"
		/// @DnDArgument : "instvar" "10"
		sprite_index = spr_card_back;
	}

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 30131EB1
	/// @DnDComment : // Turn the structure into a json string
	/// @DnDParent : 0397F791
	/// @DnDArgument : "var" "json"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "json_stringify"
	/// @DnDArgument : "arg" "map"
	var json = json_stringify(map);

	/// @DnDAction : YoYo Games.Buffers.Buffer_Create
	/// @DnDVersion : 1
	/// @DnDHash : 545A48DF
	/// @DnDComment : // Create a buffer with length equal to the json string
	/// @DnDParent : 0397F791
	/// @DnDArgument : "target" "buff"
	/// @DnDArgument : "target_temp" "1"
	var buff = buffer_create(64, buffer_grow, 1);

	/// @DnDAction : YoYo Games.Buffers.Buffer_Write
	/// @DnDVersion : 1
	/// @DnDHash : 39E4A0ED
	/// @DnDComment : // Write the json to the buffer
	/// @DnDParent : 0397F791
	/// @DnDArgument : "buffer" "buff"
	/// @DnDArgument : "value" "json"
	buffer_write(buff, buffer_string, string(json));

	/// @DnDAction : YoYo Games.Files.Buffer_Save
	/// @DnDVersion : 1
	/// @DnDHash : 11E7763F
	/// @DnDComment : // Save the buffer to a file
	/// @DnDParent : 0397F791
	/// @DnDArgument : "buffer" "buff"
	/// @DnDArgument : "filename" ""idle.sav""
	buffer_save(buff, "idle.sav");}

/// @DnDAction : YoYo Games.Time.Time_Source_Create
/// @DnDVersion : 1
/// @DnDHash : 054944AC
/// @DnDComment : // Create a time source to save every 5 seconds
/// @DnDArgument : "idx" "save_source"
/// @DnDArgument : "parent" "time_source_game"
/// @DnDArgument : "period" "5"
/// @DnDArgument : "callback" "save"
/// @DnDArgument : "reps" "-1"
save_source = time_source_create(time_source_game, 5, time_source_units_seconds, save, [], -1, time_source_expire_after);

/// @DnDAction : YoYo Games.Time.Time_Source_Start
/// @DnDVersion : 1
/// @DnDHash : 507D2847
/// @DnDArgument : "idx" "save_source"
time_source_start(save_source);