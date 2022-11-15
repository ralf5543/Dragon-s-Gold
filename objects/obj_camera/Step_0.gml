/// @description Create views

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
		
		global.Cameras[i] = camera_create_view(0, 0, window_width  * .5, window_height * .5, 0, player_nth, -1, -1, window_width, window_height);
		view_set_camera(i, global.Cameras[i]);
	
		//if 1 player only
		if(i == 0) {
			view_xport[i] = 0;
			view_yport[i] = 0;
			view_wport[i] = window_width;
			view_hport[i] = window_height;
		}
		// if 2 players
		if(i == 1) {
			view_set_xport(0, 0);
			view_set_yport(0, 0);
			view_set_wport(0, window_width);
			view_set_hport(0, window_height / 2);
			camera_set_view_size(global.Cameras[0], window_width  * .7, (window_height / 2)  * .7);
		
			view_set_xport(1, 0);
			view_set_yport(1, window_height / 2);
			view_set_wport(1, window_width);
			view_set_hport(1, window_height / 2);
			camera_set_view_size(global.Cameras[1], window_width  * .7, (window_height / 2)  * .7);
		}
		// if 3 players
		if(i == 2) {
			//First player gets a bigger screen
			view_set_xport(0, 0);
			view_set_yport(0, 0);
			view_set_wport(0, window_width);
			view_set_hport(0, window_height / 2);
			camera_set_view_size(global.Cameras[0], window_width  * .7, (window_height / 2)  * .7);
		
			view_set_xport(1, 0);
			view_set_yport(1, window_height / 2);
			view_set_wport(1, window_width / 2);
			view_set_hport(1, window_height / 2);
			camera_set_view_size(global.Cameras[1], (window_width / 2) * .85,( window_height / 2) * .85);
		
			view_set_xport(2, window_width / 2);
			view_set_yport(2, window_height / 2);
			view_set_wport(2, window_width / 2);
			view_set_hport(2, window_height / 2);
			camera_set_view_size(global.Cameras[2], (window_width / 2) * .85,( window_height / 2) * .85);
		}
		if(i == 3) {
			view_set_xport(0, 0);
			view_set_yport(0, 0);
			view_set_wport(0, window_width / 2);
			view_set_hport(0, window_height / 2);
			camera_set_view_size(global.Cameras[0], (window_width / 2) * .85,( window_height / 2) * .85);
		
			view_set_xport(1, window_width / 2);
			view_set_yport(1, 0);
			view_set_wport(1, window_width / 2);
			view_set_hport(1, window_height / 2);
			camera_set_view_size(global.Cameras[1], (window_width / 2) * .85,( window_height / 2) * .85);
		
			view_set_xport(2, 0);
			view_set_yport(2, window_height / 2);
			view_set_wport(2, window_width / 2);
			view_set_hport(2, window_height / 2);
			camera_set_view_size(global.Cameras[2], (window_width / 2) * .85,( window_height / 2) * .85);
		
			view_set_xport(3, window_width / 2);
			view_set_yport(3, window_height / 2);
			view_set_wport(3, window_width / 2);
			view_set_hport(3, window_height / 2);
			camera_set_view_size(global.Cameras[3], (window_width / 2) * .85,( window_height / 2) * .85);
		}

	}
	
	
	
	window_set_size(window_width * window_scale, window_height * window_scale);
	surface_resize(application_surface, window_width * window_scale, window_height * window_scale);
	
	
	
