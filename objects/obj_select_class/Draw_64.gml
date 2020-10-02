/// @description Insert description here
// You can write your code in this editor

//choose font to use
draw_set_font(fnt_menu);

//chose horizontal and vertical alignment
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);


for (i = 0; i < menu_items; i ++) {
    var offset = 2;
	var txt = menu[i];
	
	//if the item drawn in the one we have selected
	if (menu_cursor == i) {
		//inserts text at beginning (0) of the string "txt"
	    txt = string_insert("> ", txt, 0);
		var col = c_white;
	} else {
		var col = c_gray;
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
