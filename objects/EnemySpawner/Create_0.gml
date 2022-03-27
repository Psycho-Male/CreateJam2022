spawn_list=[];
spawn_timer=GetTimer(60);
switch(room){
    case rm_stage1:
    ArrayAdd(spawn_list,[Ladybug,15]);
    ArrayAdd(spawn_list,[Fly,45]);
    ArrayAdd(spawn_list,[Tank,35]);
    ArrayAdd(spawn_list,[Ladybug,15]);
    ArrayAdd(spawn_list,[Fly,45]);
    ArrayAdd(spawn_list,[Tank,35]);
    Trace("Length: "+str(array_length(spawn_list)));
    break;
}
