/// @description Insert description here
// You can write your code in this editor

if !surface_exists(surf) {
    //var _cw = camera_get_view_width(view_camera[0]);
    //var _ch = camera_get_view_height(view_camera[0]);
	var _cw = room_width;
	var _ch = room_height;
    surf = surface_create(_cw, _ch);
    surface_set_target(surf);
    draw_set_colour(c_black);
    draw_set_alpha(0);
    draw_rectangle(0, 0, _cw, _cw, false);
    surface_reset_target();
} else {
	if (surface_exists(surf)) {
	//var _cw = camera_get_view_width(view_camera[0]);
	//var _ch = camera_get_view_height(view_camera[0]);
	//var _cx = camera_get_view_x(view_camera[0]);
	//var _cy = camera_get_view_y(view_camera[0]);
	var _cw = room_width;
	var _ch = room_height;
	var _cx = 0;
	var _cy = 0;
	surface_set_target(surf);
	draw_set_color(c_black);
	draw_set_alpha(0.8);
	draw_rectangle(0, 0, _cw, _ch, 0);
	
	with (obj_lightParent) {
		switch(object_index) {
			case obj_torch:
				gpu_set_blendmode(bm_subtract);
			    draw_sprite_ext(spr_light, 0, x - _cx, y - 16 - _cy, 0.5 + random(0.05), 0.5 + random(0.05), 0, c_white, 1);
			    break;

			case obj_fireball:
				gpu_set_blendmode(bm_subtract);
				
				if (size ="small") {
					var fireballZoom = 0.1;

				} else if (size ="medium") {
					var fireballZoom = 0.2;
				} else {
					var fireballZoom = 0.3;
				}
				draw_sprite_ext(spr_light, 0, x - _cx, y - _cy, fireballZoom + random(0.05), fireballZoom + random(0.05), 0, c_white, 1);
				gpu_set_blendmode(bm_normal);
				gpu_set_blendmode(bm_add);
				draw_sprite_ext(spr_light, 0, x - _cx, y - _cy, fireballZoom, fireballZoom, 0, c_orange, 0.4);
				break;
	    }
	}
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	surface_reset_target();
	draw_surface(surf, _cx, _cy);
	}
}