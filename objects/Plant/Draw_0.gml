draw_self();
var _x=x-sprite_get_width(spr_healthbar)/2;
draw_sprite(spr_healthbar,0,_x,bbox_bottom+6);
DrawSlider(_x,bbox_bottom+6,spr_healthbar_inner,0,thirst_timer.time,thirst_timer.time_reset);
