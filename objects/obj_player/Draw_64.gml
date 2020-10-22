/// @description Healthbar

if (room != rm_start) {
	gui_zoom = 1;// make gui smaller for split screen
	healthbar_x = 128 + ((gui_margin * 2) * gui_zoom);
	healthbar_y = gui_margin;
	
	if (obj_control.start_players == 1) {
		//Portrait
		draw_sprite(asset_get_index("spr_portrait_" + character), 0, gui_margin, gui_margin);
		
		//healthbar
		draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y);
		draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (hp / hp_max) * healthbar_width, healthbar_height);
		draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y);			
	}
		
	else if (obj_control.start_players == 2) {
		gui_zoom = .75;
		
		if (pad_num == 0) {
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + character), 0, gui_margin, gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (hp / hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y);	

		} else {
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + character), 0, gui_margin, gui_margin + (room_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y + (room_height / 2));
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y + (room_height / 2), (hp / hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y + (room_height / 2));
		}			
	}	
}