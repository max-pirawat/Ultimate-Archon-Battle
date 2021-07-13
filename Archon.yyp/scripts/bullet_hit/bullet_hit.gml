function bullet_hit() {
	// Self = bullet other = player hit

	// If the player is hurting, it is briefly invincible
	if !other.hurt {
	    other.hitpoint -= damage;
	    if(other.hitpoint <= 0) {
	        other.hitpoint = 0;
	    	audio_play_sound(sfx_exp_cluster2, 0, 0);
	    	with(other) {
	    	    event_user(EVT_DIE);
	    	}
	    } else {
	    	audio_play_sound(sfx_sounds_damage1, 0, 0);

	    	with(other) {
	    	    event_user(EVT_DAMAGE);
	    	}
	    }
	}

	// Destroy bullet
	instance_destroy();
}
