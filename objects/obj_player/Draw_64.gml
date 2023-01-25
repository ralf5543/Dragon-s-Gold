/// @description Healthbar

if (room  == rm_game) {
	
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
	
	dpad_width = 218 * gui_zoom;

				
			// black bars transition
			//if (is_taking_stairs == true) && (has_taken_stairs >= 60) {
			//	draw_set_color(c_black);
	
	
			//	//percent = percent + 0.1;
			//	draw_rectangle(0, 0, w, percent * h_half / 2, false);
			//	draw_rectangle(0, h_half, w, h_half - ( percent * (h_half/ 2)), false);
			//}
			
			
	//======================------------------------ Portrait
	draw_sprite_ext(asset_get_index("spr_portrait_" + character + "_" + skeleton_skin_get()), 0, gui_margin + player_split_x, gui_margin + player_split_y, gui_zoom, gui_zoom, 0, c_white, 1);

	//======================------------------------ Health bar
	draw_sprite_ext(spr_healthBackground, 0, healthbar_x + player_split_x, healthbar_y + player_split_y, 1 * gui_zoom, 1 * gui_zoom, 0, c_white, 1);
	draw_sprite_stretched(spr_healthBar, 0, healthbar_x + player_split_x, healthbar_y + player_split_y, (hp / hp_max) * healthbar_width, healthbar_height);
	draw_sprite_ext(spr_healthBorder, 0, healthbar_x + player_split_x, healthbar_y + player_split_y, 1 * gui_zoom, 1 * gui_zoom, 0, c_white, 1);
		
	//======================------------------------ Energy bar
	draw_sprite_ext(spr_energyBackground, 0, energybar_x + player_split_x, energybar_y + player_split_y, 1 * gui_zoom, 1 * gui_zoom, 0, c_white, 1);
	draw_sprite_stretched(spr_energyBar, 0, energybar_x + player_split_x, energybar_y + player_split_y, (energy / energy_max) * energybar_width, energybar_height);
		
	dpad_margin_x = ((dpad_width / 2) + player_split_x) + gui_margin;
	dpad_margin_y = ((player_split_y + player_split_height) - ((dpad_width / 2) + gui_margin));
	
	//======================------------------------ Equipment
	draw_sprite_ext(spr_dpad, 0, dpad_margin_x, dpad_margin_y, gui_zoom, gui_zoom, 0, c_white, 0.5);
		
	
	function DisplayEquipment(argument) {
		if (argument == 0) {
			var pos_x = dpad_margin_x;
			var pos_y = dpad_margin_y - (dpad_width / 3);			
		} else if (argument == 1) {
			var pos_x = dpad_margin_x + (dpad_width / 3);
			var pos_y = dpad_margin_y;
		} else if (argument == 2) {
			var pos_x = dpad_margin_x;
			var pos_y = dpad_margin_y + (dpad_width / 3);
		} else if (argument == 3) {
			var pos_x = dpad_margin_x - (dpad_width / 3);	
			var pos_y = dpad_margin_y;
		}
			
		switch (EquipmentSlot[argument]) {
			//case EQUIPMENT_TYPE.POTION :
				
			//switch(EquipmentSlot[argument0].potion_type) {
			case "potion_health" : 
			draw_sprite_ext(spr_potion, 0, pos_x, pos_y, 1.5 * gui_zoom, 1.5 * gui_zoom, 0, c_white, 1);
			//show_debug_message("heakth")
			break;	
	
			case "potion_energy" : 
			draw_sprite_ext(spr_potion, 1, pos_x, pos_y, 1.5 * gui_zoom, 1.5 * gui_zoom, 0, c_white, 1);
			//show_debug_message("energy")
			break;	
	
			case "potion_invincibility" : 
			draw_sprite_ext(spr_potion, 2, pos_x, pos_y, 1.5 * gui_zoom, 1.5 * gui_zoom, 0, c_white, 1);
			//show_debug_message("invicinbility")
			break;	
	
			case "potion_poison" : 
			draw_sprite_ext(spr_potion, 3, pos_x, pos_y, 1.5 * gui_zoom, 1.5 * gui_zoom, 0, c_white, 1);
			//show_debug_message("poison")
			break;	

		}
	}		
		
	for (var i = 0; i < array_length(EquipmentSlot); i++;) {
		if (EquipmentSlot[i] != undefined) {
			DisplayEquipment(i);
		}
	}
	
	//======----- keys
		if (has_bronze_key < 1) {
			// semi opacity
			draw_sprite_ext(spr_brass_key, 0, key_x + player_split_x, key_y + player_split_y, gui_zoom, gui_zoom, 135, c_white, .4);
		} else {
			draw_sprite_ext(spr_brass_key, 0, key_x + player_split_x, key_y + player_split_y, gui_zoom, gui_zoom, 135, c_white, 1);
		}
		DrawSetText(c_white, fnt_size, fa_left, fa_bottom);
		draw_text(key_x + player_split_x, key_y + player_split_y + (32 * gui_zoom), "x" + string(has_bronze_key));
			
		if (has_silver_key < 1) {
			// semi opacity
			draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer + player_split_x, key_y + player_split_y, gui_zoom, gui_zoom, 135, c_white, .4);
		} else {
			draw_sprite_ext(spr_silver_key, 0, key_x + key_spacer + player_split_x, key_y + player_split_y, gui_zoom, gui_zoom, 135, c_white, 1);
		}
		draw_text(key_x + key_spacer + player_split_x, key_y + player_split_y + (32 * gui_zoom), "x" + string(has_silver_key));
			
		if (has_gold_key < 1) {
			// semi opacity
			draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2) + player_split_x, key_y + player_split_y, gui_zoom, gui_zoom, 135, c_white, .4);
		} else {
			draw_sprite_ext(spr_golden_key, 0, key_x + (key_spacer * 2) + player_split_x, key_y + player_split_y, gui_zoom, gui_zoom, 135, c_white, 1);
		}
		draw_text(key_x + (key_spacer * 2) + player_split_x, key_y + player_split_y + (32 * gui_zoom), "x" + string(has_gold_key));
		
		if (key_win_bronze) {
			draw_sprite_ext(spr_check, 0, key_x + player_split_x, key_y + player_split_y, gui_zoom, gui_zoom, 0, c_white, 1);
		}
		
		if (key_win_silver) {
			draw_sprite_ext(spr_check, 0, key_x + key_spacer + player_split_x, key_y + player_split_y, gui_zoom, gui_zoom, 0, c_white, 1);
		}
		
		if (key_win_gold) {
			draw_sprite_ext(spr_check, 0, key_x + (key_spacer * 2) + player_split_x, key_y + player_split_y, gui_zoom, gui_zoom, 0, c_white, 1);
		}

	
	//=================================----------------------------------- 1 player only
	if (obj_control.start_players == 1) {
		gui_zoom = 1;// make gui smaller for split screen
		player_split_x = 0;
		player_split_y = 0;
		player_split_width = global.surface_width;
		player_split_height = global.surface_height;
		fnt_size = fnt_14;
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
		
		fnt_size = fnt_12;
			
				
		// =======-------- Player 1
		with (player1) {
			
			player_split_x = 0;
			player_split_y = 0;
			player_split_width = global.surface_width;
			player_split_height = (global.surface_height / 2);
		}
			
		// =======-------- Player 2
		with (player2) {
			player_split_x = 0;
			player_split_y = (global.surface_height / 2);
			player_split_width = global.surface_width;
			player_split_height = (global.surface_height / 2);
			DrawSetText(c_white, fnt_10, fa_center, fa_bottom);
		}

		
	//=================================----------------------------------- 3 players
	} else if (obj_control.start_players == 3) {
		
		//=====----- Player 1
		with (player1) {
			gui_zoom = .75;
			player_split_x = 0;
			player_split_y = 0;
			player_split_width = global.surface_width;
			player_split_height = (global.surface_height / 2);
			
			fnt_size = fnt_12;
			
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
			
			fnt_size = fnt_12;
				
		//=====----- Player 2
		}
		with (player2) {

			gui_zoom = .5;
			player_split_x = 0;
			player_split_y = (global.surface_height / 2);
			player_split_width = (global.surface_width / 2);
			player_split_height = (global.surface_height / 2);
			
			fnt_size = fnt_10;
			
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
			
			fnt_size = fnt_10;
			
		//=====----- Player 3
		}
			
		with (player3) {

			gui_zoom = .5;
			player_split_x = (global.surface_width / 2);
			player_split_y = (global.surface_height / 2);
			player_split_width = (global.surface_width / 2);
			player_split_height = (global.surface_height / 2);
			
			fnt_size = fnt_10;
			
			portrait_width = 128 * gui_zoom;
			gui_margin = 20 * gui_zoom;
		
			healthbar_x = portrait_width + (gui_margin * 2);
			healthbar_y = gui_margin;
		
			energybar_x = portrait_width + (gui_margin * 2);
			energybar_y = (gui_margin * 2) + healthbar_height;
		
			key_x = portrait_width + (gui_margin * 3);
			key_y = (gui_margin * 4) + healthbar_height + energybar_height;
			key_spacer = (gui_margin * 4);
			
			
		draw_set_font(fnt_14);
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
		
		fnt_size = fnt_10;
			
		// Player 1
		with (player1) {
			player_split_x = 0;
			player_split_y = 0;
			player_split_width = (global.surface_width / 2);
			player_split_height = (global.surface_height / 2);
		}
		
		// Player 2
		with (player2) {
			player_split_x = (global.surface_width / 2);
			player_split_y = 0;
			player_split_width = (global.surface_width / 2);
			player_split_height = (global.surface_height / 2);
		}
		
		// Player 3
		with (player3) {
			player_split_x = 0;
			player_split_y = (global.surface_height / 2);
			player_split_width = (global.surface_width / 2);
			player_split_height = (global.surface_height / 2);
		}
		
		// Player 4
		with (player4) {
			player_split_x = (global.surface_width / 2);
			player_split_y = (global.surface_height / 2);
			player_split_width = (global.surface_width / 2);
			player_split_height = (global.surface_height / 2);
		}
		
	}
}