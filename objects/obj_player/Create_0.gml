/// @description Global variables

key_left = 0;
key_right = 0;
key_up = 0;
key_down = 0;
key_jump = 0;
key_start = 0;


hsp = 0; // horizontal speed
vsp = 0; // vertical speed
grv = .4; // gravity
walksp = 4; // walk speed

controller = 0;// as "false" -> so keyboard

hasControl = true;// ?

image_index = 0;
image_speed = 0;

//Gamepad number (starting with 0)
pad_num = 0;

// The class of the selected character
character = "No class";
gamepad_id_owner = 0;// gamepad id recovered from obj_control