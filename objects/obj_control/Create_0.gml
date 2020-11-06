/// @description Gamepads detection
randomize();

global.surface_width = surface_get_width(application_surface);
global.surface_height = surface_get_height(application_surface);

global.game_state = undefined;//to restart game when over
can_end_game = true;

global.fnt_14 = fnt_14;

window_set_fullscreen(true);

for (var i = 0; i < 12; i++;) {
	player[i] = noone;
}

//draw gamepads informations
draw_set_colour(c_black);

total_pads = 0;// number of plugged gamepads
start_players = 0;// number of players who pushed Start
ready_players = 0;// number of players who selected their character

door_calculate = true //calculates door numbers only once