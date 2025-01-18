/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
/// @DnDVersion : 1
/// @DnDHash : 1C88F518
/// @DnDComment : // Draw the character's shadow
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "191.2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "alpha" "image_alpha"
/// @DnDArgument : "sprite" "Character_Shadow"
/// @DnDSaveInfo : "sprite" "Character_Shadow"
draw_sprite_ext(Character_Shadow, 0, x + 0, y + 191.2, 1, 1, 0, $FFFFFF & $ffffff, image_alpha);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 14E7969D
/// @DnDComment : // Draw the aura particle system
/// @DnDArgument : "function" "part_system_drawit"
/// @DnDArgument : "arg" "particle"
part_system_drawit(particle);

/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
/// @DnDVersion : 1
/// @DnDHash : 245BEAA7
/// @DnDComment : // Draw the enemy - if it's on fire, give it a red hue
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "xscale" "0"
/// @DnDArgument : "xscale_relative" "1"
/// @DnDArgument : "yscale" "0"
/// @DnDArgument : "yscale_relative" "1"
/// @DnDArgument : "rot_relative" "1"
/// @DnDArgument : "alpha" "image_alpha"
/// @DnDArgument : "sprite" "sprite_index"
/// @DnDArgument : "frame" "image_index"
/// @DnDArgument : "col" "onfire ? c_red : c_white"
draw_sprite_ext(sprite_index, image_index, x + 0, y + 0, image_xscale + 0, image_yscale + 0, image_angle + 0, onfire ? c_red : c_white & $ffffff, image_alpha);