function bullet_hit() {
	// Self = bullet other = player hit

	// If the player is hurting, it is briefly invincible
	if !other.hurt {
        if (damage < other.hitpoint) {
	        other.hitpoint -= damage;
            audio_play_sound(sfx_sounds_damage1, 0, 0);

	    	with(other) {
	    	    event_user(EVT_DAMAGE);
	    	}
        } else {
            other.hitpoint = 0;
         	audio_play_sound(sfx_exp_cluster2, 0, 0);
	    	with(other) {
	    	    event_user(EVT_DIE);
	    	}   
        }
	}

	// Destroy bullet
	instance_destroy();
}
