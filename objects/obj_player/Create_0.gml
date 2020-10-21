/// @description Global variables

isActive = false;// will turn to true when pushing Start button

key_left = 0;
key_right = 0;
key_up = 0;
key_down = 0;
key_jump = 0;
key_attack = 0;
key_start = 0;


hsp = 0; // horizontal speed
vsp = 0; // vertical speed
grv = .4; // gravity
walksp = 4; // walk speed

state = PLAYERSTATE.FREE;

facing = 1;// tells which side character is facing (1 = right, -1 = left)

flash = 0;

image_index = 0;

//Gamepad number (starting with 0)
pad_num = 0;

// The class of the selected character
character = "No class";
gamepad_id_owner = 0;// gamepad id recovered from obj_control


//enum : global variable you never want to change
enum PLAYERSTATE {
	FREE,
	HURT,
	ATTACK_SLASH,
}

// prevails from pushing serveral times on start button
// and distort the ready players number
can_push_start = true;
can_attack = true;

hitfrom = undefined // direction of the incoming attack

// used to "throw" the hit player
hurt_hsp = 4;
hurt_vsp = -5;
hurt_grv = .4;
hurt_done = 0;

