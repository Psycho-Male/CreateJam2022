depth=-y;
//target_obj=instance_place(target_grid[0],target_grid[1],some_instance);
if(collision_check_h())hsp=0;
if(collision_check_v())vsp=0;
state();
//Hurt and invul----------------------------------------------------------------------------\\
if(invul){
    GuiTrace("Invul");
    invul=false;
    image_alpha=0.5;
    if(invul_timer.countdown()){
        StateChange(state_idle);
    }
}else if(PlaceMeeting(Enemy)){
    StateChange(state_stunned);
}
//------------------------------------------------------------------------------------------//
