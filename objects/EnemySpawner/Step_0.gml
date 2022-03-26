scribble("[c_green]Remaining: "+str(array_length(spawn_list))+"[/c]").draw(32,48);
if(spawn_timer.countdown()){
    for(var i=0;i<array_length(spawn_list);i++){
        InstanceCreate(ArrayPop(spawn_list),x,y,"Instances");
        ArrayDelete(spawn_list,0);
    }
}
if(array_length(spawn_list)<=0){
    Destroy();
}
