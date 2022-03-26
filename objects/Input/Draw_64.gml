if(tooltip!=""){
    scribble(tooltip).draw(x,y);
}
if(DEBUG.enabled)draw_sprite(sprite_index,image_index,gui_x,gui_y);
if(Exists(item_purchased)){
    scribble("Press right mouse button to sell plant.").align(fa_right,fa_middle).draw(displayWidth,32);
    scribble("Press left mouse button to plant on digged tiles.").align(fa_right,fa_middle).draw(displayWidth,48);
}
