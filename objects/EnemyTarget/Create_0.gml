function state_idle(){
}
function state_hurt(){
    if(AnimationComplete()){
        state=state_idle;
        sprite_index=sprite_idle;
    }
}
function hurt(){
    state=state_hurt;
    image_index=0;
    sprite_index=sprite_hurt;
}
state=state_idle;
