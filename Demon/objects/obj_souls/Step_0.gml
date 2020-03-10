/// @description Insert description here
// You can write your code in this editor
direction = point_direction(x, y, obj_player.x, obj_player.y)

if pushed
{
	if instance_exists(target)
	{
		speed = 0
		x = target.x
		y = target.y
	}
	else
	{
		pushed = false;	
	}
}

if obj_player.sane <=1
{
	speed = 1
	audio_sound_gain(snd_White, clamp(1-(point_distance(x, y, obj_player.x, obj_player.y)/512), 0, 1), 0)
}
else
{
	x = 1200
	y = 1200
	audio_sound_gain(snd_White, 0, 1000)
}