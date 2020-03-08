/// @description player object
// I can write my code here

name = "";

oilMod = 2;
saneMod = 1;

xx = x;
yy = y;
range = 1;
can_attack = true;
lanternThrow = false;
lantern = true;

instance_create_depth(x, y, depth, obj_playerLight);

right_hurt_box = instance_create_layer(x + 64, y, "GUI", obj_hurt_box);
left_hurt_box = instance_create_layer(x - 64, y, "GUI", obj_hurt_box);
bottom_hurt_box = instance_create_layer(x, y + 64, "GUI", obj_hurt_box);
top_hurt_box = instance_create_layer(x, y - 64, "GUI", obj_hurt_box);

hurt_box_visible = false;

image_speed = 0