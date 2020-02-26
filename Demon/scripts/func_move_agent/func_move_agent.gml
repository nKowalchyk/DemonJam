///func_move_agent(agent, xx, yy);
agent = argument0;
xx = argument1;
yy = argument2;

agent.x = lerp(agent.x, xx, 0.35);
agent.y = lerp(agent.y, yy, 0.35);