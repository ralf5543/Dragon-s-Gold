
function PlayerState_Dead(){
	
	if (can_lose_key_when_dead) {
		for (var i = 0; i < has_bronze_key; i ++) {
			// 0, (60 * facing), to be sure key are not popping in a wall
			var bronze_key = instance_create_layer(x + random_range(0, (60 * facing)), y + random_range(0, 60), "layer_items", obj_key);
			
			with (bronze_key) {
				value = "bronze";
			}
			has_bronze_key --;
		}
		
		for (var i = 0; i < has_silver_key; i ++) {
			var silver_key = instance_create_layer(x + random_range(0, (60 * facing)), y + random_range(0, 60), "layer_items", obj_key);
			
			with (silver_key) {
				value = "silver";
			}
			has_silver_key --;
		}
		
		for (var i = 0; i < has_gold_key; i ++) {
			var gold_key = instance_create_layer(x + random_range(0, (60 * facing)), y + random_range(0, 60), "layer_items", obj_key);
			
			with (gold_key) {
				value = "gold";
			}
			has_gold_key --;
		}
	}
	
	if (sprite_index != asset_get_index("spr_" + character + "_die_strip6")) {
		sprite_index = asset_get_index("spr_" + character + "_die_strip6");
		image_index = 0;
		image_speed = 1;
		audio_play_sound(choose(snd_death_male1, snd_death_male2, snd_death_male3), 7, false);
		
		alarm[2] = 256; // rebirth 8 seconds later
	}

}