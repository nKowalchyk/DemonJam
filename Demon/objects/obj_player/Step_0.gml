/// @description Update
// I can write my code in the editor

if keyboard_check_pressed(vk_left) {
	x -= global.step_size;	
}
else if keyboard_check_pressed(vk_right) {
	x += global.step_size;
}
else if keyboard_check_pressed(vk_up) {
	y -= global.step_size;
}
else if keyboard_check_pressed(vk_down) {
	y += global.step_size;
}