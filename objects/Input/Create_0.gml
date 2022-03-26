//------------------------------------------------------------------------------------------\\
//Functions                                                                                 ||
//------------------------------------------------------------------------------------------//
function check_button(){
    tooltip="";
    with(Button){
        highlight=false;
        clicked=false;
    }
    if(place_meeting(gui_x,gui_y,Button))with(instance_place(gui_x,gui_y,Button))if(gui){
        highlight=true;
        if(mc_left1){
            clicked=true;
        }
        if(mr_left1){
            activate();
        }
        if(VIExists(id,"tooltip"))other.tooltip=VIGet(id,"tooltip");
        return true;
    }
    if(place_meeting(x,y,Button))with(instance_place(x,y,Button))if(!gui){
        highlight=true;
        if(mc_left1){
            clicked=true;
        }
        if(mr_left1){
            activate();
        }
        if(VIExists(id,"tooltip"))other.tooltip=VIGet(id,"tooltip");
        return true;
    }
    return false;
}
//Mouse Drag--------------------------------------------------------------------------------\\
mouse_drag_x_start=0;mouse_drag_y_start=0;
mouse_drag_x=0;mouse_drag_y=0;
mouse_gui_drag_x_start=0;mouse_gui_drag_y_start=0;
mouse_gui_drag_x=0;mouse_gui_drag_y=0;
function get_mouse_drag(){
    if(mc_left1){
        if(mouse_gui_drag_x_start==0)mouse_gui_drag_x_start=x;
        if(mouse_gui_drag_y_start==0)mouse_gui_drag_y_start=y;
        if(mouse_drag_x_start==0)mouse_drag_x_start=x;
        if(mouse_drag_y_start==0)mouse_drag_y_start=y;
        mouse_gui_drag_x=mouse_gui_drag_x_start-x;
        mouse_gui_drag_y=mouse_gui_drag_y_start-y;
        mouse_drag_x=mouse_drag_x_start-x;
        mouse_drag_y=mouse_drag_y_start-y;
    }
    //GuiTrace("mouse_drag_x: ",mouse_drag_x);
    //GuiTrace("mouse_drag_y: ",mouse_drag_y);
    //GuiTrace("mouse_gui_drag_x: ",mouse_gui_drag_x);
    //GuiTrace("mouse_gui_drag_y: ",mouse_gui_drag_y);
}
//------------------------------------------------------------------------------------------//
//Init--------------------------------------------------------------------------------------\\
button=noone;
window_set_cursor(cr_none);
tooltip="";
move_to=noone;
mouse_active=false;
gui_x=device_mouse_x_to_gui(0);
gui_y=device_mouse_y_to_gui(0);
guixprv=gui_x;
guiyprv=gui_y;
item_purchased=noone;
prevent_movement=false;
//------------------------------------------------------------------------------------------//
