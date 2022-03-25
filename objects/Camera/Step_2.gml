camera_set_view_size(view_camera[0],view_width+zoom*aspect_ratio,view_height+zoom);
state();
//GuiTrace("zoom_target: ",zoom_target);
//GuiTrace("zoom: ",zoom);
if(mw_down)zoom_target++;else if(mw_up)zoom_target--;
zoom_target=clamp(zoom_target,zoom_min,zoom_max);
zoom=lerp(zoom,zoom_target*zoom_value,.1);
update_position();
