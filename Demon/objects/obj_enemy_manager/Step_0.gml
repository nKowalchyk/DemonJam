/// @description Insert description here
// You can write your code in this editor
var enemies_moving = false;

if global.game_state == game_state.enemy_moving {
	with(obj_enemy) {
		func_move_agent(self, xx, yy);
		if x != xx || y != yy {
			enemies_moving = true;
		}
	}
}

if enemies_moving == false && global.game_state == game_state.enemy_moving {
	global.game_state = game_state.input_ready;	
}
