/// @description Insert description here
// You can write your code in this editor
x = lerp(x, obj_player_fake.x, 0.1)
y = lerp(y, obj_player_fake.y, 0.1)

if abs(x-obj_player_fake.x) < 1 and abs(y-obj_player_fake.y) < 1
{
	instance_destroy()	
}