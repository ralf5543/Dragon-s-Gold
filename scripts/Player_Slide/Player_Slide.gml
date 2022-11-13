// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_Slide(distance){
	var slideDistance = (distance * facing);
		
	//smoothly slow down the slide
	retarder = retarder - clamp(retarder, 0, distance) / 5;
	slideDistance = slideDistance + retarder
	// detects a collision at (x + hsp) distance (won't slide into a wall !)
	if (place_meeting(x + slideDistance, y, obj_wall)) {
		//while detects NO collision at 1px (sign(hsp), so 1 and -1) x distance
		while (!place_meeting(x + sign(slideDistance), y, obj_wall)) {
			//move from the "rest" to be the closest as possible from collision
			x += sign(facing);
		}
	} else {
		x += slideDistance;
	}
		
	if (can_slide) {
		//slides for 0.5 second
		alarm[3] = 16;
		can_slide = false;
	}
}