if(spawn_timer.countdown()){
    if(array_length(spawn_list)>0){
        InstanceCreate(spawn_list[0],x,y,"Instances");
        ArrayDelete(spawn_list,0);
    }else{
        Destroy();
    }
}
