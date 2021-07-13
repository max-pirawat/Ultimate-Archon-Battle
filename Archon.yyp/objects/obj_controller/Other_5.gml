// Going back to board

// Stop animating all players
with(obj_player) {
    image_speed = 0;
}

// Player 1 facing right
with(obj_player1) {
    sprite_index = sprite_h;
    image_index = 0;
    image_xscale = 1;
}

// Player 2 facing left
with(obj_player2) {
    sprite_index = sprite_h;
    image_index = 0;
    image_xscale = -1;
}