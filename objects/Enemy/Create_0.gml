//Functions---------------------------------------------------------------------------------\\
function get_path(){
    path=path_add();
    var _pathFree=mp_grid_path(GRID,path,x,y,EnemyTarget.x,EnemyTarget.y,false);
    if(!_pathFree)Trace("Path isn't free, this wasn't supposed to be happen.",LOGLEVEL.ERROR);
    return _pathFree;
}
//------------------------------------------------------------------------------------------//
//States------------------------------------------------------------------------------------\\
function state_normal(){
    if(PlaceMeeting(target)){
        HurtPlayer(1);
        EnemyTarget.hurt();
        StateChange(state_death);
    }else if(hp<=0){
        StateChange(state_death);
    }
}
function state_death(){
    if(path_exists(path)){
        path_delete(path);path=-1;
    }
    image_alpha=Approach(image_alpha,0,0.1);
    if(image_alpha<=0){
        Destroy();
    }
}
state=state_normal;
//------------------------------------------------------------------------------------------//
//Init--------------------------------------------------------------------------------------\\
path=-1;
path_free=false;
target=noone;
alarm[0]=1;
switch(object_index){
    case Tank:
    hp_max=12;
    path_spd=0.5;
    break;case Fly:
    hp_max=4;
    path_spd=1.00;
    break;case Ladybug:
    hp_max=6;
    path_spd=0.75;
    break;
}
hp=hp_max;
//------------------------------------------------------------------------------------------//
