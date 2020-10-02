/// @description Gamepads detection


for (var i = 0; i < 12; i++;) {
	player[i] = noone;
}

//draw gamepads informations
draw_set_colour(c_black);

total_pads = 0;// number of plugged gamepads
ready_players = 0;// number of players who selected their character