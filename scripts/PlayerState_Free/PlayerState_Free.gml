
function PlayerState_Free(){
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
		facing = sign(hsp);
	    
	}
	
	// if attacks AND not in the air (jumping or falling)
	if (key_attack) && (vsp == 0) {
		state = PLAYERSTATE.ATTACK_SLASH;
	}
}