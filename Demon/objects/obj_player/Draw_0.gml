/// @description Insert description here
// You can write your code in this editor
draw_self();
if hurt_box_visible {
	right_hurt_box.visible = true;
	left_hurt_box.visible = true;
	top_hurt_box.visible = true;
	bottom_hurt_box.visible = true;
}
else {
	right_hurt_box.visible = false;
	left_hurt_box.visible = false;
	top_hurt_box.visible = false;
	bottom_hurt_box.visible = false;
}

if lantern
{
	image_index = 0	
}
else
{
	image_index = 1	
}

if lanternThrow
{
	var throwX = clamp(mouse_x-(mouse_x%64), 0, 960)
	var throwY = clamp(mouse_y-(mouse_y%64), 0, 640)
	
	draw_sprite_ext(spr_lantern, 0, throwX, throwY, 1, 1, 0, c_white, 0.5)	
}