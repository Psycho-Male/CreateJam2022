#macro plId         PLAYER.id
#macro plHp         PLAYER.hp
#macro plHpMax      PLAYER.hp_max
#macro plGold       PLAYER.gold

globalvar PLAYER;PLAYER={
    id:noone,
    hp_max:100,
    hp:100,
    water_amount:0,
    gold:100,
}
function HurtPlayer(_damage){
    plHp-=_damage;
    if(plHp<=0){
        GoTo(rm_death);
    }
}
