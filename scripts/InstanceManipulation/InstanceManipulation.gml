function MoveTowards(_inst,_spd,_target,_facing,_offset) {//offset is array
    _target=ReturnInstanceTarget(_target);
    if _target==noone
    var _dir_x, _dir_y;
    var _dist_x, _dist_y;
    var _steps_x, _steps_y;
    var _is_character=VIExists(_inst,"hsp");
    //---------------------------------------------------------------------------------------------------------//
    if(!Exists(_inst)){Trace("Instance doesn't exists: "+str(_inst),LOGLEVEL.ERROR);}
    with _inst {
        _teleport=_spd==0;
        if IsDefined(_offset) {
            _dist_x=abs(_target.x+_offset[0]-x);
            _dist_y=abs(_target.y+_offset[1]-y);
            if _teleport||(_dist_x<=_spd&&_dist_y<=_spd) {
                _inst.x=_target.x+_offset[0];
                _inst.y=_target.y+_offset[1];
                if _is_character{
                    if _teleport{InstanceTeleported(_inst,_facing);}
                    else if IsDefined(_facing){SetFacing(_inst,_facing);}
                }
                return true; // Stop
            }
            var _vec2=Vector2(_spd,x,y,_target.x+_offset[0],_target.y+_offset[1]);
        } else {
            _dist_x=abs(_target.x-x);
            _dist_y=abs(_target.y-y);
            if _teleport||(_dist_x<=_spd&&_dist_y<=_spd) {
                _inst.x=_target.x;
                _inst.y=_target.y;
                if _is_character{
                    if _teleport{InstanceTeleported(_inst,_facing);}
                    else if IsDefined(_facing){SetFacing(_inst,_facing);}
                }
                return true; // Stop
            }
            var _vec2=Vector2(_spd,x,y,_target.x,_target.y);
        }
        if _is_character {
            hsp=_vec2[0];
            vsp=_vec2[1];
        } else {
            x+=_vec2[0];
            y+=_vec2[1];
        }
    }
    return undefined;
}
function MoveCloseTo(_inst,_spd,_target,_distance,_facing) {//ALL ARRAY
    var _done_count=0;
    var _len=array_length(_inst);
    for(var i=0;i<_len;i++) {
        if point_distance(_inst[i].x,_inst[i].y,_target[i].x,_target[i].y)<=_distance[i] {
            _done_count++;
        } else {
            if IsUndefined(_facing) _facing[i]=-1;
            MoveTowards(_inst[i],_spd[i],_target[i],_facing[i]);
        }
    }
    if _done_count==_len {
        return true;
    } else {
        return undefined;
    }
}
function MoveTowardsSimple(_x1,_y1,_x2,_y2,_spd) {
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
