spawn_list=[];
spawn_timer=GetTimer(60);
switch(room){
    case rm_stage1:
    repeat(100){
        ArrayAdd(spawn_list,choose(Ladybug,Tank,Fly));
    }
    Trace("Length: "+str(array_length(spawn_list)));
    break;
}
