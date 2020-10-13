/// @description Graphics for the class selector


for (i = 0; i < menu_items; i ++) {
	var portrait_size = 128;
	var xx = 0;
	
	if (i mod 3 == 0) {
		xx = 0
	 } else if ((i + 1) mod 3 == 0) {
		xx = portrait_size;
	 } else {
		 xx = portrait_size * 2;
	 }
	 
 draw_sprite(asset_get_index("spr_portrait_" + menu[i]), 0, x + xx, y + portrait_size * (floor(i / 3)));

}

draw_sprite(spr_cursor, 0, x, y);

//choose font to use
draw_set_font(fnt_menu);


for (i = 0; i < menu_items; i ++) {
    var offset = 2;
	var txt = menu[i];
	
	//if the item drawn in the one we have selected
	if (menu_cursor == i) {
		//inserts text at beginning (0) of the string "txt"
	    txt = string_insert("> ", txt, 0);
		var col = c_red;
	} else {
		var col = c_black;
	}
	
	var xx = menu_width;
	/* so for exemple, the second menu item, it will be positionned
	at its font_size * 1 (and again * by 1.5, to leave some space between items */
	var yy = menu_height - (menu_itemHeight * (i * 1.5));
	
	draw_set_color(c_black);
	
	/*draw_text(xx - offset, yy, txt);
	draw_text(xx + offset, yy, txt);
	draw_text(xx, yy - offset, txt);
	draw_text(xx, yy + offset, txt);*/
	
	draw_set_color(col);
	draw_text(600 + (600 * player_number), yy, txt);
}
