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

if room == Level_1
{
	hp = 3;
	sane = 100;
	attack = 1;
	oil = 100;	
}

if hp <= 0
{
	visible = false;
	if range != -1
	{
		instance_create_layer(0, 0, "GUI", obj_fade_to_black)
		range = -1
	}
}

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

if lantern == false
{
	range = 0	
}



event_inherited()

func_keys()

if global.game_state == game_state.input_ready {
	
	if keyboard_check_pressed(vk_space)
	{
		global.game_state = game_state.player_moving	
	}

	if !hurt_box_visible and !lanternThrow{
		if keyLeft && !instance_place(x - global.step_size, y, obj_blocker) {
		xx = x - global.step_size;
		audio_play_sound(snd_step, 1, false)
		}
		else if keyRight && !instance_place(x + global.step_size, y, obj_blocker) {
			xx = x + global.step_size;
			audio_play_sound(snd_step, 1, false)
		}
		else if keyUp && !instance_place(x, y - global.step_size, obj_blocker){
			yy = y - global.step_size;
			audio_play_sound(snd_step, 1, false)
		}
		else if keyDown && !instance_place(x, y + global.step_size, obj_blocker) {
			yy = y + global.step_size;
			audio_play_sound(snd_step, 1, false)
		}
	}
	
	if mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, self, true, false) and lantern{
		hurt_box_visible = !hurt_box_visible;
	}
	
	if mouse_check_button_pressed(mb_left) and lanternThrow and !position_meeting(mouse_x, mouse_y, obj_wall) and mouse_y < 704
	{
		var throwX = clamp(mouse_x-(mouse_x%64), 0, 960)
		var throwY = clamp(mouse_y-(mouse_y%64), 0, 640)
		
		var lanternObj = instance_create_depth(throwX, throwY, depth, obj_lantern)
		lanternObj.range = range;
		var lanternThrowObj = instance_create_depth(x, y, depth, obj_lantern_moving)
		lanternThrowObj.range = range;
		lanternThrowObj.targetX = lanternObj.x;
		lanternThrowObj.targetY = lanternObj.y;
		lanternThrow = false;
		lantern = false;
		oil-=0.05
		hurt_box_visible = false;
		
	}
	
	if hurt_box_visible {
		
		if mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, right_hurt_box, false, true) && can_attack {
			show_debug_message("right box");
			oil-=0.05
			can_attack = false;
			var inst = instance_place(right_hurt_box.x, right_hurt_box.y, obj_enemy);
			if inst != noone {
				func_deal_damage(self, inst);
				if inst.hp <= 0 {
					with(inst) instance_destroy();	
				}
			}
			
			var inst = instance_place(right_hurt_box.x, right_hurt_box.y, obj_Torch);
			if inst != noone {
				if oil > 0
				{
					oil -= 10
					inst.range = 2
				}
			}
			
		}
		else if mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, left_hurt_box, false, true) && can_attack {
			show_debug_message("left box");
			oil-=0.05
			can_attack = false;
			var inst = instance_place(left_hurt_box.x, left_hurt_box.y, obj_enemy);
			if inst != noone {
				func_deal_damage(self, inst);
				if inst.hp <= 0 {
					with(inst) instance_destroy();	
				}
				
			}
			
			var inst = instance_place(left_hurt_box.x, left_hurt_box.y, obj_Torch);
			if inst != noone {
				if oil > 0
				{
					oil -= 10
					inst.range = 2
				}
			}
		}
		else if mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, top_hurt_box, false, true) && can_attack {
			show_debug_message("top box");
			oil-=0.05
			can_attack = false;
			var inst = instance_place(top_hurt_box.x, top_hurt_box.y, obj_enemy);
			if inst != noone {
				func_deal_damage(self, inst);
				if inst.hp <= 0 {
					with(inst) instance_destroy();	
				}
			}
			var inst = instance_place(top_hurt_box.x, top_hurt_box.y, obj_Torch);
			if inst != noone {
				if oil > 0
				{
					oil -= 10
					inst.range = 2
				}
			}
		}
		else if mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, bottom_hurt_box, false, true) && can_attack {
			show_debug_message("bottom box");
			oil-=0.05
			can_attack = false;
			var inst = instance_place(bottom_hurt_box.x, bottom_hurt_box.y, obj_enemy);
			if inst != noone {
				func_deal_damage(self, inst);
				if inst.hp <= 0 {
					with(inst) instance_destroy();	
				}
			}
			
			var inst = instance_place(bottom_hurt_box.x, bottom_hurt_box.y, obj_Torch);
			if inst != noone {
				if oil > 0
				{
					oil -= 10
					inst.range = 2
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

if (hp < lastHp) and hp != 0
{
	instance_create_layer(0, 0, "GUI", obj_redFlicker)	
}

lastHp = hp

if hp <= 0 {
	//show_debug_message("game over");	
}
