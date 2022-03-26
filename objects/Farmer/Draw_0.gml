scribble("[c_red]HP: "+str(plHp)+"[/c]").draw(32,24);
scribble("[c_yellow]Gold: "+str(plGold)+"[/c]").draw(32,32);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*facing,image_yscale,image_angle,image_blend,image_alpha);
//if(true){
if(Exists(target_obj)){
    draw_sprite_ext(spr_grid_target_preview,0,target_grid[0],target_grid[1],1,1,0,c_white,0.8);
}
