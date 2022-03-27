function AnimationComplete(f=image_index,_fs=sprite_get_speed(sprite_index)*image_speed,_fc=image_number){
    //if(!animation_started){
    //    animation_started=true;
    //    return false;
    //}
    if(image_speed==0)return false;
    if(_fs==0){return false;}
    var _complete=f+_fs>=_fc;
    return _complete;
}
function AnimationHitFrame(_hitFrame,_frame=image_index,_speed=sprite_get_speed(sprite_index)*image_speed){
    return(_frame-_speed/2<=_hitFrame&&_hitFrame<=_frame+_speed/2);
}
function AnimationFrameTime(_sprite=sprite_index,_spd=sprite_get_speed(_sprite)*image_speed){
    _frameCount=sprite_get_number(_sprite);
    if(_spd<1){
        return _frameCount/_spd;
    }else{
        return _frameCount*_spd;
    }
}
function HitFrameBroadcastCheck(_id=id){
    if(layer_instance_get_instance(event_data[?"element_id"])==_id){
        if(event_data[?"event_type"]=="sprite event"){
            switch event_data[?"message"]{
                case "Dig":
                SfxPlay([bicme,bicme2]);
                target_grid=update_target_grid();
                if(!tilemap_get_at_pixel(GRID,target_grid[0],target_grid[1])
                 &&!place_meeting(target_grid[0],target_grid[1],WaterSource)
                 &&!place_meeting(target_grid[0],target_grid[1],EnemyTarget)){
                    tilemap_set_at_pixel(TILEMAP,5,target_grid[0],target_grid[1]);
                }
                return true;
                case "Attack":
                return true;
            }
        }
    }
    return false;
}
