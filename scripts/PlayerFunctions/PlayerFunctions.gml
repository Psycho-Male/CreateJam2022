#macro plId         PLAYER.id
#macro plHp         PLAYER.hp
#macro plHpMax      PLAYER.hp_max
#macro plGold       PLAYER.gold

globalvar PLAYER;PLAYER={
    id:noone,
    hp_max:25,
    hp:25,
    water_amount:0,
    gold:75,
}
function HurtPlayer(_damage){
    plHp-=_damage;
    if(plHp<=0){
        SfxPlay(olmek2);
        GoTo(rm_death);
    }
}
