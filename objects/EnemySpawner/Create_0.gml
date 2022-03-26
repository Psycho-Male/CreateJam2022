spawn_list=[];
spawn_timer=GetTimer(60);
switch(room){
    case rm_stage1:
    spawn_list=[Orc];
    repeat(100){
        ArrayAdd(spawn_list,Orc);
    }
    Trace("Length: "+str(array_length(spawn_list)));
    break;
}
