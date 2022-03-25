if(IsDefined(ROOM.target))fade.goto();
if(kp_escape){
    ROOM.target=MainMenu;
}
if(room==MainMenu){
    if(DEVELOPER&&kp_enter)GoTo(START_ROOM);
}
