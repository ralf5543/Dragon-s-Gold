/// @description draw portraits sprites

var portrait_by_line = 0;

for (i = 0; i < selectClass_items; i ++) {	
		
	if (portrait_by_line == selectClass_columns) {
		portrait_by_line = 0;
	}
	 
 draw_sprite(asset_get_index("spr_portrait_" + selectClass[i]), 0, x + (portrait_size * portrait_by_line), y + portrait_size * (floor(i / selectClass_columns)));
 portrait_by_line ++;
}