
// Set max HP
max_hitpoint = hitpoint;

// Firing
cooldown_counter = 0;   // Fire cooldown
orig_cooldown = cooldown; // Save orig cooldown
have_special = false;   // Whether this player still special ability
special_time = room_speed * 10;
fire_damage = 0;        
fire_damage_steps = 0;
fire_damage_counter = 0;
confuse_counter = 0;

hsp = 0; // horizontal speed
vsp = 0; // vertical speed
drag = .12; // slow down

// taking damage?
hurt = false; 
hurt_time = room_speed * .5;
flash_counter = 0;

// melee attack
attack = false;
damage = 10;

if (global.in_battle) {
	if(dir_x < 0) image_xscale = -1;
} else {
	pos_x = (x-512)/128;
	pos_y = (y-96)/128;

	image_speed = 0;
}
