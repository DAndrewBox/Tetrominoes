draw_set_color(c_p8_white);

///MUST!!! disable automatic drawing of the application surface.
///It will be manually drawn too in the Draw GUI event with the CRT shader applied.
///If you're drawing everything to your own surface then this should already be disbaled.
application_surface_draw_enable(false);
view_camera[0] = camera_create();
camera_set_view_size(view_camera[0], room_width, room_height); //See common resolution sizes above.
view_visible[0] = true;
view_enabled = true;
view_wport[0] = room_width * 2;
view_hport[0] = room_height * 2;
window_set_size(view_wport[0], view_hport[0]);

///Variable for enabling/disabling the CRT effect.
///Just for demonstration purposes, can be removed.
crt_shader_enabled = true;

///Setup the CRT shaders variables and shader uniforms
scr_CRT_init_shader(view_camera[0], true, 0.08, true, true, true, 0.03, 80.0, 1.0, true, 0.033);

depth = -100;

alarm[0] = 1;