depth=-y;
state();
if(level==1){
    if(grow_timer1.countdown()){
        levelup();
    }
}else if(level==2){
    if(grow_timer2.countdown()){
        levelup();
    }
}
if(thirst_timer.countdown()){
    thirsty=true;
}
if(thirsty){
    image_speed=1;
    image_blend=c_yellow;
}else{
    image_speed=1;
    image_blend=c_white;
}
