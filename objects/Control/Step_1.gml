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
    if(kp_o)HurtPlayer(100);
}
if(room==rm_death){
    GuiTrace("death_room_timer.time: ",death_room_timer.time);
    if(death_room_timer.countdown()){
        ButtonStartGame();
    }
}
if(
