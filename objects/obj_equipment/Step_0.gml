/// @description Insert description here
// You can write your code in this editor

// floating bottle
y = ystart + sin(get_timer() / 500000) * 5;
//sin : get a result between 1 and -1 (oscillate each time, like a curve)


//switch (type) {
//	case EQUIPMENT_TYPE.POTION_HEALTH : 
//	sprite_index = spr_potion;
//	image_index = 0;
//	break;	
	
//	case EQUIPMENT_TYPE.POTION_ENERGY : 
//	sprite_index = spr_potion;
//	image_index = 1;
//	break;		
	
//	case EQUIPMENT_TYPE.POTION_POISON : 
//	sprite_index = spr_potion;
//	image_index = 2;
//	break;	
//}



switch (type) {
	case EQUIPMENT_TYPE.POTION : 
	sprite_index = spr_potion;
	break;
}

if (type == EQUIPMENT_TYPE.POTION) {
	switch (potion_type) {
		case POTION_TYPE.HEALTH : 
		image_index = 0;
		break;
		
		case POTION_TYPE.ENERGY : 
		image_index = 1;
		break;
		
		case POTION_TYPE.INVINCIBILITY : 
		image_index = 2;
		break;
		
		case POTION_TYPE.POISON : 
		image_index = 3;
		break;
	}
}



















