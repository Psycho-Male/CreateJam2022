//scribble(hp).align(fa_center,fa_top).draw(x,bbox_bottom+4);
if(path_exists(path)&&DEBUG.enabled){
    draw_path(path,x,y,true);
}
draw_self();
var _x=x-sprite_get_width(spr_healthbar)/2;
draw_sprite(spr_healthbar,0,_x,bbox_bottom+6);
DrawSlider(_x,bbox_bottom+6,spr_healthbar_inner,0,hp,hp_max);
