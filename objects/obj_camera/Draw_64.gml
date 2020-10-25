/// @description Split screens separators

if (playerCount > 1) {
    draw_rectangle_color(0, (global.surface_height / 2) - 4, global.surface_width, (global.surface_height / 2) + 4, c_black, c_black, c_black, c_black, false);
}


if (playerCount > 2) {
    draw_rectangle_color((global.surface_width / 2) - 4, global.surface_height / 2, (global.surface_width / 2) + 4, global.surface_height, c_black, c_black, c_black, c_black, false);
}


if (playerCount > 3) {
    draw_rectangle_color((global.surface_width / 2) - 4, 0, (global.surface_width / 2) + 4, global.surface_height / 2, c_black, c_black, c_black, c_black, false);
}

