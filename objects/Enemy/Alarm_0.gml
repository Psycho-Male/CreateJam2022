target=Find(EnemyTarget);
if(!Exists(target)){
    Trace("Couldn't find target.",LOGLEVEL.WARN);
    Destroy();
    exit;
}
path_free=get_path();
if(path_free){
    path_start(path,path_spd,path_action_stop,true);
}else{
    path_delete(path);
    path=-1;
}
