/// @description Healthbar

if (room != rm_start) {
	
	for(var i = 0; i < obj_control.start_players; i ++) {
		var player1 = instance_find(obj_player, 0);
		var player2 = instance_find(obj_player, 1);
		var player3 = instance_find(obj_player, 2);
		var player4 = instance_find(obj_player, 3);
	
		gui_zoom = 1;// make gui smaller for split screen
		portrait_width = 128 * gui_zoom;
		healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
		healthbar_y = gui_margin;
	
		//===============---------------- 1 player only
		if (obj_control.start_players == 1) {
			//Portrait
			draw_sprite(asset_get_index("spr_portrait_" + character), 0, gui_margin, gui_margin);
		
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (hp / hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y);			
		}
		
		//===============---------------- 2 players
		else if (obj_control.start_players == 2) {
			gui_zoom = .75;
			portrait_width = 128 * gui_zoom;
			healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
		
			// Player 1
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + player1.character), 0, gui_margin, gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (player1.hp / player1.hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y);	

			// Player 2
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + player2.character), 0, gui_margin, gui_margin + (room_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y + (room_height / 2));
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y + (room_height / 2), (player2.hp / player2.hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y + (room_height / 2));

		
		//===============---------------- 3 players
		} else if (obj_control.start_players == 3) {
		
			//=====----- Player 1
			gui_zoom = .75;
			portrait_width = 128 * gui_zoom;
			healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + player1.character), 0, gui_margin, gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (player1.hp / player1.hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y);	

			//=====----- Player 2
			gui_zoom = .5;
			portrait_width = 128 * gui_zoom;
			healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + player2.character), 0, gui_margin, gui_margin + (room_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y + (room_height / 2));
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y + (room_height / 2), (player2.hp / player2.hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y + (room_height / 2));		

			//=====----- Player 3
			gui_zoom = .5;
			portrait_width = 128 * gui_zoom;
			healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + player3.character), 0, gui_margin + (room_width / 2), gui_margin + (room_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x + (room_width / 2), healthbar_y + (room_height / 2));
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x + (room_width / 2), healthbar_y + (room_height / 2), (player3.hp / player3.hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x + (room_width / 2), healthbar_y + (room_height / 2));

		//===============---------------- 4 players
		} else {
			// Player 1
			if (pad_num == 0) {
				gui_zoom = .5;
				portrait_width = 128 * gui_zoom;
				healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
				//Portrait
				draw_sprite_ext(asset_get_index("spr_portrait_" + player1.character), 0, gui_margin, gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
				//healthbar
				draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y);
				draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (player1.hp / player1.hp_max) * healthbar_width, healthbar_height);
				draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y);	
			}
		
			// Player 2
			else if (pad_num == 1) {
				gui_zoom = .5;
				portrait_width = 128 * gui_zoom;
				healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
				//Portrait
				draw_sprite_ext(asset_get_index("spr_portrait_" + player2.character), 0, gui_margin + (room_width / 2), gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
				//healthbar
				draw_sprite(spr_healthBackground, 0, healthbar_x + (room_width / 2), healthbar_y);
				draw_sprite_stretched(spr_healthBar, 0, healthbar_x + (room_width / 2), healthbar_y, (player2.hp / player2.hp_max) * healthbar_width, healthbar_height);
				draw_sprite(spr_healthBorder, 0, healthbar_x + (room_width / 2), healthbar_y);	
			}
		
			// Player 3
			else if (pad_num == 2) {
				gui_zoom = .5;
				portrait_width = 128 * gui_zoom;
				healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
				//Portrait
				draw_sprite_ext(asset_get_index("spr_portrait_" + player3.character), 0, gui_margin, gui_margin + (room_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
				//healthbar
				draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y + (room_height / 2));
				draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y + (room_height / 2), (player3.hp / player3.hp_max) * healthbar_width, healthbar_height);
				draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y + (room_height / 2));	
			}
		
			// Player 4
			else {
				gui_zoom = .5;
				portrait_width = 128 * gui_zoom;
				healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
				//Portrait
				draw_sprite_ext(asset_get_index("spr_portrait_" + player4.character), 0, gui_margin + (room_width / 2), gui_margin + (room_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
				//healthbar
				draw_sprite(spr_healthBackground, 0, healthbar_x + (room_width / 2), healthbar_y + (room_height / 2));
				draw_sprite_stretched(spr_healthBar, 0, healthbar_x + (room_width / 2), healthbar_y + (room_height / 2), (player4.hp / player4.hp_max) * healthbar_width, healthbar_height);
				draw_sprite(spr_healthBorder, 0, healthbar_x + (room_width / 2), healthbar_y + (room_height / 2));	
			}
		}
	}
}