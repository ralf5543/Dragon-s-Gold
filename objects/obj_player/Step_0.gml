/// @description Insert description here


if (hasControl) {


	// test horizontal axe for left stick for first slot controller, ignoring dead zone (0.2)
	// abs takes a number, and change it to positive equivalent ("-9" -> "9")
	if (abs(gamepad_axis_value(pad_num, gp_axislh)) > .2) {
	    key_left = abs(min(gamepad_axis_value(pad_num, gp_axislh), 0));
	    key_right = max(gamepad_axis_value(pad_num, gp_axislh), 0);
	    key_up = abs(min(gamepad_axis_value(pad_num, gp_axislv), 0));
	    key_down = max(gamepad_axis_value(pad_num, gp_axislv), 0);
		
		controller = 1;
	}

	// same for vertical axe
	if (abs(gamepad_axis_value(pad_num, gp_axislv)) > .2) {
		controller = 1;
	}
	key_jump = gamepad_button_check_pressed(pad_num, gp_face1);
	key_start = gamepad_button_check_pressed(pad_num, gp_start);
	
} else {
	key_left = 0;
	key_right = 0;
	key_jump = 0;
};

if (room == rm_start) {
	
	//obj_player.objectHeldId = object_index;
	
	if (key_start) {
		//show_debug_message("player id in Player step: " + string(player_id));
		show_debug_message("light_owner in Player step: " + string(light_owner));
		//show_debug_message("player[pad] in Player step: " + string(player[pad]));
		//instance_create_layer(x - ((3 * 128) / 2), y + 250, "layer_players", obj_select_class);
		var inst = instance_create_layer(x - (128 / 2), y + 250, "layer_players", obj_select_class);
		with (inst)
		   {
		   player_number = other.pad_num;
		   turlututu = other.light_owner;
		   }
		   
	}
} else {


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
			if (character == "knight") {
			    sprite_index = spr_knight_stand_strip2;
			} else if (character == "wizard") {
				sprite_index = spr_wizard_stand_strip2;
			} else if (character == "ranger") {
				sprite_index = spr_ranger_stand_strip2;
			}
			
		} else {
			if (character == "knight") {
			    sprite_index = spr_knight_walk_strip8;
			} else if (character == "wizard") {
				sprite_index = spr_wizard_walk_strip8;
			} else if (character == "ranger") {
				sprite_index = spr_ranger_walk_strip8;
			}
		};
	};

	//if moving
	if (hsp != 0) {
	    image_xscale = sign(hsp);//so 1 or -1 (-1 is flipping the sprite)
	}

}