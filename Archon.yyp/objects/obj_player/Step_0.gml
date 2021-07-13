if(global.in_battle)
{
    // Count down cooldown
	if(cooldown_counter > 0) cooldown_counter--;
	
    // Count down confuse
    if(confuse_counter > 0) confuse_counter--;

    // Count down fire damage
	if(fire_damage_counter > 0) {
		fire_damage_counter--;
	
		if(fire_damage_counter % fire_damage_steps == 0) {
			hitpoint -= fire_damage;
            if hitpoint < 0 hitpoint = 0;
			if(hitpoint <= 0) {
				event_user(EVT_DIE);
			} else{
				event_user(EVT_DAMAGE);
			}
		}
	}

    hsp += player_speed * (global.player_right[player_no] - global.player_left[player_no]);
    vsp += player_speed * (global.player_down[player_no] - global.player_up[player_no]);
    
    // drag
    hsp = lerp(hsp, 0, drag);
    vsp = lerp(vsp, 0, drag);
    
    // stop
    if abs(hsp) <= 0.1 hsp = 0;
    if abs(vsp) <= 0.1 vsp = 0;
    
    // limit speed
    hsp = sign(hsp) * min(abs(hsp), player_speed);
    vsp = sign(vsp) * min(abs(vsp), player_speed);
    
	var xspeed = hsp;
	var yspeed = vsp;
	var fire = global.player_fire[player_no];

    // Reverse direction when confused
	if(confuse_counter > 0) {
		xspeed = -xspeed;
		yspeed = -yspeed;
	}
    
    // check if we hit melee
    if object_is_ancestor(object_index, obj_player1) {
        var enemy = instance_position(x + xspeed, y + yspeed, obj_player2);
    } else {
        var enemy = instance_position(x + xspeed, y + yspeed, obj_player1);   
    }
    if enemy != noone {
        // enemy attacks us
        if enemy.attack {
            with (enemy) {
                melee_hit();
            }
        }
            
        // we attacks enemy
        if attack {
            with (enemy) {
                with (other) {
                    melee_hit();
                }
            }
        }
    }

    // check collision
	if(xspeed != 0 || yspeed != 0) {
		var old_sprite = sprite_index;
        var old_image_index = image_index;
		var old_xscale = image_xscale;

        var new_x = x;
        var new_y = y;
       
        // set direction
        new_x += xspeed;
        new_y += yspeed;
        
        // Setting sprite based on direction
        if (abs(xspeed) > abs(yspeed)) {
            if (xspeed > 0) {
                // right
                if (sprite_index != sprite_h) or (image_xscale != 1) {
                    sprite_index = sprite_h;
                    image_index = 0;
                
			        image_xscale = 1;
                }
            } else if (xspeed < 0) {
                // left
                if (sprite_index != sprite_h) or (image_xscale != -1) {
                    sprite_index = sprite_h;
                    image_index = 0;
		
			        image_xscale = -1;
                }
            }
        } else if (abs(xspeed) < abs(yspeed)) {
            if (yspeed > 0) {
                // down
                if (sprite_index != sprite_d) {
                	sprite_index = sprite_d;
                    image_index = 0;
		
			        image_xscale = 1;
                }
            } else if (yspeed < 0) {
                if (sprite_index != sprite_u) {
                    sprite_index = sprite_u;
                    image_index = 0;
		
			        image_xscale = 1;
                }
            }
        }
        
        // Check collition with bushes and player
		if(new_x < 64 || new_y < 1080+64 || new_x > 1920-64 || new_y > 1080+1080 - 64 || 
            place_meeting(new_x, new_y, obj_bush) || enemy != noone)
		{
            // Collision reverting change
			sprite_index = old_sprite;
            image_index = old_image_index;
			image_xscale = old_xscale;
                
            // Stopping
            hsp = 0;
            vsp = 0;
		} else {
            x = new_x;
            y = new_y;
            
            // Setting new bullet direction
            if confuse_counter > 0 dir = point_direction(0, 0, -hsp, -vsp);
            else dir = point_direction(0, 0, hsp, vsp);            
        }
    }

	if(fire) {
		if(cooldown_counter <= 0){
			cooldown_counter = cooldown;
			event_user(EVT_FIRE);
		}
	}
}

else
{
    // Board
    
	if(obj_b_controller.player_x[player_no] == pos_x && obj_b_controller.player_y[player_no] == pos_y && player_no == obj_b_controller.player_turn) {
		// animate when cursor is over 
        image_speed = 1;
	} else {
        // stop animating
		image_index = 0;
		image_speed = 0;
	}
}