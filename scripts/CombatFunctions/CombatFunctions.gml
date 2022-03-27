function ApplyDamage(){
}
function GetHitbox(_owner=id,_x=id,_y=id,_width=32*sign(image_xscale)){
}
function ShootProjectile(_owner,_spriteIndex,_damage,_spd,_angle){
    with(InstanceCreate(Projectile,_owner.x,_owner.y,_owner.depth-1)){
        owner=_owner;
        damage=_damage;
        sprite_index=_spriteIndex;
        speed=_spd;
        image_angle=_angle;
        direction=_angle;
    }
}
