view_enabled=true;
view_visible[0]=true;
if(TagContained(room_get_name(room),"Main Menu")){
    x=0;y=0;
    view_width =menu_width;
    view_height=menu_height;
}else{
    view_width =game_width;
    view_height=game_height;
}
window_resize();
