/// @description Insert description here
// You can write your code in this editor

with (other) {

	if (state != PLAYERSTATE.HURT) && (state != PLAYERSTATE.DEAD) {
		if (key_action) {
		
			//if enough place in inventory
			if (equipments_number < array_length(EquipmentSlot)) {
		
				audio_play_sound(snd_key_grab, 9, 0);

				switch (other.type) {
					case EQUIPMENT_TYPE.POTION : 
					
					switch(other.potion_type) {
					
						case POTION_TYPE.HEALTH : 
						has_health_potion ++;
						break;	
	
						case POTION_TYPE.ENERGY : 
						has_energy_potion ++;
						break;	
	
						case POTION_TYPE.INVINCIBILITY : 
						has_invincibility_potion ++;
						break;	
	
						case POTION_TYPE.POISON : 
						has_poison_potion ++;
						break;	
					}
					
					break;
				}
	
				if (EquipmentSlot[0] == undefined) {
					
					if (other.type == EQUIPMENT_TYPE.POTION) {
						
						switch(other.potion_type) {
					
							case 0 : 
							has_health_potion ++;
							EquipmentSlot[0] = "potion_health";
							break;	
	
							case 1 : 
							has_energy_potion ++;
							EquipmentSlot[0] = "potion_energy";
							break;	
	
							//case POTION_TYPE.INVINCIBILITY : 
							case 2 : 
							has_invincibility_potion ++;
							EquipmentSlot[0] = "potion_invincibility";
							break;	
	
							//case POTION_TYPE.POISON : 
							case 3 : 
							has_poison_potion ++;
							EquipmentSlot[0] = "potion_poison";
							break;	
						}
						
						
						
					} else {
						EquipmentSlot[0] = other.type;
					}
					
					
				} else if (EquipmentSlot[1] == undefined) {
					if (other.type == EQUIPMENT_TYPE.POTION) {
						
						
						switch(other.potion_type) {
					
							case 0 : 
							has_health_potion ++;
							EquipmentSlot[1] = "potion_health";
							break;	
	
							case 1 : 
							has_energy_potion ++;
							EquipmentSlot[1] = "potion_energy";
							break;	
	
							//case POTION_TYPE.INVINCIBILITY : 
							case 2 : 
							has_invincibility_potion ++;
							EquipmentSlot[1] = "potion_invincibility";
							break;	
	
							//case POTION_TYPE.POISON : 
							case 3 : 
							has_poison_potion ++;
							EquipmentSlot[1] = "potion_poison";
							break;	
						}
						
					} else {
						EquipmentSlot[1] = other.type;
					}
					
					show_debug_message("EquipmentSlot[1] : " + string(EquipmentSlot[1]));
					
				} else if (EquipmentSlot[2] == undefined) {
					if (other.type == EQUIPMENT_TYPE.POTION) {
						
						switch(other.potion_type) {
					
							case POTION_TYPE.HEALTH : 
							//case 0 : 
							has_health_potion ++;
							EquipmentSlot[2] = "potion_health";
							break;	
	
							case POTION_TYPE.ENERGY : 
							//case 1 : 
							has_energy_potion ++;
							EquipmentSlot[2] = "potion_energy";
							break;	
	
							case POTION_TYPE.INVINCIBILITY : 
							//case 2 : 
							has_invincibility_potion ++;
							EquipmentSlot[2] = "potion_invincibility";
							break;	
	
							case POTION_TYPE.POISON : 
							//case 3 : 
							has_poison_potion ++;
							EquipmentSlot[2] = "potion_poison";
							break;	
						}
						
					} else {
						EquipmentSlot[2] = other.type;
					}
					
				} else if (EquipmentSlot[3] == undefined) {
					if (other.type == EQUIPMENT_TYPE.POTION) {
						
						switch(other.potion_type) {
					
							//case POTION_TYPE.HEALTH : 
							case 0 : 
							has_health_potion ++;
							EquipmentSlot[3] = "potion_health";
							break;	
	
							//case POTION_TYPE.ENERGY : 
							case 1 : 
							has_energy_potion ++;
							EquipmentSlot[3] = "potion_energy";
							break;	
	
							//case POTION_TYPE.INVINCIBILITY : 
							case 2 : 
							has_invincibility_potion ++;
							EquipmentSlot[3] = "potion_invincibility";
							break;	
	
							//case POTION_TYPE.POISON : 
							case 3 : 
							has_poison_potion ++;
							EquipmentSlot[3] = "potion_poison";
							break;	
						}
						
					} else {
						EquipmentSlot[3] = other.type;
					}

				}
			
				equipments_number ++;

				instance_destroy(other);
			} else {
				text = "Plus de place \n dans l'inventaire !";

				if (!instance_exists(obj_text)) {
					var equipmentText = instance_create_layer(x, y - 96, "layer_control", obj_text);
					with (equipmentText) {
						text = other.text;
						length = string_length(text);
					}
				}
			}
		}
	}


}




















