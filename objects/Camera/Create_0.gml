#macro wdScale          Camera.window_scale
#macro cmHalfWidth      Camera.width/2
#macro cmWPlayerPadding (Camera.width*.5-zoom)//-(plId.facing*Camera.view_width*.10))
#macro cmHPlayerPadding (Camera.height*.5-zoom*.5)
#macro displayWidth     display_get_gui_width()
#macro displayHeight    display_get_gui_height()
#macro guiHCenter       displayWidth/2
#macro guiVCenter       displayHeight/2
if(ExcessiveInstance())exit;
xoff=0;yoff=0;
//------------------------------------------------------------------------------------------\\
//Functions                                                                                 ||
//------------------------------------------------------------------------------------------//
function save_options(){
    IniWrite("options","Visual","Window Scale",window_scale);
    IniWrite("options","Visual","Fullscreen",fullscreen);
}
function window_resize(_windowScale=window_scale,_fullscreen=fullscreen){
    fullscreen=_fullscreen;
    _windowScale=_fullscreen?max_scale:_windowScale;
    if(_windowScale>max_scale)_windowScale=min_scale;
    if(_windowScale<=0)_windowScale=max_scale
    window_scale=_windowScale;
    width=ideal_width*_windowScale;
    height=ideal_height*_windowScale;
    surface_resize(application_surface,width,height);
    window_set_size(width,height);
    display_set_gui_size(view_width,view_height);
    window_set_fullscreen(_fullscreen);
    alarm[0]=3;
}
function read_options(){
    if file_exists("options.ini") {
        window_scale=IniRead("options", "Visual", "Window Scale", window_scale);
        fullscreen=IniRead("options", "Visual", "Fullscreen", true);
    }
}
function update_position(){
    camera_set_view_pos(view_camera[0],x-(zoom/2)*aspect_ratio,y-zoom/2);
    width=camera_get_view_width(view_camera[0]);
    height=camera_get_view_height(view_camera[0])
    right=x+view_width+(zoom/2)*aspect_ratio;
    bottom=y+view_height+zoom/2;
    hcenter=x+view_width/2;
    vcenter=y+view_height/2;
    zoomedx=x-(zoom/2)*aspect_ratio;
    zoomedy=y-zoom/2;
}
function instant_zoom(_zoomValue){
    zoom_target=clamp(_zoomValue,zoom_min,zoom_max);
    zoom=zoom_target*zoom_value;
}
function follow(_id){
    var _x=clamp(_id.x-cmWPlayerPadding+xoff,zoom*aspect_ratio/2,(room_width-(width-zoom*aspect_ratio/2)));
    var _y=clamp(_id.y-cmHPlayerPadding+yoff,zoom/2,room_height-(height-zoom/2));
    return [_x,_y];
}
function jump_on(_id){
    var _pos=follow(_id);
    x=_pos[0];
    y=_pos[1];
}
//------------------------------------------------------------------------------------------\\
//States                                                                                    ||
//------------------------------------------------------------------------------------------//
function state_free(){
    zoom_target=0;
    if(Exists(locked_on)){
        instant_zoom(2);
        jump_on(locked_on);
        state=state_follow;
    }else{x=0;}
}
function state_follow(){
    if(Exists(locked_on)){
        var _pos=follow(locked_on);
        x=lerp(x,_pos[0],.2);
        y=lerp(y,_pos[1],.2);
    }else{
        state=state_free;
    }
}
function state_locked(){
}
//--------------------------------------------------\\
//Pixel Perfect Scaling||
//--------------------------------------------------//
display_width=display_get_width();
display_height=display_get_height();
aspect_ratio=display_width/display_height;
ideal_height=256;
ideal_width=round(ideal_height*aspect_ratio);
if(display_width%ideal_width!=0){
    ideal_width=display_width/round(display_width/ideal_width);
}
if(display_height%ideal_height!=0){
    ideal_height=display_height/round(display_height/ideal_height);
}
if(ideal_width&1)ideal_width++;
if(ideal_height&1)ideal_height++;
min_scale=1;
max_scale=round(display_get_height()/ideal_height);
//--------------------------------------------------\\
//Init||
//--------------------------------------------------//
menu_width=1920/6;
menu_height=1080/6;
game_width=1920/4;
game_height=1080/4;
view_width=menu_width;
view_height=menu_height;
window_scale=3;
read_options();
window_resize(window_scale,false);
locked_on=noone;
zoom=0;
zoom_value=32;
zoom_target=0;
zoom_min=-4;
zoom_max=4;
state=state_free;
update_position();
