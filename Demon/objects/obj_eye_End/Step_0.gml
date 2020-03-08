/// @description Insert description here
// You can write your code in this editor
event_inherited()
x = lerp(x, targetX, moveStep)
y = lerp(y, targetY, moveStep)
moveStep += 0.01
if abs(x-targetX)<1 and abs(y-targetY)<1
{
	instance_destroy()	
}