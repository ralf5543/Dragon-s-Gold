/// @description Insert description here
// You can write your code in this editor

	var width = 2048, height = 1024, scale = 1;

	//Destroy previous cameras (avoid memory leak)
	if(is_undefined(global.Cameras) == false) {
		for(var i = 0; i < array_length(global.Cameras); i ++) {
			camera_destroy(global.Cameras[i]);
		}
	}
	global.Cameras = undefined;

	view_visible[0] = false;
	view_visible[1] = false;
	view_visible[2] = false;
	view_visible[3] = false;

	for(var i = 0; i < playerCount; i ++) {
		player_nth = instance_find(obj_player, i);
		view_visible[i] = true;
		
		global.Cameras[i] = camera_create_view(0, 0, width  * .75, height * .75, 0, player_nth, -1, -1, width, height);
		view_set_camera(i, global.Cameras[i]);
	
		//if 1 player only
		if(i == 0) {
			view_xport[i] = 0;
			view_yport[i] = 0;
			view_wport[i] = width;
			view_hport[i] = height;
		}
		// if 2 players
		if(i == 1) {
			view_set_xport(0, 0);
			view_set_yport(0, 0);
			view_set_wport(0, width);
			view_set_hport(0, height / 2);
			camera_set_view_size(global.Cameras[0], width  * .75, (height / 2)  * .75);
		
			view_set_xport(1, 0);
			view_set_yport(1, height / 2);
			view_set_wport(1, width);
			view_set_hport(1, height / 2);
			camera_set_view_size(global.Cameras[1], width  * .75, (height / 2)  * .75);
		}
		// if 3 players
		if(i == 2) {
			//First player gets a big screen
			view_set_xport(0, 0);
			view_set_yport(0, 0);
			view_set_wport(0, width);
			view_set_hport(0, height / 2);
			camera_set_view_size(global.Cameras[0], width, height / 2);
		
			view_set_xport(1, 0);
			view_set_yport(1, height / 2);
			view_set_wport(1, width / 2);
			view_set_hport(1, height / 2);
			camera_set_view_size(global.Cameras[1], width / 2, height / 2);
		
			view_set_xport(2, width / 2);
			view_set_yport(2, height / 2);
			view_set_wport(2, width / 2);
			view_set_hport(2, height / 2);
			camera_set_view_size(global.Cameras[2], width / 2, height / 2);
		}
		if(i == 3) {
			view_set_xport(0, 0);
			view_set_yport(0, 0);
			view_set_wport(0, width / 2);
			view_set_hport(0, height / 2);
			camera_set_view_size(global.Cameras[0], width / 2, height / 2);
		
			view_set_xport(1, width / 2);
			view_set_yport(1, 0);
			view_set_wport(1, width / 2);
			view_set_hport(1, height / 2);
			camera_set_view_size(global.Cameras[1], width / 2, height / 2);
		
			view_set_xport(2, 0);
			view_set_yport(2, height / 2);
			view_set_wport(2, width / 2);
			view_set_hport(2, height / 2);
			camera_set_view_size(global.Cameras[2], width / 2, height / 2);
		
			view_set_xport(3, width / 2);
			view_set_yport(3, height / 2);
			view_set_wport(3, width / 2);
			view_set_hport(3, height / 2);
			camera_set_view_size(global.Cameras[3], width / 2, height / 2);
		}

	}
	
	
	
	window_set_size(width * scale, height * scale);
	surface_resize(application_surface, width * scale, height * scale);
	
	/// @description Temp players infos drawn

//draw_self();// default draw, needed if draw event exists

//draw_set_color(c_white);
//draw_text(x - 10, y - 70, "Player " + string(pad_num + 1));
//draw_text(x - 10, y - 50, "Classe " + string(character));
