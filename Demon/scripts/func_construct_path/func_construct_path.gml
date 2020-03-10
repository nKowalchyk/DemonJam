///func_construct_path(target)
///@return ds_list

target = argument0;

var final_node_list = ds_list_create();
while target != noone {
	ds_list_insert(final_node_list, 0, current_node);
	show_debug_message(target[? "x"] + " " + target[? "y"]);
	current_node = current_node[? "parent"];
}

return final_node_list;