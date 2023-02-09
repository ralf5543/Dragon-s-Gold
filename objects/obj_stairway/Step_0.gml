/// @description Direction written

if (stairway_floor == "roof") {
	image_index = 0;
	text_floor = "descendre";
	text_direction = "BAS";
} else if (stairway_floor == "middle") {
	text_floor = "monter ou descendre";
	text_direction = "HAUT ou BAS";
	image_index = 1;
} else {
	image_index = 2;
	text_floor = "monter";
	text_direction = "HAUT";
}

text = "Appuyez sur \n" + string(text_direction) + " pour \n" + string(text_floor);

if (point_in_circle(obj_player.x, obj_player.y, x, y, 64)) && (!instance_exists(obj_text)) && (help_readen = false) {
	var stairsText = instance_create_layer(x, y - 96, "layer_tooltips", obj_text);
	with (stairsText) {
		text = other.text;
		length = string_length(text);
	}
	
	help_readen = true;
}
