/// @description Update
// I can write my code in the editor

if global.game_state == game_state.input_ready {

	if keyboard_check_pressed(vk_left) {
		xx = x - global.step_size;
	}
	else if keyboard_check_pressed(vk_right) {
		xx = x + global.step_size;
	}
	else if keyboard_check_pressed(vk_up) {
		yy = y - global.step_size;
	}
	else if keyboard_check_pressed(vk_down) {
		yy = y + global.step_size;
	}
	
	if xx != x || yy != y {
		global.game_state = game_state.player_moving;
	}
}

if global.game_state == game_state.player_moving {
	func_move_agent(self, xx, yy);
	if x == xx && y == yy {
		global.game_state = game_state.enemy_moving;	
	}
}