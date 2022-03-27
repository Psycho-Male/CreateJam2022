//States------------------------------------------------------------------------------------\\
function state_plant(){
}
function state_idle(){
    sprite_index=sprite_idle;
    GuiTrace("attack_cd.time: ",attack_cd.time);
    if(attack_cd.countdown()){
        var _target=Nearest(Enemy);
        if(distance_to_object(_target)<=range){
            locked_on=_target;
            state=state_attack;
            sprite_index=sprite_attack;
            image_index=0;
        }
    }
}
function state_attack(){
    GuiTrace("State Attack");
    if(AnimationComplete()){
        state=state_idle;
        sprite_index=sprite_idle;
        image_index=0;
    }
}
//------------------------------------------------------------------------------------------//
//Functions---------------------------------------------------------------------------------\\
function levelup(){
    switch(level){
        case 1:
        sprite_idle=AssetIndex(string_replace(sprite_get_name(sprite_idle),"Bebek","Genc"));
        sprite_attack=AssetIndex(string_replace(sprite_get_name(sprite_attack),"Bebek","Genc"));
        attack_cd=GetTimer(45);
        break;case 2:
        sprite_idle=AssetIndex(string_replace(sprite_get_name(sprite_idle),"Genc","Olgun"));
        sprite_attack=AssetIndex(string_replace(sprite_get_name(sprite_attack),"Genc","Olgun"));
        attack_cd=GetTimer(30);
        break;
    }
    if(state==state_idle){
        sprite_index=sprite_idle;
    }else if(state==state_attack){
        sprite_index=sprite_attack;
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
        projectile_sprite=projectile1;
        break;case 2:
        plGold+=sell_price2;
        projectile_sprite=projectile2;
        break;case 3:
        plGold+=sell_price3;
        projectile_sprite=projectile3;
        break;
    }
    Destroy();
}
//------------------------------------------------------------------------------------------//
//Init--------------------------------------------------------------------------------------\\
state=state_plant;
level=1;
water_amount=0;
grow_timer1=GetTimer(3140);
grow_timer2=GetTimer(3140);
thirst_timer=GetTimer(7*60,false);
thirsty=false;
sprite_index=sprite_idle;
attack_cd=GetTimer(60);
projectile_sprite=projectile1;
locked_on=noone;
function buff_reset(){
    buff_aspd=0;
    buff_dmg=0;
    buff_range=0;
}buff_reset();
//------------------------------------------------------------------------------------------//
