/// @description Global variables

isActive = false;// will turn to true when pushing Start button

key_left = 0;
key_right = 0;
key_up = 0;
key_down = 0;
key_run = 0;
key_jump = 0;
key_attack = 0;
key_special = 0;
key_special_released = 0;
key_start = 0;
key_action = 0;


hsp = 0; // horizontal speed
vsp = 0; // vertical speed
grv = .4; // gravity
walksp = 4; // walk speed

hp_max = 50;
hp = hp_max;// Life points

energy_max = 250;// Energy points (used to run)
energy = energy_max;

sexe = undefined;

image_speed = 1;

state = PLAYERSTATE.FREE;

//enum : global variables you never want to change
enum PLAYERSTATE {
	FREE,
	HURT,
	DEAD,
	ATTACK,
	COMBO1,
	COMBO2,
	SPECIAL,
	WON,
	LOSE,
	CROSSINGDDOOR,
	TAKINGSTAIRS,
	DRINKINGPOTION
}

// because with combos, "state" get a number, not a FREEPLAYERSTATE. Dunno why...
is_hurt = false;

facing = 1;// tells which side character is facing (1 = right, -1 = left)
player_orientation = 0;// used by attacks direction

is_sliding = false;
retarder = 0;//to slow down the slide

flash = 0;

image_index = 0;

//Gamepad number (starting with 0)
pad_num = 0;

// The class of the selected character
character = "No class";
gamepad_id_owner = 0;// gamepad id recovered from obj_control

// prevails from pushing serveral times on start button
// and distort the ready players number
can_push_start = true;
can_attack = true;

can_combo1 = true;
has_touched_ennemy1 = false;
can_combo2 = true;
has_touched_ennemy2 = false;

can_footStep = true;
can_landingSound = true;
can_hurtSound = true;
can_play_victory = true;
can_lose_key = true;
can_lose_key_when_dead = true;
can_slide = true;

hitfrom = undefined // direction of the incoming attack

// used to "throw" the hit player
hurt_hsp = 4;
hurt_vsp = -5;
hurt_grv = .4;
hurt_done = 0;

//======------- Keys collect
has_gold_key = 0;
has_silver_key = 0;
has_bronze_key = 0;
key_win_bronze = false;
key_win_silver = false;
key_win_gold = false;

is_invicible = false;
invincible_timer = 0;
blink_timer = 0;

//======------- Equipment
EquipmentSlot[3] = undefined;
EquipmentSlot[2] = undefined;
EquipmentSlot[1] = undefined;
EquipmentSlot[0] = undefined;

equipments_number = 0;

//======------- Potions collect
has_health_potion = 0;
has_energy_potion = 0;
has_invincibility_potion = 0;
has_poison_potion = 0;
is_drinking_health_potion = false;
is_drinking_energy_potion = false;
is_drinking_invincibility_potion = false;
can_drink = true;// drink sound

// ===================---------------- GUI
player_split_x = 0;//linked to the split screen position
player_split_y = 0;
gui_zoom = 0;
gui_margin = 0;
healthbar_x = 0;
healthbar_y = 0;
healthbar_width = 0;
healthbar_height = 0;
energybar_width = 0;
energybar_height = 0;
energybar_x = 0;
energybar_y = 0;		
key_x = 0;
key_y = 0;
key_spacer = 0;
dpad_width = 0;


// ===================---------------- RANGER
focus_bow = 0;

// ===================---------------- WIZARD
focus_fireball = 0;
can_sound_cast = true;
can_cast = true;

// ===================---------------- DOORS MANAGEMENT
can_cross_doors = true;
is_crossing_door = false;
countdown_door = 64;

// ===================---------------- STAIRS MANAGEMENT
w = display_get_gui_width();
h = display_get_gui_height();
//h = global.surface_height;
h_half = h / 2;
percent = 1; // 0 = no black screen, 1 = 100% black screen
can_take_stairs = true;
free_stick = 1;//to avoid taking stairs multiple times with analogic stick
is_taking_stairs = false;
has_taken_stairs = 0;
stairs_direction = undefined;
has_finished_stairs = false;

