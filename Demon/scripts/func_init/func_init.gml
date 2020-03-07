/// Initializes game variables

enum game_state {
	player_moving,
	enemy_moving,
	input_ready
};

global.step_size = 64;
global.map = mp_grid_create(0,
							0, 
							room_width / global.step_size,
							room_height / global.step_size,
							global.step_size,
							global.step_size);
global.game_state = game_state.input_ready;
global.movement_speed = 1;

math_set_epsilon(0.03);