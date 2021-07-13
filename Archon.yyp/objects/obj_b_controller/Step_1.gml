if(!player1_controller || !gamepad_is_connected(0))
{
	global.player_up[0] = keyboard_check_pressed(ord("W"));
	global.player_down[0] = keyboard_check_pressed(ord("S"));
	global.player_left[0] = keyboard_check_pressed(ord("A"));
	global.player_right[0] = keyboard_check_pressed(ord("D"));
	global.player_fire[0] = keyboard_check_pressed(vk_space);
}

else
{
	global.player_up[0] = gamepad_axis_value(0, gp_axislv) < -0.3;
	global.player_down[0] = gamepad_axis_value(0, gp_axislv) > 0.3;
	global.player_left[0] = gamepad_axis_value(0, gp_axislh) < -0.3;
	global.player_right[0] = gamepad_axis_value(0, gp_axislh) > 0.3;
	global.player_fire[0] = gamepad_button_check_pressed(0, gp_face1);
}

if(!player2_controller || !gamepad_is_connected(0))
{
	global.player_up[1] = keyboard_check_pressed(vk_up);
	global.player_down[1] = keyboard_check_pressed(vk_down);
	global.player_left[1] = keyboard_check_pressed(vk_left);
	global.player_right[1] = keyboard_check_pressed(vk_right);
	global.player_fire[1] = keyboard_check_pressed(vk_enter);
}

else
{
	global.player_up[1] = gamepad_axis_value(0, gp_axislv) < -0.3;
	global.player_down[1] = gamepad_axis_value(0, gp_axislv) > 0.3;
	global.player_left[1] = gamepad_axis_value(0, gp_axislh) < -0.3;
	global.player_right[1] = gamepad_axis_value(0, gp_axislh) > 0.3;
	global.player_fire[1] = gamepad_button_check_pressed(0, gp_face1);
}