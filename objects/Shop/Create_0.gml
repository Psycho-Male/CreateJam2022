//States------------------------------------------------------------------------------------\\
function state_spawn(){
    GuiTrace("State spawn");
    x=LerpSnap(x,x_end,0.1,1);
    y=LerpSnap(y,y_end,0.1,1);
    if(x==x_end&&y==y_end){
        state=state_normal;
    }
}
function state_normal(){
    GuiTrace("State normal");
}
function state_despawn(){
    GuiTrace("State despawn");
    x=LerpSnap(x,x_start,0.1,1);
    y=LerpSnap(y,y_start,0.1,1);
    if(x==x_start&&y==y_start){
        Destroy();
    }

}
//------------------------------------------------------------------------------------------//
//Functions---------------------------------------------------------------------------------\\
function item_add(_name,_sprite,_description){
    var _item=new item_create(_name,_sprite,_description);
    ds_list_add(item_list,_item);
}
//------------------------------------------------------------------------------------------//
//Init--------------------------------------------------------------------------------------\\
width=64;
height=128;
x_start=display_get_gui_width();
y_start=display_get_gui_height()*0.25;
x_end=x_start-width;
y_end=y_start;
x_target=x_end;
y_target=y_end
x=x_start;
y=y_start;
item_list=DsListCreate();
state=state_spawn;
function item_create(_name,_sprite,_description) constructor{
    name=_name;
    sprite=_sprite;
    description=_description;
}
//------------------------------------------------------------------------------------------//
