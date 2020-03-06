/// @description Insert description here
// You can write your code in this editor

light_layer = layer_get_id("Lights");

light_surface = surface_create(1024, 768);

layer_script_begin(light_layer, func_lights_begin);
layer_script_end(light_layer, func_lights_end)