//States------------------------------------------------------------------------------------\\
function state_idle(){
    GuiTrace("Idle");
    movement();
    if(hsp!=0||vsp!=0){
        StateChange(state_run,sprite_run);
    }
}
function state_run(){
    movement();
    GuiTrace("Run");
    if(hsp==0&&vsp==0){
        StateChange(state_idle,sprite_idle);
    }
}
function state_stunned(){
    GuiTrace("Stunned");
    if(stun_timer.countdown()){
        StateChange(state_idle,sprite_idle);
    }
}
function state_collect(){
}
function state_water(){
}
function state_plant(){
}
function state_death(){
}
//------------------------------------------------------------------------------------------//
//Functions---------------------------------------------------------------------------------\\
//------------------------------------------------------------------------------------------//
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
    target_grid=find_target_grid();
}
function collision_check_h(){
    return instance_place(x+hsp,y,Obstacle);
}
function collision_check_v(){
    return instance_place(x,y+vsp,Obstacle);
}
function find_target_grid(){
    if(Input.mouse_active){
        var _x=Input.x;
        var _y=Input.y;
        var _gridPosX=round(_x/32)*32;
        var _gridPosY=round(_y/32)*32;
        return [_gridPosX,_gridPosY];
    }else{
        if(hsp==0&&vsp==0)return target_grid;
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
//Init--------------------------------------------------------------------------------------\\
enum plDir{
    up,down,left,right,up_left,up_right,down_left,down_right
}
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
invul_timer=GetTimer(30);
stun_timer=GetTimer(60);
//------------------------------------------------------------------------------------------//
