if(spawn_timer.countdown()){
    for(var i=0;i<array_length(spawn_list);i++){
        InstanceCreate(spawn_list[i],x,y,"Instances");
    }
}
