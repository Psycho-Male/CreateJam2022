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
function item_create(_name,_plantObject,_sprite,_price,_description){
    var _len=ds_list_size(item_list);
    var _gridSize=16;
    var _padding=8;
    var _column=_len%2;
    var _row=floor(_len/2);
    var _x=_padding+_column*(_gridSize+_padding);
    var _y=_padding+_row*(_gridSize+_padding+8);
    with(InstanceCreate(ShopItem,_x,_y,depth-1)){
        spawnx=x;
        spawny=y+8;
        xoff=0;
        yoff=0;
        surface_x=spawnx+other.xoff+xoff;
        surface_y=spawny+other.yoff+yoff;
        name=_name;
        sprite_index=_sprite;
        plant_object=_plantObject;
        price=_price;
        description=_description;
        tooltip=description;
        ds_list_add(other.item_list,id);
    }
}
function copy_item(_src,_dest){
    with(_dest){
        name=_src.name;
        sprite_index=_src.sprite_index;
        price=_src.price;
        plant_object=_src.plant_object;
        description=_src.description;
        var _id=InstanceCreate(plant_object);
        range=_id.range;
        Destroy(_id);
    }
}
function item_purchase(_item){
    var _price=_item.price
    if(IsDefined(plId.item_in_hand)){
    }else if(plGold<_price){
        Notification("[c_red]Not enough gold![/c]");
    }else{
        plGold-=_price;
        var _newItem=InstanceCreate(ItemInHand,Input.gui_x,Input.gui_y,depth-1);
        copy_item(_item,_newItem);
        return _newItem;
    }
    return noone;
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
//Items
item_create("Delici",Delici1,spr_delici_icon    ,1,"Delici(Low Efficient for Farm, Piercing Projectile, Mid Attack Speed, Mid Damage, Mid Area)");
item_create("Engine",Engine1,spr_engine_icon    ,1,"Engine(High Efficient for Farm, None Attack)");
item_create("Eniste",Eniste1,spr_eniste_icon    ,1,"Eniste(Mid Efficient for Farm, Increases Attack Speed, Increases Damage, Mid Area)");
item_create("Kapan" ,Kapan1 ,spr_kapan_icon     ,1,"Kapan(Low Efficient for Farm, One Shot, Low Attack Speed, High Damage, Low Area)");
item_create("Nar"   ,Nar1   ,spr_nar_icon       ,1,"Nar(Low Efficient for Farm, Area off Effect, Mid Attack Speed, Low Damage, Low Area)");
item_create("Casual",Casual1,spr_casual_icon    ,1,"Casual(Mid Efficient for Farm. Mid Attack Speed, Mid Damage, High Area)");
//------------------------------------------------------------------------------------------//
