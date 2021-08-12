if os_browser != browser_not_a_browser {
	var BASE_WIDTH = 1920
	var BASE_HEIGHT = 1080
	var b_width = browser_width
	var b_height = browser_height
	var aspect = BASE_WIDTH/BASE_HEIGHT
	if b_width < b_height {
		b_height =  b_width/aspect
	} else {
		b_width = b_height * aspect
	}
	display_set_gui_size(b_width, b_height);
	var x_scale = BASE_WIDTH/b_width
	var y_scale = BASE_HEIGHT/b_height
} else {
	var x_scale = 1
	var y_scale = 1
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);

var p = obj_frame_yellow.player;
if (p != noone && instance_exists(p))
{
    draw_set_font(font_name);
	draw_text_colour(267/x_scale, 48/y_scale, p.name, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text(265/x_scale, 46/y_scale, p.name);
    draw_set_font(font_small);
    draw_text(295/x_scale, 131/y_scale, string(p.hitpoint) + "/" + string(p.max_hitpoint));
    draw_text(300/x_scale, 172/y_scale, string(p.bullet));
    draw_text(323/x_scale, 210/y_scale, string(p.moves));
    draw_text_ext(44/x_scale, 280/y_scale, p.desc, 20, 340/x_scale);
}
p = obj_frame_purple.player;
if (p != noone && instance_exists(p))
{
    draw_set_font(font_name);
	draw_text_colour(1747/x_scale, 48/y_scale, p.name, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text(1745/x_scale, 46/y_scale, p.name);
    draw_set_font(font_small);
    draw_text(1771/x_scale, 131/y_scale, string(p.hitpoint) + "/" + string(p.max_hitpoint));
    draw_text(1778/x_scale, 172/y_scale, string(p.bullet));
    draw_text(1801/x_scale, 210/y_scale, string(p.moves));
    draw_text_ext(1528/x_scale, 280/y_scale, p.desc, 20, 340/x_scale);
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