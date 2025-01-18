/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 4B6A7FA6
/// @DnDComment : // Find an appropriate width for the card sprite
/// @DnDInput : 2
/// @DnDArgument : "var" "w2"
/// @DnDArgument : "value" "sprite_get_width(spr_card_back) * 3 / 8"
/// @DnDArgument : "var_1" "h2"
/// @DnDArgument : "value_1" "sprite_get_height(spr_card_back) * 3 / 8"
var w2 = sprite_get_width(spr_card_back) * 3 / 8;
var h2 = sprite_get_height(spr_card_back) * 3 / 8;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 674C899A
/// @DnDComment : // Draw the card sprite slightly slanted$(13_10)// The sequence will appear just above because it was created after this was
/// @DnDInput : 11
/// @DnDArgument : "function" "draw_sprite_pos"
/// @DnDArgument : "arg" "spr_card_back"
/// @DnDArgument : "arg_1" "0"
/// @DnDArgument : "arg_2" "x - w2 - 10"
/// @DnDArgument : "arg_3" "y - h2"
/// @DnDArgument : "arg_4" "x + w2 - 10"
/// @DnDArgument : "arg_5" "y - h2"
/// @DnDArgument : "arg_6" "x + w2 + 10"
/// @DnDArgument : "arg_7" "y + h2"
/// @DnDArgument : "arg_8" "x - w2 + 10"
/// @DnDArgument : "arg_9" "y + h2"
/// @DnDArgument : "arg_10" "image_alpha"
draw_sprite_pos(spr_card_back, 0, x - w2 - 10, y - h2, x + w2 - 10, y - h2, x + w2 + 10, y + h2, x - w2 + 10, y + h2, image_alpha);