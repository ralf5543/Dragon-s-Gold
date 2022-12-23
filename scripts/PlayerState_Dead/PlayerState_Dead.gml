
function PlayerState_Dead(){
	
	if (can_lose_key_when_dead) {
		for (var i = 0; i < has_bronze_key; i ++) {
			// 0, (60 * facing), to be sure key are not popping in a wall
			var bronze_key = instance_create_layer(x + random_range(0, (60 * facing)), y + random_range(-50, -100), "layer_walls", obj_key);
			
			with (bronze_key) {
				value = KEYVALUE.BRASS;
				image_xscale = 0.5;
				image_yscale = 0.5;
				vsp = random_range(-5, -15);
			}
			has_bronze_key --;
		}
		
		for (var i = 0; i < has_silver_key; i ++) {
			var silver_key = instance_create_layer(x + random_range(0, (60 * facing)), y + random_range(-50, -100), "layer_walls", obj_key);
			
			with (silver_key) {
				value = KEYVALUE.SILVER;
				image_xscale = 0.5;
				image_yscale = 0.5;
				vsp = random_range(-5, -15);
			}
			has_silver_key --;
		}
		
		for (var i = 0; i < has_gold_key; i ++) {
			var gold_key = instance_create_layer(x + random_range(0, (60 * facing)), y + random_range(-50, -100), "layer_walls", obj_key);
			
			with (gold_key) {
				value = KEYVALUE.GOLD;
				image_xscale = 0.5;
				image_yscale = 0.5;
				vsp = random_range(-5, -15);
			}
			has_gold_key --;
		}
	}


	
	if (skeleton_animation_get() != "dead") {
		skeleton_animation_set("dead");	
		if (sexe == "male") {
			audio_play_sound(choose(snd_death_male1, snd_death_male2, snd_death_male3), 7, false);
		} else {
			audio_play_sound(choose(snd_death_female1, snd_death_female2, snd_death_female3), 7, false);
		}
		
		image_speed = 1;
		
		alarm[2] = 256; // rebirth 8 seconds later
	}

}