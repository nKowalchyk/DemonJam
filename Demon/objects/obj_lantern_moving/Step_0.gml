/// @description Insert description here
// You can write your code in this editor
event_inherited()
x = lerp(x, targetX, moveStep)
y = lerp(y, targetY, moveStep)
moveStep += 0.03
if abs(x-targetX)<1 and abs(y-targetY)<1
{
	obj_lantern.visible = true;
	instance_destroy()	
}