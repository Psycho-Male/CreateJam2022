if(gui)exit;
draw_self();
scribble(text).blend(text_color,image_alpha).wrap(sprite_width,sprite_height).transform(image_xscale,image_yscale,image_angle).align(fa_center,fa_middle).draw(x,y);

