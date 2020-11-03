/// @description Healthbar

if (room != rm_start) {
	
	draw_set_font(fnt_20);
	
	for(var i = 0; i < obj_control.start_players; i ++) {
		var player1 = instance_find(obj_player, 0);
		var player2 = instance_find(obj_player, 1);
		var player3 = instance_find(obj_player, 2);
		var player4 = instance_find(obj_player, 3);
	
		gui_zoom = 1;// make gui smaller for split screen
		portrait_width = 128 * gui_zoom;
		
		healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
		healthbar_y = gui_margin;
		
		energybar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
		energybar_y = (gui_margin * 2) + healthbar_height;
		
		key_x = portrait_width + (gui_margin * 3) + (gui_margin * gui_zoom);
		key_y = (gui_margin * 4) + healthbar_height + energybar_height;
		key_spacer = (gui_margin * 4);
	
		//===============---------------- 1 player only
		if (obj_control.start_players == 1) {
			//Portrait
			draw_sprite(asset_get_index("spr_portrait_" + character), 0, gui_margin, gui_margin);
		
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (hp / hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y);			
		
			//energyhbar
			draw_sprite(spr_energyBackground, 0, energybar_x, energybar_y);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y, (energy / energy_max) * energybar_width, energybar_height);
			
			//keys
			if (has_bronze_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_key, 2, key_x, key_y, 1.6, 1.6, 135, c_white, .5);
			} else {
				draw_sprite_ext(spr_key, 2, key_x, key_y, 1.6, 1.6, 135, c_white, 1);
			}
			draw_text(key_x + 32, key_y, "x" + string(has_bronze_key));
			
			if (has_silver_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_key, 1, key_x + key_spacer, key_y, 1.6, 1.6, 135, c_white, .5);
			} else {
				draw_sprite_ext(spr_key, 1, key_x + key_spacer, key_y, 1.6, 1.6, 135, c_white, 1);
			}
			draw_text(key_x + 32 + key_spacer, key_y, "x" + string(has_silver_key));
			
			if (has_gold_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_key, 0, key_x + (key_spacer * 2), key_y, 1.6, 1.6, 135, c_white, .5);
			} else {
				draw_sprite_ext(spr_key, 0, key_x + (key_spacer * 2), key_y, 1.6, 1.6, 135, c_white, 1);
			}
			draw_text(key_x + 32 + (key_spacer * 2), key_y, "x" + string(has_gold_key));
		}
		
		//===============---------------- 2 players
		else if (obj_control.start_players == 2) {
			gui_zoom = .75;
			portrait_width = 128 * gui_zoom;
			healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			energybar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
		
			// Player 1
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + player1.character), 0, gui_margin, gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (player1.hp / player1.hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y);	
			
			//energyhbar
			draw_sprite(spr_energyBackground, 0, energybar_x, energybar_y);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y, (player1.energy / player1.energy_max) * energybar_width, energybar_height);

			// Player 2
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + player2.character), 0, gui_margin, gui_margin + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y + (global.surface_height / 2));
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y + (global.surface_height / 2), (player2.hp / player2.hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y + (global.surface_height / 2));
						
			//energyhbar
			draw_sprite(spr_energyBackground, 0, energybar_x, energybar_y + (global.surface_height / 2));
			draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y + (global.surface_height / 2), (player2.energy / player2.energy_max) * energybar_width, energybar_height);

		
		//===============---------------- 3 players
		} else if (obj_control.start_players == 3) {
		
			//=====----- Player 1
			gui_zoom = .75;
			portrait_width = 128 * gui_zoom;
			healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			energybar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
		
			// Player 1
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + player1.character), 0, gui_margin, gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (player1.hp / player1.hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y);	
			
			//energyhbar
			draw_sprite(spr_energyBackground, 0, energybar_x, energybar_y);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y, (player1.energy / player1.energy_max) * energybar_width, energybar_height);
			

			//=====----- Player 2
			gui_zoom = .5;
			portrait_width = 128 * gui_zoom;
			healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			energybar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + player2.character), 0, gui_margin, gui_margin + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y + (global.surface_height / 2));
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y + (global.surface_height / 2), (player2.hp / player2.hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y + (global.surface_height / 2));	
			
			//energyhbar
			draw_sprite(spr_energyBackground, 0, energybar_x, energybar_y + (global.surface_height / 2));
			draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y + (global.surface_height / 2), (player2.energy / player2.energy_max) * energybar_width, energybar_height);

			//=====----- Player 3
			gui_zoom = .5;
			portrait_width = 128 * gui_zoom;
			healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			energybar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + player3.character), 0, gui_margin + (global.surface_width / 2), gui_margin + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite(spr_healthBackground, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2));
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2), (player3.hp / player3.hp_max) * healthbar_width, healthbar_height);
			draw_sprite(spr_healthBorder, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2));
			
			//energyhbar
			draw_sprite(spr_energyBackground, 0, energybar_x + (global.surface_width / 2), energybar_y + (global.surface_height / 2));
			draw_sprite_stretched(spr_energyBar, 0, energybar_x + (global.surface_width / 2), energybar_y + (global.surface_height / 2) , (player3.energy / player3.energy_max) * energybar_width, energybar_height);

		//===============---------------- 4 players
		} else {
			// Player 1
			if (pad_num == 0) {
				gui_zoom = .5;
				portrait_width = 128 * gui_zoom;
				healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
				energybar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
				//Portrait
				draw_sprite_ext(asset_get_index("spr_portrait_" + player1.character), 0, gui_margin, gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
				//healthbar
				draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y);
				draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (player1.hp / player1.hp_max) * healthbar_width, healthbar_height);
				draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y);	
				
				//energyhbar
				draw_sprite(spr_energyBackground, 0, energybar_x, energybar_y);
				draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y, (player1.energy / player1.energy_max) * energybar_width, energybar_height);
			}
		
			// Player 2
			else if (pad_num == 1) {
				gui_zoom = .5;
				portrait_width = 128 * gui_zoom;
				healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
				energybar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
				//Portrait
				draw_sprite_ext(asset_get_index("spr_portrait_" + player2.character), 0, gui_margin + (global.surface_width / 2), gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
				//healthbar
				draw_sprite(spr_healthBackground, 0, healthbar_x + (global.surface_width / 2), healthbar_y);
				draw_sprite_stretched(spr_healthBar, 0, healthbar_x + (global.surface_width / 2), healthbar_y, (player2.hp / player2.hp_max) * healthbar_width, healthbar_height);
				draw_sprite(spr_healthBorder, 0, healthbar_x + (global.surface_width / 2), healthbar_y);	
				
				//energyhbar
				draw_sprite(spr_energyBackground, 0, energybar_x + (global.surface_width / 2), energybar_y);
				draw_sprite_stretched(spr_energyBar, 0, energybar_x + (global.surface_width / 2), energybar_y, (player2.energy / player2.energy_max) * energybar_width, energybar_height);
			}
		
			// Player 3
			else if (pad_num == 2) {
				gui_zoom = .5;
				portrait_width = 128 * gui_zoom;
				healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
				energybar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
				//Portrait
				draw_sprite_ext(asset_get_index("spr_portrait_" + player3.character), 0, gui_margin, gui_margin + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
				//healthbar
				draw_sprite(spr_healthBackground, 0, healthbar_x, healthbar_y + (global.surface_height / 2));
				draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y + (global.surface_height / 2), (player3.hp / player3.hp_max) * healthbar_width, healthbar_height);
				draw_sprite(spr_healthBorder, 0, healthbar_x, healthbar_y + (global.surface_height / 2));	
				
				//energyhbar
				draw_sprite(spr_energyBackground, 0, energybar_x, energybar_y + (global.surface_height / 2));
				draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y + (global.surface_height / 2), (player3.energy / player3.energy_max) * energybar_width, energybar_height);
			}
		
			// Player 4
			else {
				gui_zoom = .5;
				portrait_width = 128 * gui_zoom;
				healthbar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
				energybar_x = portrait_width + (gui_margin * 2) + (gui_margin * gui_zoom);
			
				//Portrait
				draw_sprite_ext(asset_get_index("spr_portrait_" + player4.character), 0, gui_margin + (global.surface_width / 2), gui_margin + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
				//healthbar
				draw_sprite(spr_healthBackground, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2));
				draw_sprite_stretched(spr_healthBar, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2), (player4.hp / player4.hp_max) * healthbar_width, healthbar_height);
				draw_sprite(spr_healthBorder, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2));	
				
				//energyhbar
				draw_sprite(spr_energyBackground, 0, energybar_x + (global.surface_width / 2), energybar_y + (global.surface_height / 2));
				draw_sprite_stretched(spr_energyBar, 0, energybar_x + (global.surface_width / 2), energybar_y + (global.surface_height / 2), (player4.energy / player4.energy_max) * energybar_width, energybar_height);
			}
		}
	}
}