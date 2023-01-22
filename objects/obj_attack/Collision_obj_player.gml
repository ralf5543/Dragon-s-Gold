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
				// ======================------------------------- THIEF ONLY -------------------------======================
				
				//show_debug_message("tentative de vol")
				//StealItem(other, obj_player);
				
				if (can_steal) {
					
					function StealBronzeKey() {
						show_debug_message("Vol clé de bronze !");
						other.has_bronze_key --;

						with (obj_player) {
			
							if (gamepad_id_owner == other.attack_id_receiver) {
								has_bronze_key ++;
							}
						}
										
					}
					
					function StealSilverKey() {
						show_debug_message("Vol clé d'argent !");
						other.has_silver_key --;

						with (obj_player) {
			
							if (gamepad_id_owner == other.attack_id_receiver) {
								has_silver_key ++;
							}
						}
										
					}
					
					function StealGoldKey() {
						show_debug_message("Vol clé en or !");
						other.has_gold_key --;

						with (obj_player) {
			
							if (gamepad_id_owner == other.attack_id_receiver) {
								has_gold_key ++;
							}
						}
										
					}
					
					function StealItems() {
						function addPotionsToThiefInventory(argument) {
							with (obj_player) {
								if (equipments_number < array_length(EquipmentSlot)) and (gamepad_id_owner == other.attack_id_receiver) {
									if (argument == "potion_health") {
										if (EquipmentSlot[0] == undefined) {
											EquipmentSlot[0] = "potion_health";
										} else if (EquipmentSlot[1] == undefined) {
											EquipmentSlot[1] = "potion_health";
										} else if (EquipmentSlot[2] == undefined) {
											EquipmentSlot[2] = "potion_health";
										} else {
											EquipmentSlot[3] = "potion_health";
										}
									} else if (argument == "potion_energy") {
										if (EquipmentSlot[0] == undefined) {
											EquipmentSlot[0] = "potion_energy";
										} else if (EquipmentSlot[1] == undefined) {
											EquipmentSlot[1] = "potion_energy";
										} else if (EquipmentSlot[2] == undefined) {
											EquipmentSlot[2] = "potion_energy";
										} else {
											EquipmentSlot[3] = "potion_energy";
										}
														
									} else if (argument == "potion_invincibility") {
										if (EquipmentSlot[0] == undefined) {
											EquipmentSlot[0] = "potion_invincibility";
										} else if (EquipmentSlot[1] == undefined) {
											EquipmentSlot[1] = "potion_invincibility";
										} else if (EquipmentSlot[2] == undefined) {
											EquipmentSlot[2] = "potion_invincibility";
										} else {
											EquipmentSlot[3] = "potion_invincibility";
										}
														
									}
									equipments_number ++;
								}
								show_debug_message("Me voilà en possession de ta potion de" + string(argument));
							}
						}
							
							
						var chanceItems = choose(0, 1, 2, 3);
								
						switch (chanceItems) {					
						
							case 0 :
								if (other.EquipmentSlot[0] != undefined) {
									show_debug_message("haha, je t'ai viré ton objet 1 : " + string(other.EquipmentSlot[0]));
											
									addPotionsToThiefInventory(other.EquipmentSlot[0]);	
											
									other.EquipmentSlot[0] = undefined;
									other.equipments_number -- ;
											
								} else {
									StealItems();
								}
								break;  																
						
							case 1 :
								if (other.EquipmentSlot[1] != undefined) {
									show_debug_message("haha, je t'ai viré ton objet 1 : " + string(other.EquipmentSlot[1]));
											
									addPotionsToThiefInventory(other.EquipmentSlot[1]);	
											
									other.EquipmentSlot[1] = undefined;
									other.equipments_number -- ;
	
								} else {
									StealItems();
								}
								break;  
							
						
							case 2 :
								if (other.EquipmentSlot[2] != undefined) {
									show_debug_message("haha, je t'ai viré ton objet 2 : " + string(other.EquipmentSlot[2]));
											
									addPotionsToThiefInventory(other.EquipmentSlot[2]);
											
									other.EquipmentSlot[2] = undefined;
									other.equipments_number -- ;
								} else {
									StealItems();
								}
								break;  
																	
						
							case 3 :
								if (other.EquipmentSlot[3] != undefined) {
									show_debug_message("haha, je t'ai viré ton objet 3 : " + string(other.EquipmentSlot[3]));
											
									addPotionsToThiefInventory(other.EquipmentSlot[3]);
											
									other.EquipmentSlot[3] = undefined;
									other.equipments_number -- ;
								} else {
									StealItems();
								}
								break;  									
						}

					}
					
					function StealKeys() {
								
						if (other.has_bronze_key and !other.has_silver_key and !other.has_gold_key) {
						StealBronzeKey();
										
						// has silver key(s) only
						} else if (!other.has_bronze_key and other.has_silver_key and !other.has_gold_key) {
							StealSilverKey();

						// has gold key(s) only
						} else if (!other.has_bronze_key and !other.has_silver_key and other.has_gold_key) {
							StealGoldKey();


						// has bronze and silver key(s)
						} else if (other.has_bronze_key and other.has_silver_key and !other.has_gold_key) {
										
							var chanceBS = choose(0, 1);
										
							if (chanceBS == 0) {
								StealBronzeKey();
							} else {
								StealSilverKey();
							}


						// has bronze and gold key(s)
						} else if (other.has_bronze_key and !other.has_silver_key and other.has_gold_key) {
										
							var chanceBG = choose(0, 1);
										
							if (chanceBG == 0) {
								StealBronzeKey();
							} else {
								StealGoldKey();
							}

						// has silver and gold key(s)
						} else if (!other.has_bronze_key and other.has_silver_key and other.has_gold_key) {
										
							var chanceSG = choose(0, 1);
										
							if (chanceSG == 0) {
								StealSilverKey();
							} else {
								StealGoldKey();
							}										
							
							
						// has all types of key(s)
						} else if (other.has_bronze_key and other.has_silver_key and other.has_gold_key) {
										
							var chanceBSG = choose(0, 1, 2);
										
							if (chanceBSG == 0) {
								StealBronzeKey();
							} else if (chanceBSG == 1) {
								StealSilverKey();
							} else {
								StealGoldKey();
							}
										
						}
								
					}
					
					can_steal = false;
					
					show_debug_message("other.has_bronze_key" + string(other.has_bronze_key));
					show_debug_message("other.has_silver_key" + string(other.has_silver_key));
					show_debug_message("other.has_gold_key" + string(other.has_gold_key));
					show_debug_message("other.equipments_number" + string(other.equipments_number));
				
					if (other.has_bronze_key or other.has_silver_key or other.has_gold_key or other.equipments_number > 0) {
						show_debug_message("T'as des trucs à voler !");
						//var chance = choose(0, 1);
						var chance = choose(1); // Actually 100% chances to steal
						show_debug_message("chance : " + string(chance));
						
						if (chance == 1) {// steals something !							
							
							audio_play_sound(snd_steal_success, 7, false);
							
							show_debug_message("Vol réussi !");
							
							
							if (other.has_bronze_key or other.has_silver_key or other.has_gold_key) and (other.equipments_number == 0) {
								show_debug_message("Tu n'as point de potion, mais tu as des clés !!!");
								StealKeys();
							} else if (!other.has_bronze_key and !other.has_silver_key and !other.has_gold_key) and (other.equipments_number > 0) {
								show_debug_message("Tu n'as point de clés, mais tu as des items !!!");
								StealItems();
							} else {
								show_debug_message("Tu as des clés ET des items !!!");
								var chanceKeysOrItems = choose(0, 1);
								if (chanceKeysOrItems == 0) {
									StealKeys();
								} else {
									StealItems();
								}
							}

						}
					} else {
						show_debug_message("ah zut, t'avais rien...")
					}
					
				} else {
					show_debug_message("Vol raté...");
				}
					
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



