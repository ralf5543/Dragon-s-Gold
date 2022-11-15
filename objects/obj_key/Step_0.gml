/// @description Insert description here

//wait a sec at game launch, sa all keys don't ring at the same time !
alarm[0] = 64;

switch (value) {
	case "gold" : 
	image_index = 0;
	break;	
	
	case "silver" : 
	image_index = 1;
	break;	
	
	case "bronze" : 
	image_index = 2;
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
	if (can_play_sound) {
		audio_play_sound(snd_key_fall, 6, 0);
		can_play_sound = false;
	}
}

y += vsp;
