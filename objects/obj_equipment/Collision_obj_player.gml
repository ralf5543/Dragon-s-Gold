/// @description Insert description here
// You can write your code in this editor

if (other.state != PLAYERSTATE.HURT) && (other.state != PLAYERSTATE.DEAD) {
	
	audio_play_sound(snd_key_grab, 9, 0);

	switch (type) {
		case EQUIPMENT_TYPE.POTION_HEALTH : 
		other.has_health_potion ++;
		break;	
	
		case EQUIPMENT_TYPE.POTION_ENERGY : 
		other.has_energy_potion ++;
		break;	
	
		case EQUIPMENT_TYPE.POTION_POISON : 
		other.has_poison_potion ++;
		break;	
	}
	
	if (other.EquipmentSlot[0] == undefined) {
		other.EquipmentSlot[0] = type;
	} else if (other.EquipmentSlot[1] == undefined) {
		other.EquipmentSlot[1] = type;
	} else if (other.EquipmentSlot[2] == undefined) {
		other.EquipmentSlot[2] = type;
	} else if (other.EquipmentSlot[3] == undefined) {
		other.EquipmentSlot[3] = type;
	}

	instance_destroy();

}























