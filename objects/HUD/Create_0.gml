if(room==Init){
    HUD_POSITIONS[?hud_key]=[x,y];
    Destroy();
    exit;
}else{
    var _pos=HUD_POSITIONS[?hud_key];
    if(IsDefined(_pos)){
        x=_pos[0];
        y=_pos[1];
    }else{
        Trace(Stringify("Hud position couldn't found: ",hud_key,"<-->",objectName),LOGLEVEL.WARN);
    }
}
