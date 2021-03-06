// flash red when taking damage
if hurt {
    flash_counter++;
    var flash_on_time = 8; // how long the sprite will stay red
    if flash_counter < flash_on_time {
		if os_browser == browser_not_a_browser {
	        // flash white
	        gpu_set_fog(true, c_white, 0, 0);
	        draw_self();
	        gpu_set_fog(false, c_white, 0, 0);
		} else {
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_maroon, image_alpha) 
		}
     } else {
        draw_self();
        if flash_counter > flash_on_time * 2 {
            flash_counter = 0;
        }
    }
} else {
    draw_self();
}

if have_special {
    repeat(3) {
        effect_create_below(ef_star, xprevious - 32 + random(64), yprevious - 32 + random(64), 0, c_yellow);
    }   
}