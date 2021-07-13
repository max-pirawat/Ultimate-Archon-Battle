display_set_gui_size(1920, 1080);

// Draw player1's HP
with (obj_player1) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(font_gui);

	draw_text(50, 50, name);
	draw_text(50, 100, "HP: " + string(hitpoint));
}

// Draw player2's HP
with (obj_player2) {
    draw_set_halign(fa_right);
	draw_set_valign(fa_top);

	draw_set_font(font_gui);
    var gw = display_get_gui_width();

	draw_text(gw - 50, 50, name);
	draw_text(gw - 50, 100, "HP: " + string(hitpoint));
}