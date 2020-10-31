/// @description Insert description here

audio_sound_pitch(snd_fireball_hit, choose(.8, 1, 1.2));
audio_play_sound(snd_fireball_hit, 6, false);
instance_destroy();