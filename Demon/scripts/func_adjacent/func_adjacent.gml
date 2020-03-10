///func(enemy, player)
///@return boolean

var enemy = argument0;

if place_meeting(enemy.x + global.step_size, enemy.y, obj_player) {
	return true;	
}
if place_meeting(enemy.x - global.step_size, enemy.y, obj_player) {
	return true;
}

if place_meeting(enemy.x, enemy.y + global.step_size, obj_player) {
	return true;	
}
if place_meeting(enemy.x, enemy.y - global.step_size, obj_player) {
	return true;
}

return false;