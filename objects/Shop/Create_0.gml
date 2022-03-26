//States------------------------------------------------------------------------------------\\
function state_spawn(){
    x=LerpOff(x,x_end,0.1,3);
    y=LerpOff(y,y_end,0.1,3);
    if(x==x_end&&y==y_end){
        state=state_normal;
    }
    if(mp_right1)state=state_despawn;
}
function state_normal(){
    if(mp_right1)state=state_despawn;
}
function state_despawn(){
    x=LerpOff(x,x_start,0.1,3);
    y=LerpOff(y,y_start,0.1,3);
    if(x==x_start&&y==y_start){
        Destroy();
    }
    if(mp_right1)state=state_spawn;
}
//------------------------------------------------------------------------------------------//
//Functions---------------------------------------------------------------------------------\\
//------------------------------------------------------------------------------------------//
function item_create(_name,_sprite,_price,_description){
    var _len=ds_list_size(item_list);
    var _gridSize=16;
    var _padding=8;
    var _column=_len%2;
    var _row=floor(_len/2);
    var _x=_padding+_column*(_gridSize+_padding);
    var _y=_padding+_row*(_gridSize+_padding);
    with(InstanceCreate(ShopItem,_x,_y,depth-1)){
        spawnx=x;
        spawny=y;
        xoff=0;
        yoff=0;
        surface_x=spawnx+other.xoff+xoff;
        surface_y=spawny+other.yoff+yoff;
        name=_name;
        sprite_index=_sprite;
        price=_price;
        description=_description;
        tooltip=description;
        ds_list_add(other.item_list,id);
    }
}
//Init--------------------------------------------------------------------------------------\\
width=64;
height=displayHeight*0.5;
image_xscale=width/sprite_width;
image_yscale=height/sprite_height;
x_start=displayWidth;
y_start=displayHeight*0.25;
x_end=x_start-width;
y_end=y_start;
x_target=x_end;
y_target=y_end
x=x_start;
y=y_start;
item_list=DsListCreate();
state=state_spawn;
xoff=0;yoff=0;
item_surface=surface_create(width,height);
//------------------------------------------------------------------------------------------//
