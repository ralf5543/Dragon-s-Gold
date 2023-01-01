// @desc DrawSetText(colour, font, halign, valign)

// @arg colour
// @arg font
// @arg halign
// @arg valign

// Allows one line setup for major text drawing vars.
// Requiring all four prevent silly coders from forgetting one.
// And therefor creating a dumb dependency on other event calls.


function DrawSetText(argument0, argument1, argument2, argument3){
	draw_set_color(argument0);
	draw_set_font(argument1);
	draw_set_halign(argument2);
	draw_set_valign(argument3);
}

