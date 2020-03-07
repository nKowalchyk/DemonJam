///func_move_to_node(enemy, node);

var enemy = argument0;
var node = argument1;

var xx = node[? "x"] - enemy.x;
var yy = node[? "y"] - enemy.y;

enemy.xx = enemy.x + xx;
enemy.yy = yy;

show_debug_message(string(xx) + " " + string(yy));

func_move_agent(enemy, xx, yy);