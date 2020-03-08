/// @description Insert description here
// You can write your code in this editor
if point_distance(x, y, obj_player.x, obj_player.y) < 256+64
{
	image_alpha = (point_distance(x, y, obj_player.x, obj_player.y)-(64))/256
}
else
{
	image_alpha = 1	
}