// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function StealItem(argument0, argument1){
	//with (argument0) {
		if (has_bronze_key or has_silver_key or has_gold_key or equipments_number > 0) {
			show_debug_message("je te pique un truc !");
			var chance = choose(0, 1);
			if (chance == 1) {// steals something !
				if (has_bronze_key or has_silver_key or has_gold_key and equipments_number > 0) {
					var chance2 = choose(0, 1);
				
					if (chance2 == 0) {// steals key !
						if (has_bronze_key and !has_silver_key and !has_gold_key) {
							has_bronze_key --;
							if(argument1.id == attack_id_receiver) {
								argument1.has_bronze_key ++;
							}
							//other.has_bronze_key ++;
						} else if (!has_bronze_key and has_silver_key and !has_gold_key) {
							has_silver_key --;
							if(argument1.id == attack_id_receiver) {
								argument1.has_silver_key ++;
							}
							//other.has_silver_key ++;
						} else if (!has_bronze_key and !has_silver_key and has_gold_key) {
							has_gold_key --;
							if(argument1.id == attack_id_receiver) {
								argument1.has_gold_key ++;
							}
							//other.has_gold_key ++;
						}
					} else {//steals item !
					
					}
				}
			}
		} else {
			show_debug_message("ah zut, t'avais rien...")
		}
	//}
}