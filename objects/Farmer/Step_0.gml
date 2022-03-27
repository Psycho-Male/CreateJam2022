depth=-y;
//target_obj=instance_place(target_grid[0],target_grid[1],some_instance);
state();
if(collision_check_h())hsp=0;
if(collision_check_v())vsp=0;
//Hurt and invul----------------------------------------------------------------------------\\
if(invul&&state!=state_stunned&&state!=state_stunned_trans){
    GuiTrace("Invul");
    image_alpha=0.5;
    if(invul_timer.countdown()){
        invul=false;
        StateChange(state_idle);
        image_alpha=1;
    }
}else if(!invul&&PlaceMeeting(Enemy)){
    if(bucket_full)bucket_full=false;
    StateChange(state_stunned_trans,sprite_stunned_trans);
    SfxPlay(stun);
}
//------------------------------------------------------------------------------------------//
