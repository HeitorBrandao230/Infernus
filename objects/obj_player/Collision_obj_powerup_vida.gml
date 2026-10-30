/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 6D23EF37
/// @DnDArgument : "code" "global.vida++$(13_10)with(other) instance_destroy();"
global.vida++
with(other) instance_destroy();

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 32FA5261
/// @DnDArgument : "soundid" "som_coleta_vida"
/// @DnDSaveInfo : "soundid" "som_coleta_vida"
audio_play_sound(som_coleta_vida, 0, 0, 1.0, undefined, 1.0);