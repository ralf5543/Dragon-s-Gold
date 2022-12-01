
function PlayerState_Free(){
	image_speed = 1;
	
	//reinit the hurt values, so he can be thrown again !
	hurt_hsp = 4;
	hurt_vsp = -5;
	hurt_grv = .4;
	hurt_done = 0;
	
	can_attack = true;
	can_combo1 = true;
	has_touched_ennemy1 = false;
	can_combo2 = true;
	has_touched_ennemy2 = false;
	can_lose_key = true;
	can_lose_key_when_dead = true;
	can_slide = true;
	is_hurt = false;
	
//=======---------- Calculate movements
	var move = key_right - key_left; // because true = 1 and false = -1
	if (key_run) && (energy > 0) {
		walksp = 8;
		energy --;

	} else {
		walksp = 4;

	}

	hsp = move * walksp; // changes the direction from -4 (if walkspd = 4), to 4, on X axis.
	vsp += grv; //contuously accelerates bottom move
	
	// if detects a collision with wall 1px bellow it (so, if it's on the floor !)
	//AND jump button is pressed
	if (place_meeting(x, y + 1, obj_wall)) && (key_jump) {
		//jump higher if running
		if (key_run) && (energy > 0) {vsp = -10;} else {vsp = -8;}
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
		if (vsp > .4) {//strange, the vsp seems to be stuck at 0.4, and not 0...
			if (can_landingSound) {
				audio_play_sound(snd_landing, 5, false);
				can_landingSound = false;
				alarm[1] = 16;
			}
		};
		
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
		
		//descendant part from the jump
		if (vsp > 0) {
			if skeleton_animation_get() != "jump-down" {
				
				image_speed = 1;
				skeleton_animation_set("jump-down");
			}
		}
		//ascendant part from the jump
		else {
		    if skeleton_animation_get() != "jump-up" {
				skeleton_animation_set("jump-up");
			}
		}
	} else {
		//image_speed = 1;
		if (hsp == 0) {
			if skeleton_animation_get() != "stand"
			    {
			        skeleton_animation_set("stand");
			    }
			
		} else {
			if (key_run) && (energy > 0) {
				walksp = 8;
				energy --;
		
				//for preventing looping on frame 1 of the animation
				if (skeleton_animation_get() != "run") {
					    skeleton_animation_set("run");
					}
			} else {
				//for preventing looping on frame 1 of the animation
				if skeleton_animation_get() != "walk"
				    {
				        skeleton_animation_set("walk");
				    }
			}
		};
	};

	//if moving
	if (hsp != 0) {
		facing = sign(hsp);
		
		//if on floor
		if (can_footStep == true) && (place_meeting(x, y + 1, obj_wall)) {
			
			
			audio_play_sound(choose(snd_footstep1, snd_footstep2, snd_footstep3, snd_footstep4), 1, false);
			can_footStep = false;
			if (key_run) {
				alarm[1] = 20;//so 1 sound every 2 frames
			} else {
				alarm[1] = 16;//so 1 sound every 2 frames
			}
		}
	}
	
	// if attacks AND not in the air (jumping or falling) AND not hurt
	if (key_attack) && (place_meeting(x, y + 1, obj_wall)) && (state != PLAYERSTATE.HURT) {
		state = PLAYERSTATE.ATTACK;
	}
	
	// if attacks AND not in the air (jumping or falling) AND not hurt
	if (key_special) && (place_meeting(x, y + 1, obj_wall)) && (state != PLAYERSTATE.HURT) {
		state = PLAYERSTATE.SPECIAL;
	}
}