/// @description Temp debugging infos

draw_self();

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(x - 10, y - 50, "Cle bronze ? " + string(has_bronze_key));
draw_text(x - 10, y - 70, "Cle argent ? " + string(has_silver_key));
draw_text(x - 10, y - 90, "Cle doree ? " + string(has_gold_key));