if(gui)exit;
draw_self();
scribble(text).blend(text_color,image_alpha).fit_to_box(sprite_width*0.9,sprite_height*0.9).align(fa_center,fa_middle).draw(x,y);

