/// @description Insert description here
// You can write your code in this editor
for (i = 0; i < menu_items; i ++) {
	var xx = 0;
	
	//line break every 3 portraits
	if (i mod 3 == 0) || (i == 0) {
		xx = 0;
	 } else if ((i + 2) mod 3 == 0) || (i == 1) {
		xx = portrait_size;
	 } else  {
		 xx = portrait_size * 2;
	 }
	 
	 //every 3 potraits, create a new line bellow
	 
 draw_sprite(asset_get_index("spr_portrait_" + menu[i]), 0, x + xx, y + portrait_size * (floor(i / 3)));
 
}