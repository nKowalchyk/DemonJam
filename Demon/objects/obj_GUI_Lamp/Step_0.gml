/// @description Insert description here
// You can write your code in this editor
var player = obj_player;


image_index = 0

if player.oil < 66
{
	image_index = 1	
}

if player.oil < 33
{
	image_index = 2	
}

if player.oil <= 0
{
	image_index = 3	
}