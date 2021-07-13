/// @desc Die
visible = false;

// Create explosion
instance_create_layer(x, y, "Layer_Player", obj_explosion);

// move away from screen
x = -1000;
y = -1000;
obj_player.homing = false;