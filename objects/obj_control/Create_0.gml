/// @description Gamepads detection
randomize();

window_set_fullscreen(true);
for (var i = 0; i < 12; i++;) {
	player[i] = noone;
}

//draw gamepads informations
draw_set_colour(c_black);

total_pads = 0;// number of plugged gamepads
start_players = 0;// number of players who pushed Start
ready_players = 0;// number of players who selected their character

halls_list = ds_list_create();
ds_list_add(halls_list, obj_hall_A);
ds_list_add(halls_list, obj_hall_B);
ds_list_add(halls_list, obj_hall_C);

ds_list_delete(halls_list, 2);

halls_list_size = ds_list_size(halls_list);

