event_inherited();
var _perc=(hp/hp_max)*100;
if(_perc>=75){
    draw_sprite(sprite_index,image_index+1,x+10,y+3);
    draw_sprite(sprite_index,image_index+2,x-11,y+5);
    draw_sprite(sprite_index,image_index+3,x+5,y-11);
}else if(_perc>=50){
    draw_sprite(sprite_index,image_index+1,x+10,y+3);
    draw_sprite(sprite_index,image_index+2,x-11,y+5);
}else if(_perc>=25){
    draw_sprite(sprite_index,image_index+1,x+10,y+3);
}
