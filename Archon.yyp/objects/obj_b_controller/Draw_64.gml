
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var p = obj_frame_yellow.player;
if (p != noone && instance_exists(p))
{
    draw_set_font(font_name);
    draw_text(265, 46, p.name);
    draw_set_font(font_small);
    draw_text(295, 131, string(p.hitpoint) + "/" + string(p.max_hitpoint));
    draw_text(300, 172, string(p.bullet));
    draw_text(323, 210, string(p.moves));
    draw_text_ext(44, 280, p.desc, 20, 340);
}
p = obj_frame_purple.player;
if (p != noone && instance_exists(p))
{
    draw_set_font(font_name);
    draw_text(1745, 46, p.name);
    draw_set_font(font_small);
    draw_text(1771, 131, string(p.hitpoint) + "/" + string(p.max_hitpoint));
    draw_text(1778, 172, string(p.bullet));
    draw_text(1801, 210, string(p.moves));
    draw_text_ext(1528, 280, p.desc, 20, 340);
}

if (global.victory != "")
{
    counter++;
    
    draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	draw_set_font(font_victory);
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    draw_roundrect_colour(0, gh/2 - 60, gw, gh/2 + 60, c_white, c_gray, false);
	draw_text_colour(gw/2, gh/2, global.victory, c_aqua, c_blue, c_teal, c_navy, 1);
}