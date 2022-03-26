if(Exists(Input.move_to)){
    if(inpHorizontal!=0||inpVertical!=0){
        Destroy(Input.move_to);
    }else if(InstanceMoveTowardsSimple(x,y,Input.move_to.x,Input.move_to.y,msp)){
        Destroy(Input.move_to);
    }
}
if(!Exists(Input.move_to)){
    Destroy(Input.move_to);
    hsp=inpHorizontal*msp;
    vsp=inpVertical*msp;
}
target_grid=find_target_grid();
//target_obj=instance_place(target_grid[0],target_grid[1],some_instance);
if(collision_check_h())hsp=0;
if(collision_check_v())vsp=0;
state();
