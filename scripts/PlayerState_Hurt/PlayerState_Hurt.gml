
function PlayerState_Hurt(){

	can_attack = false;
	
	if (sprite_index != asset_get_index("spr_" + character + "_hurt_strip2")) {
		sprite_index = asset_get_index("spr_" + character + "_hurt_strip2");
		image_index = 1;
		image_speed = 0;
	}
	
	if (hurt_done == 0) {
		if (can_hurtSound) {
			audio_play_sound(choose(snd_hurt_male1, snd_hurt_male2, snd_hurt_male3), 8, false);
			can_hurtSound = false;
			alarm[1] = 32;
		}
		
		hurt_vsp += hurt_grv; //contuously accelerates bottom move


		//=======---------- horizontal collisions
		// detects a collision at (x + hsp) distance
		if (place_meeting(x + (hurt_hsp * hitfrom), y, obj_wall)) {

			//while detects NO collision at 1px (sign(hsp), so 1 and -1) x distance
			while (!place_meeting(x + sign(hurt_hsp * hitfrom), y, obj_wall)) {
				//move from the "rest" to be the closest as possible from collision
			    x += sign(hurt_hsp * hitfrom);
			}
			hurt_hsp = 0;
		}

		x += hurt_hsp * hitfrom;// the player will be thrown to the left or the right

		//=======---------- vertical collisions
		// detects a collision at (y + vsp) distance
		if (place_meeting(x, y + hurt_vsp, obj_wall)) {
			if (hurt_vsp > 1) {// just to stop the condition, and save perfs
				hurt_done = 1;				
			
			};
		
			//while detects NO collision at 1px (sign(vsp), so 1 and -1) y distance
			 while (!place_meeting(x, y + sign(hurt_vsp), obj_wall)) {
				//move from the "rest" to be the closest as possible from collision
			    y += sign(hurt_vsp);
			}
			hurt_vsp = 0;
			
			if (hp > 0) {
				state = PLAYERSTATE.FREE;
			} else {
				state = PLAYERSTATE.DEAD;
			}
		}

		y += hurt_vsp;	
		
		
		//======================-------------------------- itemps drop
		
		
		if (can_lose_key) {
		
		//if has at least ONE key
			if (has_bronze_key + has_silver_key + has_gold_key > 0) {
			
				var chance = choose(0, 1, 2);
				
				// 1 chance for 3 to lose a key
				if (chance > 1) {
			
					var random_value = choose("bronze", "silver", "gold");
					switch (random_value) {
						
					    case "bronze":
					       if (has_bronze_key > 0) {
							   has_bronze_key --;
							   key_win_bronze = false;
							   
							   var bronze_key = instance_create_layer(x, y + random_range(0, 60), "layer_items", obj_key);
								with (bronze_key) {
									value = "bronze";
								}
						   } else {
							   var random_value_nobronze = choose("silver", "gold");
							   if (random_value_nobronze == "silver") {
								  if (has_silver_key > 0) {
									  has_silver_key --;
									  key_win_silver = false;
									  
									  var silver_key = instance_create_layer(x, y + random_range(0, 60), "layer_items", obj_key);
										with (silver_key) {
											value = "silver";
										}
								  } else {
									  has_gold_key --;
									  key_win_gold = false;
									  
									  var gold_key = instance_create_layer(x, y + random_range(0, 60), "layer_items", obj_key);
										with (gold_key) {
											value = "gold";
										}
								  }
							   }
						   }
					    break;
						
					    case "silver":
					       if (has_silver_key > 0) {
							   has_silver_key --;
							   key_win_silver = false;
							   
							    var silver_key = instance_create_layer(x, y + random_range(0, 60), "layer_items", obj_key);
								with (silver_key) {
									value = "silver";
								}
						   } else {
							   var random_value_nosilver = choose("bronze", "gold");
							   if (random_value_nosilver == "bronze") {
								  if (has_bronze_key > 0) {
									  has_bronze_key --;
									  key_win_bronze = false;
									  
									var bronze_key = instance_create_layer(x, y + random_range(0, 60), "layer_items", obj_key);
									with (bronze_key) {
										value = "bronze";
									}
								  } else {
									  has_gold_key --;
									  key_win_gold = false;
									  
									  var gold_key = instance_create_layer(x, y + random_range(0, 60), "layer_items", obj_key);
										with (gold_key) {
											value = "gold";
										}
								  }
							   }
						   }
					    break;
						
					    case "gold":
					       if (has_gold_key > 0) {
							   has_gold_key --;
							   key_win_gold = false;
							   
							    var gold_key = instance_create_layer(x, y + random_range(0, 60), "layer_items", obj_key);
								with (gold_key) {
									value = "gold";
								}
						   } else {
							   var random_value_nogold = choose("bronze", "silver");
							   if (random_value_nogold == "bronze") {
								  if (has_bronze_key > 0) {
									has_bronze_key --;
									key_win_bronze = false;
									  
									var bronze_key = instance_create_layer(x, y + random_range(0, 60), "layer_items", obj_key);
									with (bronze_key) {
										value = "bronze";
									}
								  } else {
									  has_silver_key --;
									  key_win_silver = false;
									  
									var silver_key = instance_create_layer(x, y + random_range(0, 60), "layer_items", obj_key);
									with (silver_key) {
										value = "silver";
									}
								  }
							   }
						   }
					    break;
					}
				}
				can_lose_key = false;
			}
		}
	}

}