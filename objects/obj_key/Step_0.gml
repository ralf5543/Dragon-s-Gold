/// @description Insert description here


switch (value) {
	case KEYVALUE.BRASS : 
	sprite_index = spr_brass_key;
	break;	
	
	case KEYVALUE.SILVER : 
	sprite_index = spr_silver_key;
	break;	
	
	case KEYVALUE.GOLD : 
	sprite_index = spr_golden_key;
	break;	
}

//=======---------- Calculate movements

vsp += grv; //contuously accelerates bottom move


//=======---------- horizontal collisions
// detects a collision at (x + hsp) distance
if (place_meeting(x + hsp, y, obj_wall)) {
	//while detects NO collision at 1px (sign(hsp), so 1 and -1) x distance
	while (!place_meeting(x + sign(hsp), y, obj_wall)) {
		//move from the "rest" to be the closest as possible from collision
		x += sign(hsp);
	}
	
	hsp = 0;//stop key movement when ejected
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
	if (can_play_sound) {
		audio_play_sound(snd_key_fall, 6, false);
		can_play_sound = false;
	}
	hsp = 0;
}

y += vsp;
