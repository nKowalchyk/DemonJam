/// @description Insert description here
// You can write your code in this editor

outScore = instance_create_layer(x, y, "GUI", obj_tutorial)
with outScore{
	draw_set_color(c_red)
	draw_set_font(fnt_BigRed)
	vspeed = -6
	hspeed = irandom(12)-6
	content = string(floor(global.healthScore))+"!"
}
instance_destroy()