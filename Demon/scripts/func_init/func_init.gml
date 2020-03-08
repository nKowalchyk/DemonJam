/// Initializes game variables

enum game_state {
	player_moving,
	enemy_moving,
	input_ready
};

global.step_size = 64;
global.game_state = game_state.input_ready;
global.movement_speed = 0.25;

math_set_epsilon(0.03);