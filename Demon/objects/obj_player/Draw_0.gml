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