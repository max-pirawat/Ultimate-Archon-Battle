if (obj_player1.homing && obj_player2.visible) {
    dir = point_direction(x, y, obj_player2.x, obj_player2.y);
    image_angle = dir;
}
event_inherited();