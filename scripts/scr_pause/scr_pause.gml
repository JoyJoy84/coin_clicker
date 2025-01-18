/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 04AF6B6D
/// @DnDArgument : "funcName" "pause_everything"
function pause_everything() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 79FC73B3
	/// @DnDApplyTo : obj_particle_manager
	/// @DnDParent : 04AF6B6D
	with(obj_particle_manager) {
		/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
		/// @DnDVersion : 1
		/// @DnDHash : 549D918C
		/// @DnDParent : 79FC73B3
		/// @DnDArgument : "obj" "obj_enemy"
		/// @DnDSaveInfo : "obj" "obj_enemy"
		var l549D918C_0 = false;
		l549D918C_0 = instance_exists(obj_enemy);
		if(l549D918C_0)
		{
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 1080F4FD
			/// @DnDInput : 2
			/// @DnDParent : 549D918C
			/// @DnDArgument : "function" "part_system_automatic_update"
			/// @DnDArgument : "arg" "obj_enemy.particle"
			/// @DnDArgument : "arg_1" "false"
			part_system_automatic_update(obj_enemy.particle, false);
		}
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 2CD39FD1
		/// @DnDInput : 2
		/// @DnDParent : 79FC73B3
		/// @DnDArgument : "function" "part_system_automatic_update"
		/// @DnDArgument : "arg" "particle_system"
		/// @DnDArgument : "arg_1" "false"
		part_system_automatic_update(particle_system, false);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 708C058A
		/// @DnDInput : 2
		/// @DnDParent : 79FC73B3
		/// @DnDArgument : "function" "part_system_automatic_draw"
		/// @DnDArgument : "arg" "particle_system"
		/// @DnDArgument : "arg_1" "false"
		part_system_automatic_draw(particle_system, false);
	}

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 32B1E8FC
	/// @DnDParent : 04AF6B6D
	/// @DnDArgument : "function" "instance_deactivate_layer"
	/// @DnDArgument : "arg" ""UI_Interactible""
	instance_deactivate_layer("UI_Interactible");

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6D870ACF
	/// @DnDParent : 04AF6B6D
	/// @DnDArgument : "function" "instance_deactivate_layer"
	/// @DnDArgument : "arg" ""UI_Background""
	instance_deactivate_layer("UI_Background");

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6739C386
	/// @DnDParent : 04AF6B6D
	/// @DnDArgument : "function" "instance_deactivate_layer"
	/// @DnDArgument : "arg" ""Enemy""
	instance_deactivate_layer("Enemy");
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 67ACBEFE
/// @DnDArgument : "funcName" "resume_everything"
function resume_everything() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 018A19BA
	/// @DnDApplyTo : obj_particle_manager
	/// @DnDParent : 67ACBEFE
	with(obj_particle_manager) {
		/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
		/// @DnDVersion : 1
		/// @DnDHash : 34437F16
		/// @DnDParent : 018A19BA
		/// @DnDArgument : "obj" "obj_enemy"
		/// @DnDSaveInfo : "obj" "obj_enemy"
		var l34437F16_0 = false;
		l34437F16_0 = instance_exists(obj_enemy);
		if(l34437F16_0)
		{
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 513BE4E3
			/// @DnDInput : 2
			/// @DnDParent : 34437F16
			/// @DnDArgument : "function" "part_system_automatic_update"
			/// @DnDArgument : "arg" "obj_enemy.particle"
			/// @DnDArgument : "arg_1" "true"
			part_system_automatic_update(obj_enemy.particle, true);
		}
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1229EDCF
		/// @DnDInput : 2
		/// @DnDParent : 018A19BA
		/// @DnDArgument : "function" "part_system_automatic_update"
		/// @DnDArgument : "arg" "particle_system"
		/// @DnDArgument : "arg_1" "true"
		part_system_automatic_update(particle_system, true);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1E580950
		/// @DnDInput : 2
		/// @DnDParent : 018A19BA
		/// @DnDArgument : "function" "part_system_automatic_draw"
		/// @DnDArgument : "arg" "particle_system"
		/// @DnDArgument : "arg_1" "true"
		part_system_automatic_draw(particle_system, true);
	}

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 5F3D350D
	/// @DnDParent : 67ACBEFE
	/// @DnDArgument : "function" "instance_activate_layer"
	/// @DnDArgument : "arg" ""UI_Interactible""
	instance_activate_layer("UI_Interactible");

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1DFAFB68
	/// @DnDParent : 67ACBEFE
	/// @DnDArgument : "function" "instance_activate_layer"
	/// @DnDArgument : "arg" ""UI_Background""
	instance_activate_layer("UI_Background");

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 54937429
	/// @DnDParent : 67ACBEFE
	/// @DnDArgument : "function" "instance_activate_layer"
	/// @DnDArgument : "arg" ""Enemy""
	instance_activate_layer("Enemy");
}