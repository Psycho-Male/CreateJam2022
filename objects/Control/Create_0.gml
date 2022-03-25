if(ExcessiveInstance())exit;
var _controllers=tag_get_asset_ids("Controllers",asset_object);
for(var i=0;i<array_length(_controllers);i++){
    with(InstanceCreate(_controllers[i])){
        persistent=true;
    }
}
fade={
    alpha:0,
    spd:.1,
    target:1,
    goto:function(){
        if(target==1&&alpha==target){
            target=0;
            room_goto(ROOM.target);
        }else if(target==0&&alpha==target){
            target=1;
            ROOM.target=undefined;
        }
        alpha=Approach(alpha,target,spd);
    },
    draw:function(){
        draw_sprite_ext(spr_fade,0,0,0,Camera.view_width,Camera.view_height,0,c_white,alpha);
    },
}
