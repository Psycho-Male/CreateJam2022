enum plDir{
    up,up_left,left,down_left,down,down_right,right,up_right,down_right_alt
}
#macro kpAction1        KP.action1
function state_reset(){
    if(inpHorizontal!=0||inpVertical!=0){
        var _spr=bucket_full?sprite_run_full:sprite_run_empty;
        StateChange(state_run,_spr);
    }else{
        var _spr=bucket_full?sprite_idle_full:sprite_idle_empty;
        StateChange(state_idle,_spr);
    }
}
//States------------------------------------------------------------------------------------\\
function state_idle(){
    sprite_index=bucket_full?sprite_idle_full:sprite_idle_empty;
    movement();
    if(hsp!=0||vsp!=0){
        StateChange(state_run);
    }
    if(kpAction1)dig();
}
function state_run(){
    sprite_index=bucket_full?sprite_run_full:sprite_run_empty;
    movement();
    if(hsp==0&&vsp==0){
        StateChange(state_idle);
    }
    if(kpAction1)dig();
}
function state_stunned_trans(){
    invul=true;
    if(AnimationComplete()){
        StateChange(state_stunned,sprite_stunned);
    }
}
function state_stunned(){
    invul=true;
    if(stun_timer.countdown()){
        state_reset();
    }
}
function state_collect(){
}
function state_water(){
}
function state_dig(){
    if(AnimationComplete()){
        state_reset();
    }
}
function state_plant(){
}
function state_death(){
}
//------------------------------------------------------------------------------------------//
//Functions---------------------------------------------------------------------------------\\
//------------------------------------------------------------------------------------------//
function interact(){
    var _well=instance_place(target_grid[0],target_grid[1],Well);
    var _plant=instance_place(target_grid[0],target_grid[1],Plant);
    if(Exists(_well)){
        bucket_full=true;
    }else if(Exists(_plant)){
        if(bucket_full){
            bucket_full=false;
        }else{
            Notification("[c_yellow]Fill the bucket from well first![/c]");
        }
    }
}
function movement(){
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
    target_grid=update_target_grid();
}
function collision_check_h(){
    return instance_place(x+hsp,y,Obstacle);
}
function collision_check_v(){
    return instance_place(x,y+vsp,Obstacle);
}
function update_target_grid(){
    var _cs=16;;
    grid_dirx=sign(hsp);
    grid_diry=sign(vsp);
    var _targetHDir=hsp;
    var _targetVDir=vsp;
    //if(Input.mouse_active){
    //    var _dir=point_direction(x,y,Input.x,Input.y);
    //    GuiTrace("_dir: ",_dir);
    //    _targetHDir=clamp(lengthdir_x(Input.x-x,_dir),-_cs,_cs);
    //    _targetVDir=clamp(lengthdir_y(Input.y-y,_dir),-_cs,_cs);
    //      GuiTrace("_targetHDir: ",_targetHDir);
    //      GuiTrace("_targetVDir: ",_targetVDir);
    //}
    if(sign(_targetHDir)==1){
        if(sign(_targetVDir)==1){
            last_dir=plDir.down_right;
        }else if(sign(_targetVDir)==-1){
            last_dir=plDir.up_right;
        }else{
            last_dir=plDir.right;
        }
    }else if(sign(_targetHDir)==-1){
        if(sign(_targetVDir)==1){
            last_dir=plDir.down_left;
        }else if(sign(_targetVDir)==-1){
            last_dir=plDir.up_left;
        }else{
            last_dir=plDir.left;
        }
    }else{
        if(sign(_targetVDir)==1){
            last_dir=plDir.down;
        }else if(sign(_targetVDir)==-1){
            last_dir=plDir.up;
        }
    }
    var _x=x;var _y=y-16;
    var _hdir=0;var _vdir=0;
    switch(last_dir){
        case plDir.up:
        _vdir=-_cs;
        break;case plDir.up_left:
        _hdir+=-_cs;
        _vdir+=-_cs;
        break;case plDir.left:
        _hdir+=-_cs;
        break;case plDir.down_left:
        _hdir+=-_cs;
        _vdir+=_cs;
        break;case plDir.down:
        _vdir+=_cs;
        break;case plDir.down_right:case plDir.down_right_alt:
        _hdir+=_cs;
        _vdir+=-_cs;
        break;case plDir.right:
        _hdir+=_cs;
        break;case plDir.up_right:
        _hdir+=_cs;
        _vdir+=-_cs;
        break;
    }
    _x+=_hdir;_y+=_vdir;
    var _gridPosX=round(_x/_cs)*_cs;
    var _gridPosY=round(_y/_cs)*_cs;
    return [_gridPosX,_gridPosY];
}
function find_target_grid(_forceNear=false){
    if(!_forceNear&&Input.mouse_active){
        var _x=Input.x;
        var _y=Input.y;
        var _gridPosX=round(_x/32)*32;
        var _gridPosY=round(_y/32)*32;
        return [_gridPosX,_gridPosY];
    }else{
        if(!_forceNear&&(hsp==0&&vsp==0))return target_grid;
        grid_dirx=sign(hsp);
        grid_diry=sign(vsp);
        if(sign(hsp)==1){
            if(sign(vsp)==1){
                last_dir=plDir.down_right;
            }else if(sign(vsp)==-1){
                last_dir=plDir.up_right;
            }else{
                last_dir=plDir.right;
            }
        }else if(sign(hsp)==-1){
            if(sign(vsp)==1){
                last_dir=plDir.down_left;
            }else if(sign(vsp)==-1){
                last_dir=plDir.up_left;
            }else{
                last_dir=plDir.left;
            }
        }else{
            if(sign(vsp)==1){
                last_dir=plDir.down;
            }else if(sign(vsp)==-1){
                last_dir=plDir.up;
            }
        }
        var _x=x+grid_dirx*32;
        var _y=y-16+grid_diry*32;
        var _gridPosX=round(_x/32)*32;
        var _gridPosY=round(_y/32)*32;
        return [_gridPosX,_gridPosY];
    }
}
function dig(){
    StateChange(state_dig,sprite_dig);
}
//Init--------------------------------------------------------------------------------------\\
event_inherited();
state=state_idle;
hsp=0;vsp=0;
msp=2.5;
plId=id;
Camera.locked_on=id;
item_in_hand=undefined;
last_dir=plDir.right;
grid_dirx=facing;
grid_diry=0;
target_grid=[round(x/32)*32,round(y)*32];
target_obj=noone;
mouse_hsp=0;
mouse_vsp=0;
invul=false;
invul_timer=GetTimer(75);
stun_timer=GetTimer(60);
bucket_full=false;
//------------------------------------------------------------------------------------------//
