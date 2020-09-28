/// @description Insert description here

key_left = 0;
key_right = 0;
key_jump = 0;

if (hasControl) {


	// test horizontal axe for left stick for first slot controller, ignoring dead zone (0.2)
	// abs takes a number, and change it to positive equivalent ("-9" -> "9")
	if (abs(gamepad_axis_value(pad_num, gp_axislh)) > .2) {
	    key_left = abs(min(gamepad_axis_value(pad_num, gp_axislh), 0));
	    key_right = max(gamepad_axis_value(pad_num, gp_axislh), 0);
		//key_jump = gamepad_button_check(pad_num, gp_shoulderrb);
		
		controller = 1;
	}

	// same for vertical axe
	if (abs(gamepad_axis_value(pad_num, gp_axislv)) > .2) {
		controller = 1;
	}
	key_jump = gamepad_button_check(pad_num, gp_face1);
	
} else {
	key_left = 0;
	key_right = 0;
	key_jump = 0;
};


//=======---------- Calculate movements
var move = key_right - key_left; // because true = 1 and false = -1

hsp = move * walksp; // changes the direction from -4 (if walkspd = 4), to 4, on X axis.
vsp += grv; //contuously accelerates bottom move

// if detects a collision with wall 1px bellow it (so, if it's on the floor !)
//AND jump button is pressed
if (place_meeting(x, y + 1, obj_wall)) && (key_jump) {
	vsp = -10;
};



//=======---------- horizontal collisions
// detects a collision at (x + hsp) distance
if (place_meeting(x + hsp, y, obj_wall)) {
	//while detects NO collision at 1px (sign(hsp), so 1 and -1) x distance
	while (!place_meeting(x + sign(hsp), y, obj_wall)) {
		//move from the "rest" to be the closest as possible from collision
	    x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

//=======---------- vertical collisions
// detects a collision at (y + vsp) distance
if (place_meeting(x, y + vsp, obj_wall)) {
	//while detects NO collision at 1px (sign(vsp), so 1 and -1) y distance
	 while (!place_meeting(x, y + sign(vsp), obj_wall)) {
		//move from the "rest" to be the closest as possible from collision
	    y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

//=======---------- Animations
// if detects NO collision with wall 1px bellow it (so, if it's in the air !)
if (!place_meeting(x, y + 1, obj_wall)) {
	//sprite_index = spr_player_air_strip2;
	//stops the animation
	image_speed = 0;
	if (vsp > 0) {// or if (sign(vsp))
		//select the frame
	    image_index = 0;
	}
	else {
	    image_index = 1;
	}
} else {
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = spr_wizard_stand_strip2;
	} else {
		sprite_index = spr_wizard_walk_strip8;
	};
};

//if moving
if (hsp != 0) {
    image_xscale = sign(hsp);//so 1 or -1 (-1 is flipping the sprite)
}