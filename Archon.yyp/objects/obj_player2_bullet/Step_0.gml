if (obj_player2.homing) {
    dir = point_direction(x, y, obj_player1.x, obj_player1.y);
    image_angle = dir;
}
event_inherited();

