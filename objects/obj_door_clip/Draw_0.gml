/// @description Insert description here
// You can write your code in this editor

clip_width = 30;
clip_height = 20;
clip_x = x;
clip_y = y;

// create a surface if it doesn't exist:
if (!surface_exists(clip_surface)) {
    clip_surface = surface_create(clip_width, clip_height);
}
// clear and start drawing to surface:
surface_set_target(clip_surface);
draw_clear_alpha(c_black, 0);
// draw things here, subtracting (clip_x, clip_y) from coordinates:
draw_circle(x - clip_x, mouse_y - clip_y, 40, false);
// finish and draw the surface itself:
surface_reset_target();
draw_surface(clip_surface, clip_x, clip_y);














