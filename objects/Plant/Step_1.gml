if(objectParent==Eniste){
    var _list=ds_list_create();
    collision_circle_list(x,y,range,Plant,false,true,_list,false);
    for(var i=0;i<ds_list_size(_list);i++)with(_list[|i]){
        buff_aspd=0.5;
        buff_dmg=3;
        buff_range=0;
    }
    ds_list_destroy(_list);
}
