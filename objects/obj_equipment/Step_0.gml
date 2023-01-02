/// @description Insert description here
// You can write your code in this editor

// floating bottle
y = ystart + sin(get_timer() / 500000) * 5;
//sin : get a result between 1 and -1 (oscillate each time, like a curve)


switch (type) {
	case EQUIPMENT_TYPE.POTION_HEALTH : 
	sprite_index = spr_potion;
	image_index = 0;
	break;	
	
	case EQUIPMENT_TYPE.POTION_ENERGY : 
	sprite_index = spr_potion;
	image_index = 1;
	break;		
	
	case EQUIPMENT_TYPE.POTION_POISON : 
	sprite_index = spr_potion;
	image_index = 2;
	break;	
}





















