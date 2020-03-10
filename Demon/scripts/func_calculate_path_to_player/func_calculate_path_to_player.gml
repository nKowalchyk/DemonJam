///func_check_player_proximity(obj_enemy, obj_player)
// @takes an enemy object and player object
// returns: list of movement options (up, down, right, left)

var enemy = argument0;
var player = argument1;

// Initialized open and closed lists
var open_list = ds_list_create();
var closed_list = ds_list_create();

// Initialize current position as current_node and add to open list
var starting_node = ds_map_create();
ds_map_add(starting_node, "x", enemy.x);
ds_map_add(starting_node, "y", enemy.y);
ds_map_add(starting_node, "f", 0);
ds_map_add(starting_node, "g", 0);
ds_map_add(starting_node, "h", 0);
ds_map_add(starting_node, "parent", noone);

ds_list_add(open_list, starting_node);
var found = false;

while !found && ds_list_size(open_list) > 0 {
	var current_node = noone;
	var current_index = 0;
	for(var k = 0; k < ds_list_size(open_list); k++) {
		var candidate_node = open_list[| k];
		if current_node == noone || candidate_node[? "f"] < current_node[? "f"] {
			current_node = candidate_node;
			current_index = k;
		}	
	}
	
	ds_list_delete(open_list, current_index);
	
	var successor_nodes = ds_list_create();
	var right_node = ds_map_create();
	var left_node = ds_map_create();
	var top_node = ds_map_create();
	var bottom_node = ds_map_create();
	
	ds_map_add(right_node, "x", current_node[? "x"] + global.step_size);
	ds_map_add(right_node, "y", current_node[? "y"]);
	ds_map_add(right_node, "f", 0);
	ds_map_add(right_node, "g", 0);
	ds_map_add(right_node, "h", 0);
	ds_map_add(right_node, "parent", ds_map_create());
	
	ds_map_add(left_node, "x", current_node[? "x"] - global.step_size);
	ds_map_add(left_node, "y", current_node[? "y"]);
	ds_map_add(left_node, "f", 0);
	ds_map_add(left_node, "g", 0);
	ds_map_add(left_node, "h", 0);
	ds_map_add(left_node, "parent", ds_map_create());
	
	ds_map_add(top_node, "x", current_node[? "x"]);
	ds_map_add(top_node, "y", current_node[? "y"] - global.step_size);
	ds_map_add(top_node, "f", 0);
	ds_map_add(top_node, "g", 0);
	ds_map_add(top_node, "h", 0);
	ds_map_add(top_node, "parent", ds_map_create());
	
	ds_map_add(bottom_node, "x", current_node[? "x"]);
	ds_map_add(bottom_node, "y", current_node[? "y"] + global.step_size);
	ds_map_add(bottom_node, "f", 0);
	ds_map_add(bottom_node, "g", 0);
	ds_map_add(bottom_node, "h", 0);
	ds_map_add(bottom_node, "parent", ds_map_create());
	
	ds_list_add(successor_nodes, right_node);
	ds_list_add(successor_nodes, left_node);
	ds_list_add(successor_nodes, top_node);
	ds_list_add(successor_nodes, bottom_node);
	
	for(var i = 0; i < ds_list_size(successor_nodes); i++) {
		var current_successor_node = successor_nodes[| i];
		ds_map_copy(current_successor_node[? "parent"], current_node);
		
		if current_successor_node[? "x"] == player.x && current_successor_node[? "y"] == player.y {
			found = true;
			var final_node_list = ds_list_create();
			var target = current_node;
			while ds_exists(target, ds_type_map) && ds_map_exists(target, "x") && ds_map_exists(target, "y") {
				ds_list_insert(final_node_list, 0, target);
				target = target[? "parent"];
			}
			return final_node_list;
		}
		
		if !found {
			
			current_successor_node[? "g"] = 
											current_node[? "g"] + 
										  func_get_distance(current_successor_node[? "x"],
															current_successor_node[? "y"],
															current_node[? "x"],
															current_node[? "y"]);
			current_successor_node[? "h"] = func_get_distance(current_successor_node[? "x"],
															current_successor_node[? "y"],
															player.x,
															player.y);							
			current_successor_node[? "f"] = current_successor_node[? "g"] + current_successor_node[? "h"];
		
			var skip_successor = false;
		
			if place_meeting(current_successor_node[? "x"], current_successor_node[? "y"], obj_enemy) {
				skip_successor = true;	
			}

		
			for(var j = 0; j < ds_list_size(open_list); j++) {
				var current_open_node = open_list[| j];
				if current_open_node[? "x"] == current_successor_node[? "x"] && 
					current_open_node[? "y"] == current_successor_node[? "y"] &&
					current_open_node[? "f"] <= current_successor_node[? "f"] {
						skip_successor = true;   
					}
			}		

			for(var j = 0; j < ds_list_size(closed_list); j++) {
				var current_closed_node = closed_list[| j];
				if current_closed_node[? "x"] == current_successor_node[? "x"] && 
					current_closed_node[? "y"] == current_successor_node[? "y"] &&
					current_closed_node[? "f"] <= current_successor_node[? "f"] {
						skip_successor = true;   
					}	
			}

			if !skip_successor {
				ds_list_add(open_list, current_successor_node);
			}
		
			//ds_map_destroy(current_successor_node);
		}
	}
	
	ds_list_add(closed_list, current_node);

	//ds_map_destroy(current_node);
}

//ds_map_destroy(starting_node);
//ds_map_destroy(right_node);
//ds_map_destroy(left_node);
//ds_map_destroy(top_node);
//ds_map_destroy(bottom_node);

//ds_list_destroy(open_list);
//ds_list_destroy(successor_nodes);