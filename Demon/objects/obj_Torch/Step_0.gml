/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if lastRange != range
{
	obj_player.sane += 40	
	audio_play_sound(snd_torch, 1, false)
}

lastRange = range;

if range == -1
{
	image_index = 0	
}
else
{
	image_index = 1	
}

//x = mouse_x
//y = mouse_y