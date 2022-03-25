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
//------------------------------------------------------------------------------------------\\
//                                                                                          ||
//------------------------------------------------------------------------------------------//
button=noone;
window_set_cursor(cr_none);
tooltip="";
