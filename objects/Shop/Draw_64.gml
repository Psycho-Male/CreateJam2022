draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,image_blend,image_alpha);
if(surface_exists(item_surface)){
    draw_surface(item_surface,x,y);
    surface_set_target(item_surface);
    draw_clear_alpha(c_black,0);
    surface_reset_target();
}
