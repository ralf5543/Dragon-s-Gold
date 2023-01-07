// Script assets have changed for v2.3.0 see

function Drink_Potion(argument){
	switch (argument) {
		case POTION_TYPE.HEALTH : 
		has_health_potion --;
		break;
		case POTION_TYPE.ENERGY : 
		has_energy_potion --;
		break;
		case POTION_TYPE.INVINCIBILITY : 
		has_invincibility_potion --;
		break;
		case POTION_TYPE.POISON : 
		has_poison_potion --;
		break;
	}
}