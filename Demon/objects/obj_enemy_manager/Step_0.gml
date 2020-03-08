/// @description Insert description here
// You can write your code in this editor
var enemies_moving = false;

if global.game_state == game_state.enemy_moving {
	with(obj_enemy) {
		if calculate && !func_adjacent(self) {
			current_path = func_calculate_path_to_player(self, obj_player);
			calculate = false;
			enemies_moving = true;
			var current_node = current_path[| 1];
			xx = current_node[? "x"];
			yy = current_node[? "y"];
		}
		else if func_adjacent(self) {
			func_deal_damage(self, obj_player);
		}
		else if abs(xx - x) > 0.1 || abs(yy - y) > 0.1 {
			if place_empty(xx, yy) {
				func_move_agent(self, xx, yy);
				enemies_moving = true;	
			}	
		}
	}
}

if enemies_moving == false && global.game_state == game_state.enemy_moving {
	with(obj_enemy) {
		calculate = true;
		x = xx;
		y = yy;
	}
	global.game_state = game_state.input_ready;	
}
