/// @description Players commands


// stops the character when sticks are released
key_left = 0
key_right = 0;
key_jump = 0;

// test horizontal axe for left stick for first slot controller, ignoring dead zone (0.2)
// abs takes a number, and change it to positive equivalent ("-9" -> "9")
if (abs(gamepad_axis_value(pad_num, gp_axislh)) > .2) {
	key_left = abs(min(gamepad_axis_value(pad_num, gp_axislh), 0));
	key_right = max(gamepad_axis_value(pad_num, gp_axislh), 0);	    
}

// same for vertical axe
if (abs(gamepad_axis_value(pad_num, gp_axislv)) > .2) {
	key_up = abs(min(gamepad_axis_value(pad_num, gp_axislv), 0));
	key_down = max(gamepad_axis_value(pad_num, gp_axislv), 0);
}
	
key_jump = gamepad_button_check_pressed(pad_num, gp_face1);
key_start = gamepad_button_check_pressed(pad_num, gp_start);	

// used only for characters selection screen
if (room == rm_start) {
	
	if (key_start) {
		// create class selection menu linked to this instance
		var inst = instance_create_layer(x - ((128 * 3) / 2), y + 250, "layer_players", obj_select_class);
		//sprite_index = spr_knight_stand_strip2;
		image_xscale = 1.5;
		image_yscale = 1.5;

		with (inst) {
			//give gamepad number (from 0 to 3) to that obj_select_class instance
		   player_number = other.pad_num;
		   
		   //give gamepad id to the obj_select_class, via gamepad_id_receiver var
		   gamepad_id_receiver = other.gamepad_id_owner;
		}
		if (can_push_start == true) {
			//tells (just once) to the Controller that this player is ready
			obj_control.start_players ++;
			can_push_start = false;
		}
	}
		   
} else {
		image_xscale = 1;
		image_yscale = 1;

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
			sprite_index = asset_get_index("spr_" + character + "_stand_strip2");
			
		} else {
			sprite_index = asset_get_index("spr_" + character + "_walk_strip8");
		};
	};

	//if moving
	if (hsp != 0) {
	    image_xscale = sign(hsp);//so 1 or -1 (-1 is flipping the sprite)
	}
}