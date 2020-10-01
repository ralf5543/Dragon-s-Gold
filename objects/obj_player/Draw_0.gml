/// @description Insert description here
// You can write your code in this editor
draw_self();// default draw, needed if draw event exists

draw_set_color(c_black);
draw_text(x - 10, y - 70, "Player " + string(pad_num + 1));
draw_text(x - 10, y - 50, "Classe " + string(character));
