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

//=================---------- PAUSE
paused = false;
paused_surf = -1;

//=================---------- MENU
gui_width = global.surface_width;
gui_height = global.surface_height;
gui_margin = 32;

menu_x = gui_width + 400;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 15; // lower is faster
menu_font = fnt_menu;
menu_itemheight = font_get_size(menu_font);
menu_comitted = -1;
menu_control = true;

//menu[3] = undefined;
menu[2] = undefined;
menu[1] = undefined;
menu[0] = undefined;

menu_items = array_length_1d(menu);

menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);

menu_cursor = 2;

free_stick = true;
