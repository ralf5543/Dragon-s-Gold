/// @description Gamepads detection
randomize();

global.surface_width = surface_get_width(application_surface);
global.surface_height = surface_get_height(application_surface);

global.game_state = undefined;//to restart game when over
can_end_game = true;

global.fnt_14 = fnt_14;

window_set_fullscreen(true);


//draw gamepads informations
draw_set_colour(c_black);

start_players = 0;// number of players who pushed Start
ready_players = 0;// number of players who selected their character

knight_ready_players = 0;// number of knights (to manage skins)
ranger_ready_players = 0;// number of rangers
wizard_ready_players = 0;// number of wizards
thief_ready_players = 0;// number of thieves

door_calculate = true //calculates door numbers only once
