depth=-y;
//target_obj=instance_place(target_grid[0],target_grid[1],some_instance);
if(collision_check_h())hsp=0;
if(collision_check_v())vsp=0;
state();
//Hurt and invul----------------------------------------------------------------------------\\
if(invul&&state!=state_stunned&&state!=state_stunned_trans){
    GuiTrace("Invul");
    invul=false;
    image_alpha=0.5;
    if(invul_timer.countdown()){
        StateChange(state_idle);
        image_alpha=1;
    }
}else if(!invul&&PlaceMeeting(Enemy)){
    StateChange(state_stunned_trans,sprite_stunned_trans);
}
//------------------------------------------------------------------------------------------//
