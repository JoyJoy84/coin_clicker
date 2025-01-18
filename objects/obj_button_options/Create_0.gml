/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 1C6296C2
/// @DnDComment : // Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1B96D1D2
/// @DnDComment : // Create a variable to store the pause sequence
/// @DnDArgument : "var" "pause_seq"
pause_seq = 0;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 0573628E
/// @DnDComment : // Create a function to trigger when the button is pressed
/// @DnDArgument : "funcName" "press_function"
function press_function() {	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 54D2DDB0
	/// @DnDComment : // Only trigger the function if the game is not paused
	/// @DnDParent : 0573628E
	/// @DnDArgument : "var" "global.paused"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	if(!(global.paused == true)){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 15661A5D
		/// @DnDComment : // Pause the game
		/// @DnDParent : 54D2DDB0
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "global.paused"
		global.paused = true;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 105E4D39
		/// @DnDComment : // Save the current game frame
		/// @DnDInput : 2
		/// @DnDParent : 54D2DDB0
		/// @DnDArgument : "var" "global.paused_surf"
		/// @DnDArgument : "function" "surface_create"
		/// @DnDArgument : "arg" "room_width"
		/// @DnDArgument : "arg_1" "room_height"
		global.paused_surf = surface_create(room_width, room_height);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 553D4266
		/// @DnDParent : 54D2DDB0
		/// @DnDArgument : "function" "surface_set_target"
		/// @DnDArgument : "arg" "global.paused_surf"
		surface_set_target(global.paused_surf);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 18608E20
		/// @DnDParent : 54D2DDB0
		/// @DnDArgument : "function" "gpu_set_blendenable"
		/// @DnDArgument : "arg" "false"
		gpu_set_blendenable(false);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 5DBDAC15
		/// @DnDInput : 3
		/// @DnDParent : 54D2DDB0
		/// @DnDArgument : "function" "draw_surface"
		/// @DnDArgument : "arg" "application_surface"
		/// @DnDArgument : "arg_1" "0"
		/// @DnDArgument : "arg_2" "0"
		draw_surface(application_surface, 0, 0);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 64A752DB
		/// @DnDParent : 54D2DDB0
		/// @DnDArgument : "function" "gpu_set_blendenable"
		/// @DnDArgument : "arg" "true"
		gpu_set_blendenable(true);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 3128F61A
		/// @DnDParent : 54D2DDB0
		/// @DnDArgument : "function" "surface_reset_target"
		surface_reset_target();
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 4464BF40
		/// @DnDComment : // Pause
		/// @DnDParent : 54D2DDB0
		/// @DnDArgument : "function" "pause_everything"
		pause_everything();
	
		/// @DnDAction : YoYo Games.Sequences.Sequence_Create
		/// @DnDVersion : 1
		/// @DnDHash : 4D208580
		/// @DnDComment : // Create and spawn the spawn sequence
		/// @DnDParent : 54D2DDB0
		/// @DnDArgument : "xpos" "room_width / 2"
		/// @DnDArgument : "ypos" "room_height / 2"
		/// @DnDArgument : "var" "pause_seq"
		/// @DnDArgument : "sequenceid" "seq_pause"
		/// @DnDArgument : "layer" ""Popups""
		/// @DnDSaveInfo : "sequenceid" "seq_pause"
		pause_seq = layer_sequence_create("Popups", room_width / 2, room_height / 2, seq_pause);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 13CA2808
		/// @DnDParent : 54D2DDB0
		/// @DnDArgument : "soundid" "snd_popup"
		/// @DnDSaveInfo : "soundid" "snd_popup"
		audio_play_sound(snd_popup, 0, 0, 1.0, undefined, 1.0);}}