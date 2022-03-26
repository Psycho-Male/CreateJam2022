view_enabled=true;
view_visible[0]=true;
if(RoomIsPlayable()){
    view_width =game_width;
    view_height=game_height;
}else{
    x=0;y=0;
    view_width =menu_width;
    view_height=menu_height;
}
window_resize();
