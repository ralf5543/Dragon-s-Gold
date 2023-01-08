// Script assets have changed for v2.3.0 see

function Drink_Potion(argument){
	switch (argument) {
		case "potion_health" : 
		has_health_potion --;
		is_drinking_health_potion = true;
		break;
		
		case "potion_energy" : 
		has_energy_potion --;
		is_drinking_energy_potion = true;
		break;
		
		case "potion_invincibility" : 
		has_invincibility_potion --;
		is_drinking_invincibility_potion = true;
		break;
		
		case "potion_poison" : 
		has_poison_potion --;
		break;
	}
}