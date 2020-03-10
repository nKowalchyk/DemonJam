///func_move_agent(agent, xx, yy);
agent = argument0;
xx = argument1;
yy = argument2;

agent.x = lerp(agent.x, xx, global.movement_speed);
agent.y = lerp(agent.y, yy, global.movement_speed);