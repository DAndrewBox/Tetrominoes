///Ensure GUI layer is the correct size, same as the application surface.
display_set_gui_size(surface_width, surface_height);

///Check if the CRT shader is enabled and apply the effect to the application surface.
if (crt_shader_enabled) { scr_CRT_appy_to_surface(application_surface, view_camera[0]); }	
  else draw_surface(application_surface, 0,0);