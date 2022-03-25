hsp=inpHorizontal*msp;
vsp=inpVertical*msp;
target_grid=find_target_grid();
if(collision_check_h())hsp=0;
if(collision_check_v())vsp=0;
state();
