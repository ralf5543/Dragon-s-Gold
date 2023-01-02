/// @description Insert description here
// You can write your code in this editor

with (other) {

	if (state != PLAYERSTATE.HURT) && (state != PLAYERSTATE.DEAD) {
		if (key_action) {
		
			//if enough place in inventory
			if (equipments_number < array_length(EquipmentSlot)) {
		
				audio_play_sound(snd_key_grab, 9, 0);

				switch (other.type) {
					case EQUIPMENT_TYPE.POTION_HEALTH : 
					has_health_potion ++;
					break;	
	
					case EQUIPMENT_TYPE.POTION_ENERGY : 
					has_energy_potion ++;
					break;	
	
					case EQUIPMENT_TYPE.POTION_POISON : 
					has_poison_potion ++;
					break;	
				}
	
				if (EquipmentSlot[0] == undefined) {
					EquipmentSlot[0] = other.type;
				} else if (EquipmentSlot[1] == undefined) {
					EquipmentSlot[1] = other.type;
				} else if (EquipmentSlot[2] == undefined) {
					EquipmentSlot[2] = other.type;
				} else if (EquipmentSlot[3] == undefined) {
					EquipmentSlot[3] = other.type;
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




















