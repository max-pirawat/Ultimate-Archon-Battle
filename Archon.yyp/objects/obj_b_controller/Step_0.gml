if (global.victory != "") {
    return;
}

if (!instance_exists(obj_player1) || !instance_exists(obj_player2)) {
    if (!instance_exists(obj_player1) && !instance_exists(obj_player2))
    {
        global.victory = "Draw!!!";
    }
    else if (!instance_exists(obj_player1))
    {
        global.victory = "Purple wins!!!";
    }
    else if (!instance_exists(obj_player2))
    {
        global.victory = "Yellow wins!!!";
    }
    alarm[ALRM_RESTART] = room_speed * 5;
    return;
}

if(player_turn == 0)
{
	var cursor = obj_b_cursor1;
}

else
{
	var cursor = obj_b_cursor2;
}

var dir_x = global.player_right[player_turn]-global.player_left[player_turn];
var dir_y = global.player_down[player_turn]-global.player_up[player_turn];

if(dir_x != 0 || dir_y != 0)
{
	if(selected_player)
	{
		audio_play_sound(sfx_movement_footstepsloop4_fast, 0, 0);
	}

	else
	{
		audio_play_sound(sfx_menu_move2, 0, 0);
	}
}

var can_move = true;
var dy = 0;
var dx = 0;

if (dir_y < 0) {
    dy = -1;   
} else if (dir_y > 0) {
    dy = 1;
}

if (dir_x < 0) {
    dx = -1   
} else if (dir_x > 0) {
    dx = 1
}

var new_x = player_x[player_turn] + dx;
var new_y = player_y[player_turn] + dy;

if (dx != 0 || dy != 0) {
    // check if new position is within board
    if (new_x < 0 || new_x >= 8 || new_y < 0 || new_y >= 8) {
        can_move = false;   
    }

    if (can_move && (selected_player != noone)) {
        if (selected_player.walk) {
           var piece2 = board[player_y[player_turn], player_x[player_turn]];
           // Cannot move out if ther player is over enemy
           if (piece2 != noone && instance_exists(piece2) && piece2.player_no == (1 - player_turn)) {
                can_move = false;
           } else {
               if (moves <= 0) {
                    can_move = false;   
               } else {
                   var piece = board[new_y, new_x];
                    if (piece != noone && instance_exists(piece) && (piece.player_no == player_turn)) {
                        can_move = false;
                    }
               }
           }
        } else {
            if (abs(selected_player_x - new_x) + abs(selected_player_y - new_y) > moves) {
                can_move = false;   
            }
        }
    }

    if (can_move) {
        player_x[player_turn] = new_x;
        player_y[player_turn] = new_y;

    	with(cursor) {
    	x += 128 * dx;
    	y += 128 * dy;
    	}

    	if(selected_player != noone)
    	{
            selected_player.pos_x += dx;
    		selected_player.pos_y += dy;
            if (selected_player.walk) {
                   moves -= 1;
            }
	
    		with(selected_player) {
    		x += 128 * dx;
    		y += 128 * dy;
    		}
    	}
    }

    // update frame 
    if (selected_player == noone)
    {
        var piece = board[player_y[player_turn], player_x[player_turn]];
         if(piece != noone && instance_exists(piece) && piece.player_no == player_turn)
         {
        	if (player_turn == 0)
            {
                set_yellow_frame(piece);
            } 
            else
            {
                set_purple_frame(piece)
            }
        }  
    }
}

// process select
if(global.player_fire[player_turn])
{
	if(selected_player == noone)
	{
		if(board[player_y[player_turn],player_x[player_turn]] != noone && board[player_y[player_turn],player_x[player_turn]].player_no == player_turn)
		{
			selected_player = board[player_y[player_turn], player_x[player_turn]];
		
			if(selected_player != noone)
			{
				selected_player_x = selected_player.pos_x;
				selected_player_y = selected_player.pos_y;
                moves = selected_player.moves;
			
				cursor.visible = false;
			}
		}
	}

	else
	{
		if(board[player_y[player_turn], player_x[player_turn]] == noone || 
            ((selected_player_x == player_x[player_turn]) && (selected_player_y == player_y[player_turn])))
		{
			board[selected_player_y, selected_player_x] = noone;
		
			board[player_y[player_turn], player_x[player_turn]] = selected_player;
		
			selected_player = noone;
		
			cursor.visible = true;
		
			player_turn = 1-player_turn;
		
			if(player_turn == 0)
			{
				obj_b_cursor1.visible = true;
				obj_b_cursor2.visible = false;
			}
		
			else
			{
				obj_b_cursor1.visible = false;
				obj_b_cursor2.visible = true;
			}
		}
	
		else
		{
            var player = board[player_y[player_turn],player_x[player_turn]];
			if(instance_exists(player) && (player_turn == 1-player.player_no))
			{
				fighting_player[player_turn] = selected_player;
				fighting_player[1-player_turn] = board[player_y[player_turn], player_x[player_turn]];
			
				cursor.visible = true;
			
				with(selected_player) {
				persistent = true;
				}
			
				with(board[player_y[player_turn],player_x[player_turn]]) {
				persistent = true;
				}
			
				selected_player = noone;
			
				room_goto(rm_battle);
			}
		}
	}
}