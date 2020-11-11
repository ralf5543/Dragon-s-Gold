

function Random_Position(new_item){
	var choose_floor = choose("roof", "middle", "ground");
		
	switch (choose_floor) {
		case "roof":
		    var hall_nb = random(halls_roof_list_size);
			//random position in the hall
			new_item.x = random_range(ds_list_find_value(other.halls_roof_list, hall_nb).hall_x + 160, room_width - 96); 
			new_item.y = ds_list_find_value(other.halls_roof_list, hall_nb).hall_y + 48;
		    break;

			
		case "middle":
		    var hall_nb = random(halls_middle_list_size);
			new_item.x = random_range(ds_list_find_value(other.halls_middle_list, hall_nb).hall_x + 160, room_width - 96); 
			new_item.y = ds_list_find_value(other.halls_middle_list, hall_nb).hall_y + 48;
		    break
			
		case "ground":
		    var hall_nb = random(halls_ground_list_size);
			new_item.x = random_range(ds_list_find_value(other.halls_ground_list, hall_nb).hall_x + 160, room_width - 96); 
			new_item.y = ds_list_find_value(other.halls_ground_list, hall_nb).hall_y + 48;
		    break
	}
}