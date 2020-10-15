/// @description Insert description here
// You can write your code in this editor
var portrait_by_line = 0;

for (i = 0; i < menu_items; i ++) {	
		
	if (portrait_by_line == menu_columns) {
		portrait_by_line = 0;
	}
	 
 draw_sprite(asset_get_index("spr_portrait_" + menu[i]), 0, x + (portrait_size * portrait_by_line), y + portrait_size * (floor(i / menu_columns)));
 portrait_by_line ++;
}