// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Hurt(){

	can_attack = false;
	
	if (sprite_index != asset_get_index("spr_" + character + "_hurt_strip2")) {
		sprite_index = asset_get_index("spr_" + character + "_hurt_strip2");
		image_index = 1;
		image_speed = 0;
	}
	
	if (done == 0) {
		
		test_vsp += test_grv; //contuously accelerates bottom move


		//=======---------- horizontal collisions
		// detects a collision at (x + hsp) distance
		if (place_meeting(x + test_hsp, y, obj_wall)) {

			//while detects NO collision at 1px (sign(hsp), so 1 and -1) x distance
			while (!place_meeting(x + sign(test_hsp), y, obj_wall)) {
				//move from the "rest" to be the closest as possible from collision
			    x += sign(test_hsp);
			}
			hsp = 0;
		}

		x += test_hsp;

		//=======---------- vertical collisions
		// detects a collision at (y + vsp) distance
		if (place_meeting(x, y + test_vsp, obj_wall)) {
			if (test_vsp > 1) {// just to stop the condition, and save perfs
				done = 1;				
			
			};
		
			//while detects NO collision at 1px (sign(vsp), so 1 and -1) y distance
			 while (!place_meeting(x, y + sign(test_vsp), obj_wall)) {
				//move from the "rest" to be the closest as possible from collision
			    y += sign(test_vsp);
			}
			test_vsp = 0;
			state = PLAYERSTATE.FREE;
		}

		y += test_vsp;	
	
	}

}