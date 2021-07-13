global.in_battle = false;

if (!init_frame)
{
    init_frame = true;
    var piece = obj_hat;
    set_yellow_frame(piece);

    piece = obj_ducky;
    set_purple_frame(piece);
}

if(fighting_player[0] != noone)
{
	with(fighting_player[0]) {
	persistent = false;
	}

	with(fighting_player[1]) {
	persistent = false;
	}

	if(!(fighting_player[0].hitpoint > 0 && fighting_player[1].hitpoint > 0))
	{
		board[selected_player_y, selected_player_x] = noone;
        board[player_y[player_turn],player_x[player_turn]] = noone;
	
		for(var i = 0; i < 2; i += 1) {
			if(fighting_player[i].hitpoint > 0)
			{
				board[player_y[player_turn],player_x[player_turn]] = fighting_player[i];
			
				with(fighting_player[i]) {
				x = pos_x * 128 + 512 ;
				y = pos_y * 128 + 96;
				}
			}
		
			else
			{
				with(fighting_player[i]) {
                    instance_destroy();
                }
                if (i==0) {
                    set_yellow_frame(noone);                    
                } else {
                    set_purple_frame(noone);
                }
			}
		}
	}

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

	fighting_player[0] = noone;
	fighting_player[1] = noone;
}