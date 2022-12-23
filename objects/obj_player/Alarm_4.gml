/// @description Wizard lightning

audio_play_sound(snd_lightning, 6, false);

var lightning = instance_create_layer(x + (other.facing * 128), y, "front_objects", obj_lightning);

lightning.facing = other.facing;

















