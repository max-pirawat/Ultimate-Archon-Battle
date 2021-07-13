// Avoid accidental fire when moving to battle room
cooldown_counter = room_speed; 
fire_damage_counter = 0;
confuse_counter = 0;
hurt = false;
homing = false;

// Stop having special ability
event_user(EVT_END_SPECIAL);