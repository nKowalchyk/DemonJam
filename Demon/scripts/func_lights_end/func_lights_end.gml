if (event_type == ev_draw) and (event_number == 0)
{
	surface_reset_target();
	
	
	gpu_set_blendmode(bm_normal);
	
	surface_set_target(application_surface);
	
	gpu_set_blendmode_ext(bm_dest_color, bm_zero);
	
	
	draw_surface(iLight.light_surface, 0, 0);
	
	gpu_set_blendmode(bm_normal)
	
	surface_reset_target();
}