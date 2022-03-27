var _list=ds_list_create();
collision_line_list(x,y,xprevious,yprevious,Enemy,false,true,_list,true);
if(ds_list_size(_list)>0){
    _list[|0].hp-=damage;
    Destroy();
}
ds_list_destroy(_list);
