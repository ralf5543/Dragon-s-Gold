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

//list of all castle rooms objets, used or not
halls_list = ds_list_create();
ds_list_add(halls_list, obj_hall_A);
ds_list_add(halls_list, obj_hall_B);
ds_list_add(halls_list, obj_hall_C);

//shuffle the list and remove (actually) the last of them
ds_list_shuffle(halls_list);
ds_list_delete(halls_list, 2);

//get the numver of halls used
halls_list_size = ds_list_size(halls_list);

global.surface_width = surface_get_width(application_surface);
global.surface_height = surface_get_height(application_surface);