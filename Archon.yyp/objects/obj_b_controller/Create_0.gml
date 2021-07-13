player_x[0] = 0;
player_y[0] = 3;
player_x[1] = 7;
player_y[1] = 3;
player_turn = 0;
selected_player = noone;
fighting_player[0] = noone;
fighting_player[1] = noone;
counter = 0;

obj_b_cursor2.visible = false;

with(obj_player) {
pos_x = (x-512)/128;
pos_y = (y-96)/128;

}

for(var i = 0; i < 8; i += 1) {
	for(var j = 0; j < 8; j += 1) {
		board[i,j] = noone;
	}
}

for(var i = 0; i < instance_number(obj_player); i += 1) {
	var p = instance_find(obj_player, i);

	board[p.pos_y,p.pos_x] = p;
}

global.in_battle = false;
global.victory = "";

set_yellow_frame = function(piece) {
    if (piece == noone) {
        obj_frame_yellow.sprite_index = -1;
        obj_frame_yellow.player = noone;
        obj_move_yellow.sprite_index = -1;
    } else {
        obj_frame_yellow.sprite_index = piece.sprite_d;
        obj_frame_yellow.player = piece;
        if (piece.walk)
        {
            obj_move_yellow.sprite_index = spr_walk_icon;
        }
        else
        {
            obj_move_yellow.sprite_index = spr_fly_icon;
        }
    }
};

set_purple_frame = function(piece) {
    if (piece == noone) {
        obj_frame_purple.sprite_index = -1;
        obj_frame_purple.player = noone; 
        obj_move_purple.sprite_index = -1;
    } else {
        obj_frame_purple.sprite_index = piece.sprite_d;
        obj_frame_purple.player = piece;
        if (piece.walk)
        {
            obj_move_purple.sprite_index = spr_walk_icon;
        }
        else
        {
            obj_move_purple.sprite_index = spr_fly_icon;
        }
    }
}

init_frame = false;