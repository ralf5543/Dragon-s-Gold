if (!place_meeting(x, y, obj_shield) ) {
	//if the attack is not meeting a shield (even if touching a player's collision box)
	
	
	if (other.id != attack_id_receiver) {
		
		// "is_hurt" var, because "state" get a number, not a FREEPLAYERSTATE. Dunno why...
		if (other.is_invicible == false) && (other.is_hurt == false) && (other.state != PLAYERSTATE.HURT) && (other.state != PLAYERSTATE.DEAD) {
		
			if (attack_id_receiver.character != "thief") {
				if ((x - other.x) > 0) {
					other.hitfrom = -1;// attack from the right
				} else {
					other.hitfrom = 1;//attack from the left
				}

				other.facing = -other.hitfrom;//(faces the origin of the attack)
				other.flash = 10;
					
				audio_play_sound(snd_smash, 7, false);
		
				other.state = PLAYERSTATE.HURT;
				other.hp -= 10;
			
				AddBlood();
			} else {
				//show_debug_message("tentative de vol")
				//StealItem(other, obj_player);
				
				if (can_steal) {
					
					can_steal = false;
				
					if (other.has_bronze_key or other.has_silver_key or other.has_gold_key or other.equipments_number > 0) {
						show_debug_message("T'as des trucs à voler !");
						var chance = choose(0, 1);
							show_debug_message("chance : " + string(chance));
						if (chance == 1) {// steals something !							
							
							audio_play_sound(snd_steal_success, 7, false);
							
							show_debug_message("Vol réussi !");
							//if (other.has_bronze_key or other.has_silver_key or other.has_gold_key and other.equipments_number > 0) {
								//var chance2 = choose(0, 1);
				
								//if (chance2 == 0) {// steals key !
									//show_debug_message("Vol réussi !");
									if (other.has_bronze_key and !other.has_silver_key and !other.has_gold_key) {
										show_debug_message("Vol clé de bronze!");
										other.has_bronze_key --;
										//with(other.id == attack_id_receiver) {
										//	other.has_bronze_key ++;
										//}
										with (obj_player) {
			
											if (gamepad_id_owner == other.attack_id_receiver) {
												has_bronze_key ++;
											}
										}
										//other.has_bronze_key ++;
									} else if (!other.has_bronze_key and other.has_silver_key and !other.has_gold_key) {
										show_debug_message("Vol clé d'argent!");
										other.has_silver_key --;
										//with(other.id == attack_id_receiver) {
										//	other.has_silver_key ++;
										//}
										with (obj_player) {
			
											if (gamepad_id_owner == other.attack_id_receiver) {
												has_silver_key ++;
											}
										}
										//other.has_silver_key ++;
									} else if (!other.has_bronze_key and !other.has_silver_key and other.has_gold_key) {
										show_debug_message("Vol clé en or!");
										other.has_gold_key --;
										//with(other.id == attack_id_receiver) {
										//	other.has_gold_key ++;
										//}
										with (obj_player) {
			
											if (gamepad_id_owner == other.attack_id_receiver) {
												has_gold_key ++;
											}
										}
										//other.has_gold_key ++;
									}
								}
							}
						else {
						show_debug_message("Vol raté...");
						}
					
				}
					
				//} else {
				//	show_debug_message("ah zut, t'avais rien...")
				//}
				
				
				

				
				
			}
		}

//======================================------------------ COMBO LAUNCHING
		with (obj_player) {
			
			if (gamepad_id_owner == other.attack_id_receiver) {
				
				if (skeleton_animation_get() == "attack") {
					has_touched_ennemy1 = true;
				}
				
				
				if (skeleton_animation_get() == "combo1") {
					has_touched_ennemy2 = true;	
				}	
			}
		}
	}		
}



