if(spawn_timer.countdown()){
    if(array_length(spawn_list)>0){
        var _arr=spawn_list[0];
        ArrayDelete(spawn_list,0);
        if(IsString(_arr[0])){
            Notification(_arr[0],_arr[1]);
        }else{
            InstanceCreate(_arr[0],x,y,"Instances");
        }
        spawn_timer=GetTimer(_arr[1]);
    }else{
        Destroy();
    }
}
