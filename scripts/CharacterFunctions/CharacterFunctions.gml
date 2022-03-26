function StateChange(_state,_sprite=sprite_index){
    if(_sprite!=sprite_index){
        image_index=0;
    }
    switch(_state){
        default:
        state=_state;
        break;
    }
}
function InstanceMoveTowardsSimple(_x1,_y1,_x2,_y2,_spd) {
    var _dir=point_direction(_x1,_y1,_x2,_y2);
    var _rad=degtorad(_dir);
    var _cos=_x2-_x1<0?cos(_rad):cos(_rad);
    var _sin=_y2-_y1<0?sin(_rad):sin(_rad);
    if point_distance(_x1,_y1,_x2,_y2)<=_spd {
        return true;
    } else {
        var _xspd=_spd*_cos;
        var _yspd=-1*_spd*_sin;
        hsp=_xspd;
        vsp=_yspd;
        return false;
    }
}
