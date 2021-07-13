/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1
/// @DnDHash : 7B08D254
/// @DnDArgument : "soundid" "sfx_coin_cluster6"
audio_play_sound(sfx_coin_cluster6, 0, 0);

/// @DnDAction : YoYo Games.Instances.Call_User_Event
/// @DnDVersion : 1
/// @DnDHash : 39C64D3A
/// @DnDApplyTo : other
/// @DnDArgument : "event" "3"
with(other) {
event_user(3);
}

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 5B0750D8
instance_destroy();