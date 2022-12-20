/// @description Insert description here

if (can_play_sound) {
	audio_sound_pitch(snd_fireball_hit, choose(.8, 1, 1.2));
	audio_play_sound(snd_fireball_hit, 6, false);
	can_play_sound = false;
}

switch (size) {
		case "small":
		with(other) {
			
		    switch (size) {
				case "small":
				speed = 0;
				other.speed = 0;
				sprite_index = spr_fireball_explosion;
				other.sprite_index = spr_fireball_explosion;
				break;
				
				case "medium" or "large":
				other.speed = 0;
				other.sprite_index = spr_fireball_explosion;
				break;
			}
		}
		break;
		
		case "medium":
		with(other) {
			
		    switch (size) {
				case "medium":
				speed = 0;
				other.speed = 0;
				sprite_index = spr_fireball_explosion;
				other.sprite_index = spr_fireball_explosion;
				break;
				
				case "small":
				speed = 0;
				sprite_index = spr_fireball_explosion;
				break;
				
				case "large":
				other.speed = 0;
				other.sprite_index = spr_fireball_explosion;
				break;
			}
		}
		break;
		
		case "large":
		with(other) {
			
		    switch (size) {
				case "large":
				speed = 0;
				other.speed = 0;
				sprite_index = spr_fireball_explosion;
				other.sprite_index = spr_fireball_explosion;
				break;
				
				case "medium" or "small":
				speed = 0;
				sprite_index = spr_fireball_explosion;
				break;
			}
		}
		break;
}
			
if (size == "small") {
	sprite_index = spr_fireball_explosion;
	speed = 0;
	image_speed = 1;
	instance_destroy(other);

// if medium or large fireball, arrow is destroyed
} else {
	instance_destroy(other);
}
