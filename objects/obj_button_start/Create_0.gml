/// @DnDAction : YoYo Games.Audio.If_Audio_Playing
/// @DnDVersion : 1
/// @DnDHash : 658C3540
/// @DnDArgument : "soundid" "snd_music"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "soundid" "snd_music"
var l658C3540_0 = snd_music;if (!audio_is_playing(l658C3540_0)){	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 5EF382DA
	/// @DnDParent : 658C3540
	/// @DnDArgument : "soundid" "snd_music"
	/// @DnDArgument : "loop" "1"
	/// @DnDSaveInfo : "soundid" "snd_music"
	audio_play_sound(snd_music, 0, 1, 1.0, undefined, 1.0);}