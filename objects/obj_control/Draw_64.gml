/// @description Pause Surface

if (room  == rm_game) {
	//draw_text(room_width / 2, 50, "Nombre de salles ROOF " + string(halls_roof_list_size));
	//draw_text(room_width / 2, 75, "Nombre de salles MIDDLE " + string(halls_middle_list_size));
	//draw_text(room_width / 2, 100, "Nombre de salles GROUND " + string(halls_ground_list_size));
	
	if paused == true {
		
		if !surface_exists(paused_surf) {
			
			if paused_surf == -1 {
				instance_deactivate_all(true);
			}
			
		    paused_surf = surface_create(global.surface_width, global.surface_height);
		    surface_set_target(paused_surf);
		    draw_surface(application_surface, 0, 0);
		    surface_reset_target();
		
		} else {
		    draw_surface(paused_surf, 0, 0);
		    draw_set_alpha(0.5);
		    draw_rectangle_colour(0, 0, global.surface_width, global.surface_height, c_black, c_black, c_black, c_black, false);
		    draw_set_alpha(1);
		    draw_set_halign(fa_center);
		    draw_text_transformed_colour(global.surface_width / 2, global.surface_height / 2, "PAUSE", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
		    draw_set_halign(fa_left);
	    }
	}
}

//================--------------- MENU
draw_set_font(fnt_menu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i ++) {
    var offset  = 2;
    var txt = menu[i];
    
    if (menu_cursor == i) {
   	 txt = string_insert("> ", txt, 0);
   	 var col = c_white;
    } else {
   	 var col = c_grey;
    }
    
    var xx = menu_x;
    var yy = menu_y - (menu_itemheight * (i * 1.5));
    
    draw_set_color(c_black);
    draw_text(xx - offset, yy, txt);
    draw_text(xx + offset, yy, txt);
    draw_text(xx - offset, yy, txt);
    draw_text(xx + offset, yy, txt);
    
    draw_set_color(col);
    draw_text(xx, yy, txt);
};
