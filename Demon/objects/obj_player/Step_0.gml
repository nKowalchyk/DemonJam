/// @description Update
// I can write my code in the editor

right_hurt_box.x = x + global.step_size;
right_hurt_box.y = y;
left_hurt_box.x = x - global.step_size;
left_hurt_box.y = y;
top_hurt_box.x = x;
top_hurt_box.y = y - global.step_size;
bottom_hurt_box.x = x;
bottom_hurt_box.y = y + global.step_size;

oil = clamp(oil, 0, 100)
sane = clamp(sane, 0, 100)

range = 3	
if (oil < 66)
{
	range = 2;
}

if (oil < 33)
{
	range = 1	;
}

if (oil <= 0)
{
	range = 0;	
}



event_inherited()

if global.game_state == game_state.input_ready {

	if !hurt_box_visible {
		if keyboard_check_pressed(vk_left) && !instance_place(x - global.step_size, y, obj_blocker) {
		xx = x - global.step_size;
		}
		else if keyboard_check_pressed(vk_right) && !instance_place(x + global.step_size, y, obj_blocker) {
			xx = x + global.step_size;
		}
		else if keyboard_check_pressed(vk_up) && !instance_place(x, y - global.step_size, obj_blocker){
			yy = y - global.step_size;
		}
		else if keyboard_check_pressed(vk_down) && !instance_place(x, y + global.step_size, obj_blocker) {
			yy = y + global.step_size;
		}
	}
	
	if mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, self, true, false) {
		hurt_box_visible = !hurt_box_visible;
	}
	
	if hurt_box_visible {
		
		if mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, right_hurt_box, false, true) && can_attack {
			show_debug_message("right box");
			can_attack = false;
			var inst = instance_place(right_hurt_box.x, right_hurt_box.y, obj_enemy);
			if inst != noone {
				func_deal_damage(self, inst);
				if inst.hp <= 0 {
					with(inst) instance_destroy();	
				}
			}
		}
		else if mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, left_hurt_box, false, true) && can_attack {
			show_debug_message("left box");
			can_attack = false;
			var inst = instance_place(left_hurt_box.x, left_hurt_box.y, obj_enemy);
			if inst != noone {
				func_deal_damage(self, inst);
				if inst.hp <= 0 {
					with(inst) instance_destroy();	
				}
			}
		}
		else if mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, top_hurt_box, false, true) && can_attack {
			show_debug_message("top box");
			can_attack = false;
			var inst = instance_place(top_hurt_box.x, top_hurt_box.y, obj_enemy);
			if inst != noone {
				func_deal_damage(self, inst);
				if inst.hp <= 0 {
					with(inst) instance_destroy();	
				}
			}
		}
		else if mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, bottom_hurt_box, false, true) && can_attack {
			show_debug_message("bottom box");
			can_attack = false;
			var inst = instance_place(bottom_hurt_box.x, bottom_hurt_box.y, obj_enemy);
			if inst != noone {
				func_deal_damage(self, inst);
				if inst.hp <= 0 {
					with(inst) instance_destroy();	
				}
			}
		}
	}
	
	if !hurt_box_visible && (xx != x || yy != y) {
		global.game_state = game_state.player_moving;
		sane -= saneMod;
		oil -= oilMod;
	}
	else if hurt_box_visible && !can_attack {
		global.game_state = game_state.player_moving;
		sane -= saneMod;
		oil -= oilMod;	
	}
}

if global.game_state == game_state.player_moving {
	func_move_agent(self, xx, yy);
	if abs(x - xx) < 0.1 && abs(y - yy) < 0.1 {
		global.game_state = game_state.enemy_moving;
		can_attack = true;
		x = round(x);
		y = round(y);
	}
}

if hp <= 0 {
	//show_debug_message("game over");	
}
