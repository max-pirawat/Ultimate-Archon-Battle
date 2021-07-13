global.in_battle = true;

// Putting player1 in battle field
with(obj_player1) {
    x = 224;
    y = 544+1080;
    
    // Setting direction
    dir_x = 1;
    dir_y = 0;
    dir = point_direction(0, 0, dir_x, dir_y);
    
    // Stopping 
    hsp = 0;
    vsp = 0;
}

with(obj_player2) {
    x = 1920-224;
    y = 544+1080;

    // Setting direction
    dir_x = -1;
    dir_y = 0;
    dir = point_direction(0, 0, dir_x, dir_y);
    
    // Stopping
    hsp = 0;
    vsp = 0;
}

// Start animating all players
with(obj_player) image_speed = 1;
