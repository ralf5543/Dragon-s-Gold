
/// @description Insert description here
// You can write your code in this editor

key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(ord("W"));


var move = key_right - key_left;

hsp = move * walksp;
vsp += grv;

if (hsp !=0) {
	skeleton_animation_set("knight-walk")
}

if (place_meeting(x+hsp, y, obj_wall)) {
	
	
	while(!place_meeting(x+sign(hsp), y, obj_wall)){
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;hsp = move * walksp;


if (place_meeting(x, y+1, obj_wall)) && (key_jump) {
	vsp = -7;
}


if (place_meeting(x+hsp, y, obj_wall)) {
	
	
	while(!place_meeting(x+sign(hsp), y, obj_wall)){
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

if (place_meeting(x, y+vsp, obj_wall)) {
	
	
	while(!place_meeting(x, y+sign(vsp), obj_wall)){
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;












