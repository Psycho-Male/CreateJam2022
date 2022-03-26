if(surface_exists(Shop.item_surface)){
    surface_set_target(Shop.item_surface);
    draw_sprite_ext(sprite_index,image_index,surface_x,surface_y,image_xscale,image_yscale,0,image_blend,image_alpha);
    surface_reset_target();
}
