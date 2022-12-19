/// @description Healthbar

if (room != rm_start) {
	
	for(var i = 0; i < obj_control.start_players; i ++) {
		var player1 = instance_find(obj_player, 0);
		var player2 = instance_find(obj_player, 1);
		var player3 = instance_find(obj_player, 2);
		var player4 = instance_find(obj_player, 3);
	}
			
	portrait_width = 128 * gui_zoom;
	gui_margin = 20 * gui_zoom;
		
	healthbar_width = 248 * gui_zoom;//256 - border
	healthbar_height = 24 * gui_zoom;//36 - border
	energybar_width = 192 * gui_zoom;//256 - border
	energybar_height = 10 * gui_zoom;//36 - border
		
	healthbar_x = portrait_width + (gui_margin * 2);
	healthbar_y = gui_margin;
		
	energybar_x = portrait_width + (gui_margin * 2);
	energybar_y = (gui_margin * 2) + healthbar_height;
		
	key_x = portrait_width + (gui_margin * 3);
	key_y = (gui_margin * 4) + healthbar_height + energybar_height;
	key_spacer = (gui_margin * 4);
	
	//=================================----------------------------------- 1 player only
	if (obj_control.start_players == 1) {
		gui_zoom = 1;// make gui smaller for split screen
			
		draw_set_font(fnt_14);
			
		//Portrait
		draw_sprite(asset_get_index("spr_portrait_" + character + "_" + skeleton_skin_get()), 0, gui_margin, gui_margin);
		
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
			draw_sprite_ext(spr_brass_key, 0, key_x, key_y, 1, 1, 135, c_white, .4);
		} else {
			draw_sprite_ext(spr_brass_key, 0, key_x, key_y, 1, 1, 135, c_white, 1);
		}
		draw_text(key_x + 32, key_y, "x" + string(has_bronze_key));
			
		if (has_silver_key < 1) {
			// semi opacity
			draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y, 1, 1, 135, c_white, .4);
		} else {
			draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y, 1, 1, 135, c_white, 1);
		}
		draw_text(key_x + 32 + key_spacer, key_y, "x" + string(has_silver_key));
			
		if (has_gold_key < 1) {
			// semi opacity
			draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y, 1, 1, 135, c_white, .4);
		} else {
			draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y, 1, 1, 135, c_white, 1);
		}
		draw_text(key_x + 32 + (key_spacer * 2), key_y, "x" + string(has_gold_key));
	}
		
	//=================================----------------------------------- 2 players
	else if (obj_control.start_players == 2) {
		gui_zoom = .75;
			
		portrait_width = 128 * gui_zoom;
		gui_margin = 20 * gui_zoom;
		
		healthbar_width = 248 * gui_zoom;//256 - border
		healthbar_height = 24 * gui_zoom;//36 - border
		energybar_width = 192 * gui_zoom;//256 - border
		energybar_height = 10 * gui_zoom;//36 - border
		
		healthbar_x = portrait_width + (gui_margin * 2);
		healthbar_y = gui_margin;
		
		energybar_x = portrait_width + (gui_margin * 2);
		energybar_y = (gui_margin * 2) + healthbar_height;
		
		key_x = portrait_width + (gui_margin * 3);
		key_y = (gui_margin * 4) + healthbar_height + energybar_height;
		key_spacer = (gui_margin * 4);
			
		draw_set_font(fnt_12);
				
		// =======-------- Player 1
		with (player1) {	
				
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + character + "_" + skeleton_skin_get()), 0, gui_margin, gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite_ext(spr_healthBackground, 0, healthbar_x, healthbar_y, 1 * gui_zoom, 1 * gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (hp / hp_max) * healthbar_width, healthbar_height);	
			draw_sprite_ext(spr_healthBorder, 0, healthbar_x, healthbar_y, 1 * gui_zoom, 1 * gui_zoom, 0, c_white, 1);
			
			//energyhbar
			draw_sprite_ext(spr_energyBackground, 0, energybar_x, energybar_y, 1 * gui_zoom, 1 * gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y, (energy / energy_max) * energybar_width, energybar_height);
			draw_sprite_ext(spr_brass_key, 0, key_x, key_y, 1.2, 1.2, 135, c_white, .5);
				
			//keys
			if (has_bronze_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y, 1.2, 1.2, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y, 1.2, 1.2, 135, c_white, 1);
			}
			draw_text(key_x + 20, key_y, "x" + string(has_bronze_key));
			
			if (has_silver_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y, 1.2, 1.2, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y, 1.2, 1.2, 135, c_white, 1);
			}
			draw_text(key_x + 20 + key_spacer, key_y, "x" + string(has_silver_key));
			
			if (has_gold_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y, 1.2, 1.2, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y, 1.2, 1.2, 135, c_white, 1);
			}
			draw_text(key_x + 20 + (key_spacer * 2), key_y, "x" + string(has_gold_key));			
		}
			
		// =======-------- Player 2
		with (player2) {

			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + character + "_" + skeleton_skin_get()), 0, gui_margin, gui_margin + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite_ext(spr_healthBackground, 0, healthbar_x, healthbar_y + (global.surface_height / 2), 1 * gui_zoom, 1 * gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y + (global.surface_height / 2), (hp / hp_max) * healthbar_width, healthbar_height);	
			draw_sprite_ext(spr_healthBorder, 0, healthbar_x, healthbar_y + (global.surface_height / 2), 1 * gui_zoom, 1 * gui_zoom, 0, c_white, 1);
			
			//energyhbar
			draw_sprite_ext(spr_energyBackground, 0, energybar_x, energybar_y + (global.surface_height / 2), 1 * gui_zoom, 1 * gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y + (global.surface_height / 2), (energy / energy_max) * energybar_width, energybar_height);
			
			//keys
			if (has_bronze_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y + (global.surface_height / 2), 1.2, 1.2, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y + (global.surface_height / 2), 1.2, 1.2, 135, c_white, 1);
			}
			draw_text(key_x + 20, key_y + (global.surface_height / 2), "x" + string(has_bronze_key));
			
			if (has_silver_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y + (global.surface_height / 2), 1.2, 1.2, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y + (global.surface_height / 2), 1.2, 1.2, 135, c_white, 1);
			}
			draw_text(key_x + 20 + key_spacer, key_y + (global.surface_height / 2), "x" + string(has_silver_key));
			
			if (has_gold_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y + (global.surface_height / 2), 1.2, 1.2, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y + (global.surface_height / 2), 1.2, 1.2, 135, c_white, 1);
			}
			draw_text(key_x + 20 + (key_spacer * 2), key_y + (global.surface_height / 2), "x" + string(has_gold_key));
		}

		
	//=================================----------------------------------- 3 players
	} else if (obj_control.start_players == 3) {
		
		//=====----- Player 1
		with (player1) {
			gui_zoom = .75;
			
			portrait_width = 128 * gui_zoom;
			healthbar_width = 248 * gui_zoom;//256 - border
			healthbar_height = 24 * gui_zoom;//36 - border
			energybar_width = 192 * gui_zoom;//256 - border
			energybar_height = 10 * gui_zoom;//36 - border
			
			healthbar_x = portrait_width + (gui_margin * 2);
			healthbar_y = gui_margin;
		
			energybar_x = portrait_width + (gui_margin * 2);
			energybar_y = (gui_margin * 2) + healthbar_height;
		
			key_x = portrait_width + (gui_margin * 3);
			key_y = (gui_margin * 4) + healthbar_height + energybar_height;
			key_spacer = (gui_margin * 6);
			
			draw_set_font(fnt_12);
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + character + "_" + skeleton_skin_get()), 0, gui_margin, gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite_ext(spr_healthBackground, 0, healthbar_x, healthbar_y, gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (hp / hp_max) * healthbar_width, healthbar_height);	
			draw_sprite_ext(spr_healthBorder, 0, healthbar_x, healthbar_y, gui_zoom, gui_zoom, 0, c_white, 1);
			
			//energyhbar
			draw_sprite_ext(spr_energyBackground, 0, energybar_x, energybar_y, 1 * gui_zoom, 1 * gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y, (energy / energy_max) * energybar_width, energybar_height);
			draw_sprite_ext(spr_brass_key, 0, key_x, key_y, 1.2, 1.2, 135, c_white, .5);
			
			//keys
			if (has_bronze_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y, 1.2, 1.2, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y, 1.2, 1.2, 135, c_white, 1);
			}
			draw_text(key_x + 20, key_y, "x" + string(has_bronze_key));
			
			if (has_silver_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y, 1.2, 1.2, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y, 1.2, 1.2, 135, c_white, 1);
			}
			draw_text(key_x + 20 + key_spacer, key_y, "x" + string(has_silver_key));
			
			if (has_gold_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y, 1.2, 1.2, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y, 1.2, 1.2, 135, c_white, 1);
			}
			draw_text(key_x + 20 + (key_spacer * 2), key_y, "x" + string(has_gold_key));
				
		//=====----- Player 2
		}
		with (player2) {
			
			draw_set_font(fnt_10);
			gui_zoom = .5;
			
			portrait_width = 128 * gui_zoom;
			healthbar_width = 248 * gui_zoom;//256 - border
			healthbar_height = 24 * gui_zoom;//36 - border
			energybar_width = 192 * gui_zoom;//256 - border
			energybar_height = 10 * gui_zoom;//36 - border
			
			healthbar_x = portrait_width + (gui_margin * 2);
			healthbar_y = gui_margin;
		
			energybar_x = portrait_width + (gui_margin * 2);
			energybar_y = (gui_margin * 2) + healthbar_height;
		
			key_x = portrait_width + (gui_margin * 3);
			key_y = (gui_margin * 4) + healthbar_height + energybar_height;
			key_spacer = (gui_margin * 4);
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + character + "_" + skeleton_skin_get()), 0, gui_margin, gui_margin + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite_ext(spr_healthBackground, 0, healthbar_x, healthbar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y + (global.surface_height / 2), (hp / hp_max) * healthbar_width, healthbar_height);	
			draw_sprite_ext(spr_healthBorder, 0, healthbar_x, healthbar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			
			//energyhbar
			draw_sprite_ext(spr_energyBackground, 0, energybar_x, energybar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y + (global.surface_height / 2), (energy / energy_max) * energybar_width, energybar_height);

			//keys
			if (has_bronze_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12, key_y + (global.surface_height / 2), "x" + string(has_bronze_key));
			
			if (has_silver_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + key_spacer, key_y + (global.surface_height / 2), "x" + string(has_silver_key));
			
			if (has_gold_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + (key_spacer * 2), key_y + (global.surface_height / 2), "x" + string(has_gold_key));
			
		//=====----- Player 3
		}
			
		with (player3) {

			gui_zoom = .5;
			portrait_width = 128 * gui_zoom;
			gui_margin = 20 * gui_zoom;
		
			healthbar_x = portrait_width + (gui_margin * 2);
			healthbar_y = gui_margin;
		
			energybar_x = portrait_width + (gui_margin * 2);
			energybar_y = (gui_margin * 2) + healthbar_height;
		
			key_x = portrait_width + (gui_margin * 3);
			key_y = (gui_margin * 4) + healthbar_height + energybar_height;
			key_spacer = (gui_margin * 4);
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + character + "_" + skeleton_skin_get()), 0, gui_margin + (global.surface_width / 2), gui_margin + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite_ext(spr_healthBackground, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2), (hp / hp_max) * healthbar_width, healthbar_height);	
			draw_sprite_ext(spr_healthBorder, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			
			//energyhbar
			draw_sprite_ext(spr_energyBackground, 0, energybar_x + (global.surface_width / 2), energybar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x + (global.surface_width / 2), energybar_y + (global.surface_height / 2), (energy / energy_max) * energybar_width, energybar_height);
			
			//keys
			if (has_bronze_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_brass_key, 0, key_x + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_brass_key, 0, key_x + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + (global.surface_width / 2), key_y + (global.surface_height / 2), "x" + string(has_bronze_key));
			
			if (has_silver_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + key_spacer + (global.surface_width / 2), key_y + (global.surface_height / 2), "x" + string(has_silver_key));
			
			if (has_gold_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2) + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2) + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + (key_spacer * 2) + (global.surface_width / 2), key_y + (global.surface_height / 2), "x" + string(player3.has_gold_key));
		}
			
	//=================================----------------------------------- 4 players
	} else {
		
		gui_zoom = .5;
		portrait_width = 128 * gui_zoom;
		gui_margin = 20 * gui_zoom;
		
		healthbar_x = portrait_width + (gui_margin * 2);
		healthbar_y = gui_margin;
		
		energybar_x = portrait_width + (gui_margin * 2);
		energybar_y = (gui_margin * 2) + healthbar_height;
		
		key_x = portrait_width + (gui_margin * 3);
		key_y = (gui_margin * 4) + healthbar_height + energybar_height;
		key_spacer = (gui_margin * 4);
			
		// Player 1
		with (player1) {
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + character + "_" + skeleton_skin_get()), 0, gui_margin, gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite_ext(spr_healthBackground, 0, healthbar_x, healthbar_y, gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y, (hp / hp_max) * healthbar_width, healthbar_height);	
			draw_sprite_ext(spr_healthBorder, 0, healthbar_x, healthbar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			
			//energyhbar
			draw_sprite_ext(spr_energyBackground, 0, energybar_x, energybar_y, gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y, (energy / energy_max) * energybar_width, energybar_height);
			
			//keys
			if (has_bronze_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y, 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y, 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12, key_y, "x" + string(has_bronze_key));
			
			if (has_silver_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y, 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y, 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + key_spacer, key_y, "x" + string(has_silver_key));
			
			if (has_gold_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y, 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y, 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + (key_spacer * 2), key_y, "x" + string(has_gold_key));
		}
		
		// Player 2
		with (player2) {
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + character + "_" + skeleton_skin_get()), 0, gui_margin + (global.surface_width / 2), gui_margin, gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite_ext(spr_healthBackground, 0, healthbar_x + (global.surface_width / 2), healthbar_y, gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x + (global.surface_width / 2), healthbar_y, (hp / hp_max) * healthbar_width, healthbar_height);	
			draw_sprite_ext(spr_healthBorder, 0, healthbar_x + (global.surface_width / 2), healthbar_y, gui_zoom, gui_zoom, 0, c_white, 1);
			
			//energyhbar
			draw_sprite_ext(spr_energyBackground, 0, energybar_x + (global.surface_width / 2), energybar_y, gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x + (global.surface_width / 2), energybar_y, (energy / energy_max) * energybar_width, energybar_height);
			
			//keys
			if (has_bronze_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_brass_key, 0, key_x + (global.surface_width / 2), key_y, 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_brass_key, 0, key_x + (global.surface_width / 2), key_y, 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + (global.surface_width / 2), key_y, "x" + string(has_bronze_key));
			
			if (has_silver_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer + (global.surface_width / 2), key_y, 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer + (global.surface_width / 2), key_y, 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + key_spacer + (global.surface_width / 2), key_y, "x" + string(has_silver_key));
			
			if (has_gold_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2) + (global.surface_width / 2), key_y, 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2) + (global.surface_width / 2), key_y, 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + (key_spacer * 2) + (global.surface_width / 2), key_y, "x" + string(player2.has_gold_key));
		}
		
		// Player 3
		with (player3) {
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + character + "_" + skeleton_skin_get()), 0, gui_margin, gui_margin + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite_ext(spr_healthBackground, 0, healthbar_x, healthbar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x, healthbar_y + (global.surface_height / 2), (hp / hp_max) * healthbar_width, healthbar_height);	
			draw_sprite_ext(spr_healthBorder, 0, healthbar_x, healthbar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			
			//energyhbar
			draw_sprite_ext(spr_energyBackground, 0, energybar_x, energybar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x, energybar_y + (global.surface_height / 2), (energy / energy_max) * energybar_width, energybar_height);
			
			//keys
			if (has_bronze_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_brass_key, 0, key_x, key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12, key_y + (global.surface_height / 2), "x" + string(has_bronze_key));
			
			if (has_silver_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer, key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + key_spacer, key_y + (global.surface_height / 2), "x" + string(has_silver_key));
			
			if (has_gold_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + (key_spacer * 2), key_y + (global.surface_height / 2), "x" + string(has_gold_key));
			}
		
		// Player 4
		with (player4) {
			
			//Portrait
			draw_sprite_ext(asset_get_index("spr_portrait_" + character + "_" + skeleton_skin_get()), 0, gui_margin + (global.surface_width / 2), gui_margin + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1 );
			
			//healthbar
			draw_sprite_ext(spr_healthBackground, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_healthBar, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2), (hp / hp_max) * healthbar_width, healthbar_height);	
			draw_sprite_ext(spr_healthBorder, 0, healthbar_x + (global.surface_width / 2), healthbar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			
			//energyhbar
			draw_sprite_ext(spr_energyBackground, 0, energybar_x + (global.surface_width / 2), energybar_y + (global.surface_height / 2), gui_zoom, gui_zoom, 0, c_white, 1);
			draw_sprite_stretched(spr_energyBar, 0, energybar_x + (global.surface_width / 2), energybar_y + (global.surface_height / 2), (energy / energy_max) * energybar_width, energybar_height);
			
			//keys
			if (has_bronze_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_brass_key, 0, key_x + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_brass_key, 0, key_x + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + (global.surface_width / 2), key_y + (global.surface_height / 2), "x" + string(has_bronze_key));
			
			if (has_silver_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + key_spacer + (global.surface_width / 2), key_y + (global.surface_height / 2), "x" + string(has_silver_key));
			
			if (has_gold_key < 1) {
				// semi opacity
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2) + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, .4);
			} else {
				draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2) + (global.surface_width / 2), key_y + (global.surface_height / 2), 1, 1, 135, c_white, 1);
			}
			draw_text(key_x + 12 + (key_spacer * 2) + (global.surface_width / 2), key_y + (global.surface_height / 2), "x" + string(has_gold_key));
		}
		
	}
}