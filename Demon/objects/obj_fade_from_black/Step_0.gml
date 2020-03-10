/// @description Insert description here
// You can write your code in this editor
fade = lerp(fade, 0, 0.03)

if fade < 0.01
{
	instance_destroy()
}
