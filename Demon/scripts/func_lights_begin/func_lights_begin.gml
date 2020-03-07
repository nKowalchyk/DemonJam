if (event_type == ev_draw) and (event_number == 0)
{
		if (!surface_exists(iLight.light_surface))
		{
			iLight.light_surface = surface_create(1024, 1024);	
			
		}
		
		var cam = view_camera[view_current]
		
		surface_set_target(iLight.light_surface);
		
		
		camera_apply(cam);
		
		draw_clear_alpha(c_black, 1.0);
		gpu_set_blendmode(bm_add);
		
		
}