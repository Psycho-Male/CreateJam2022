event_inherited();
if(wait_for_key){
    if(t%tt>tt*.75){
        text=name+": |";
    }else if(t%tt>tt*.5){
        text=name+": \\";
    }else if(t%tt>tt*.25){
        text=name+": --";
    }else{
        text=name+": /";
    }
    if(kp_escape){
        wait_for_key=false;
    }else if(kp_anykey){
        wait_for_key=false;
        key=keyboard_key;
        KEY.inputs[key_code]=key;
        update();
    }
    t++;
}
