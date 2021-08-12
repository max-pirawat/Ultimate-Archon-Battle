/// @desc Die
visible = false;

// Create explosion
instance_create_layer(x, y, "Layer_Player", obj_explosion);

// move away from screen
obj_player.homing = false;
x = -1000;
y = -1000;
