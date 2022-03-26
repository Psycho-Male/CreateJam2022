if(IsDefined(ROOM.target))fade.goto();
if(kp_escape){
    ROOM.target=MainMenu;
}
if(room==MainMenu){
    if(DEVELOPER&&kp_enter)GoTo(START_ROOM);
}
if(kc_control&&kp_d){
    DEBUG.enabled=!DEBUG.enabled;
}
if(DEBUG.enabled){
    GuiTrace("Debug enabled.");
}
