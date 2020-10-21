
function PlayerState_Hurt(){

	can_attack = false;
	
	if (sprite_index != asset_get_index("spr_" + character + "_hurt_strip2")) {
		sprite_index = asset_get_index("spr_" + character + "_hurt_strip2");
		image_index = 1;
		image_speed = 0;
	}
	
	if (hurt_done == 0) {
		
		hurt_vsp += hurt_grv; //contuously accelerates bottom move


		//=======---------- horizontal collisions
		// detects a collision at (x + hsp) distance
		if (place_meeting(x + (hurt_hsp * hitfrom), y, obj_wall)) {

			//while detects NO collision at 1px (sign(hsp), so 1 and -1) x distance
			while (!place_meeting(x + sign(hurt_hsp * hitfrom), y, obj_wall)) {
				//move from the "rest" to be the closest as possible from collision
			    x += sign(hurt_hsp * hitfrom);
			}
			hurt_hsp = 0;
		}

		x += hurt_hsp * hitfrom;// the player will be thrown to the left or the right

		//=======---------- vertical collisions
		// detects a collision at (y + vsp) distance
		if (place_meeting(x, y + hurt_vsp, obj_wall)) {
			if (hurt_vsp > 1) {// just to stop the condition, and save perfs
				hurt_done = 1;				
			
			};
		
			//while detects NO collision at 1px (sign(vsp), so 1 and -1) y distance
			 while (!place_meeting(x, y + sign(hurt_vsp), obj_wall)) {
				//move from the "rest" to be the closest as possible from collision
			    y += sign(hurt_vsp);
			}
			hurt_vsp = 0;
			state = PLAYERSTATE.FREE;
		}

		y += hurt_vsp;	
	
	}

}