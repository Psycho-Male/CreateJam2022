//States------------------------------------------------------------------------------------\\
function state_idle(){
    sprite=sprite_idle;
    if(attack_cd.countdown()){
        state=state_attack;
    }
}
function state_attack(){
    sprite=sprite_attack;
    if(AnimationComplete()){
        state=state_idle;
    }
}
//------------------------------------------------------------------------------------------//
//Functions---------------------------------------------------------------------------------\\
function levelup(){
    switch(level){
        case 1:
        var _sprite=string_replace(sprite_get_name(sprite_index),"Bebek","Genc");
        Trace("_sprite: "+string(_sprite));
        sprite_index=AssetIndex(_sprite);
        attack_cd=GetTimer(45);
        break;case 2:
        var _sprite=string_replace(sprite_get_name(sprite_index),"Genc","Olgun");
        Trace("_sprite: "+string(_sprite));
        sprite_index=AssetIndex(_sprite);
        attack_cd=GetTimer(30);
        break;
    }
    level++;
    damage++;
}
function water(){
    thirsty=false;
    thirst_timer.reset();
}
function sell(){
    switch(level){
        case 1:
        plGold+=sell_price1;
        break;case 2:
        plGold+=sell_price2;
        break;case 3:
        plGold+=sell_price3;
        break;
    }
    Destroy();
}
//------------------------------------------------------------------------------------------//
//Init--------------------------------------------------------------------------------------\\
level=1;
water_amount=0;
grow_timer1=GetTimer(60*1);
grow_timer2=GetTimer(60*2);
thirst_timer=GetTimer(180,false);
damage=1;
thirsty=false;
sprite_index=sprite_idle;
attack_cd=GetTimer(60);
//------------------------------------------------------------------------------------------//
