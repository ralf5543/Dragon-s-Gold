/// @description Split screens separators

if (playerCount > 1) {
    draw_rectangle_color(0, (room_height / 2) - 4, room_width, (room_height / 2) + 4, c_black, c_black, c_black, c_black, false);
}


if (playerCount > 2) {
    draw_rectangle_color((room_width / 2) - 4, room_height / 2, (room_width / 2) + 4, room_height, c_black, c_black, c_black, c_black, false);
}


if (playerCount > 3) {
    draw_rectangle_color((room_width / 2) - 4, 0, (room_width / 2) + 4, room_height / 2, c_black, c_black, c_black, c_black, false);
}
