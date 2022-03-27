KeyCheck();
tooltip="";
//Gui and mouse active----------------------------------------------------------------------\\
guixprv=gui_x;
guiyprv=gui_y;
gui_x=device_mouse_x_to_gui(0);
gui_y=device_mouse_y_to_gui(0);
if(!mouse_active){
    mouse_active=gui_x!=guixprv||gui_y!=guiyprv;
}
if(mouse_active&&(inpHorizontal!=0||inpVertical!=0)){
    mouse_active=false;
}
//------------------------------------------------------------------------------------------//
x=mouse_x;
y=mouse_y;
cursor_sprite=mc_left1?sprite_clicked:sprite_normal;
check_button();
if(mp_right1){
    if(Control.play_room){
        if(!Exists(Shop)){
            InstanceCreate(Shop);
        }else{
            if(Exists(item_purchased)){
                plGold+=item_purchased.price;
                Destroy(item_purchased);item_purchased=noone;
            }
        }
    }
}
if(PlaceMeeting(Gui,gui_x,gui_y)){
    var _mwDir=mw_down-mw_up;
    var _mwOffMult=8;
    if(PlaceMeeting(ShopItem,gui_x,gui_y)){
        var _gui=instance_place(gui_x,gui_y,ShopItem);
    }else{
        var _gui=instance_place(gui_x,gui_y,Gui);
    }
    if(_mwDir!=0){
        if(_gui.object_index==ShopItem)_gui=Find(Shop);
        if(VIExists(_gui,"yoff")){
            VISet(_gui,"yoff",VIGet(_gui,"yoff")+_mwDir*_mwOffMult);
        }
    }
    if(Exists(_gui)){
        if(VIExists(_gui,"tooltip")){
            tooltip=VIGet(_gui,"tooltip");
        }
    }
    if(mp_left1){
        prevent_movement=true;
        if(_gui.object_index==ShopItem){
            item_purchased=Shop.item_purchase(_gui);
        }
    }
}else{
    if(mw_down)Camera.zoom_target++;else if(mw_up)Camera.zoom_target--;
    if(mp_left1){
        if(Exists(item_purchased)){
            prevent_movement=true;
            var _x=round(x/16)*16;
            var _y=round(y/16)*16;
            if(tilemap_get_at_pixel(TILEMAP,_x,_y)==6&&!collision_rectangle(_x,_y,_x+8,_y+8,Plant,false,true)){
                with(InstanceCreate(item_purchased.plant_object,_x+8,_y+8,"Instances")){
                    state=state_idle;
                }
                Destroy(item_purchased);item_purchased=noone;
            }else{
                Notification("[c_red]Can't place there![/c]");
            }
        }
    }
}
if(mc_left1){
    if(!prevent_movement){
        if(!Exists(move_to))move_to=InstanceCreate(MoveTarget);
        move_to.x=x;
        move_to.y=y;
    }
}
if(mr_left1){
    if(prevent_movement){
        prevent_movement=false;
    }
}
get_mouse_drag();
