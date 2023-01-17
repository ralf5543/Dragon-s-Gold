// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function StealItem(argument){
	with (argument)
	if (has_bronze_key or has_silver_key or has_gold_key or equipments_number > 0) {
		show_debug_message("je te pique un truc !")
	} else {
		show_debug_message("ah zut, t'avais rien...")
	}
}