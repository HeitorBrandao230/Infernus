/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2A12B36D
/// @DnDArgument : "code" "global.conta_alma = global.conta_alma + global.conta_alma_aparente$(13_10)room_goto_next();"
global.conta_alma = global.conta_alma + global.conta_alma_aparente
room_goto_next();

/// @DnDAction : YoYo Games.Audio.Stop_All_Audio
/// @DnDVersion : 1
/// @DnDHash : 08896C31
audio_stop_all();