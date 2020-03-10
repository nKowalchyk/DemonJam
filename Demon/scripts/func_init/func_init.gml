/// Initializes game variables

enum game_state {
	player_moving,
	enemy_moving,
	input_ready
};

draw_set_font(-1)
draw_set_color(c_white)

global.step_size = 64;
global.game_state = game_state.input_ready;
global.movement_speed = 0.25;

math_set_epsilon(0.03);