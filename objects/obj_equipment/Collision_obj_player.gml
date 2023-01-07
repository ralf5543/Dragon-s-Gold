/// @description Insert description here
// You can write your code in this editor

with (other) {

	if (state != PLAYERSTATE.HURT) && (state != PLAYERSTATE.DEAD) {
		if (key_action) {
		
			//if enough place in inventory
			if (equipments_number < array_length(EquipmentSlot)) {
		
				audio_play_sound(snd_key_grab, 9, 0);

					show_debug_message("other.type : " + string(other.type));
				switch (other.type) {
					case EQUIPMENT_TYPE.POTION : 
					
					show_debug_message("other.potion_type : " + string(other.potion_type));
					
					
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
						EquipmentSlot[0] = other.potion_type;
					} else {
						EquipmentSlot[0] = other.type;
					}
					
					show_debug_message("EquipmentSlot[0] : " + string(EquipmentSlot[0]));
					
					
				} else if (EquipmentSlot[1] == undefined) {
					if (other.type == EQUIPMENT_TYPE.POTION) {
						EquipmentSlot[1] = other.potion_type;
					} else {
						EquipmentSlot[1] = other.type;
					}
					
					show_debug_message("EquipmentSlot[1] : " + string(EquipmentSlot[1]));
					
				} else if (EquipmentSlot[2] == undefined) {
					if (other.type == EQUIPMENT_TYPE.POTION) {
						EquipmentSlot[2] = other.potion_type;
					} else {
						EquipmentSlot[2] = other.type;
					}
					
					show_debug_message("EquipmentSlot[2] : " + string(EquipmentSlot[2]));
					
				} else if (EquipmentSlot[3] == undefined) {
					if (other.type == EQUIPMENT_TYPE.POTION) {
						EquipmentSlot[3] = other.potion_type;
					} else {
						EquipmentSlot[3] = other.type;
					}
					
					show_debug_message("EquipmentSlot[3] : " + string(EquipmentSlot[3]));
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




















