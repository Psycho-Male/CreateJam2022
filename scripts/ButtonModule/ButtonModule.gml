//--------------------------------------------------\\
//OPTION BUTTONS                                    ||
//--------------------------------------------------//
function ButtonGetScale(){
    text="Scale: "+str(wdScale);
}
function ButtonBgm(){
    var _input=Input.gui_x<x?.1:-.1;
    with(AudioManager){
        bgm_vol-=_input;
        bgm_vol=clamp(bgm_vol,0,1);
        audio_group_set_gain(aug_bgm,bgm_vol,0);
    }
    SaveAudio();
}
function ButtonGetBgmVol(){
    text="BGM Vol: "+str(round(AudioManager.bgm_vol*10));
}
function ButtonAmb(){
    var _input=Input.gui_x<x?.1:-.1;
    with(AudioManager){
        amb_vol-=_input;
        amb_vol=clamp(amb_vol,0,1);
        audio_group_set_gain(aug_amb,amb_vol,0);
    }
    SaveAudio();
}
function ButtonGetAmbVol(){
    text="AMB Vol: "+str(round(AudioManager.amb_vol*10));
}
function ButtonSfx(){
    var _input=Input.gui_x<x?.1:-.1;
    with(AudioManager){
        sfx_vol-=_input;
        sfx_vol=clamp(sfx_vol,0,1);
        audio_group_set_gain(aug_sfx,sfx_vol,0);
    }
    SaveAudio();
}
function ButtonGetSfxVol(){
    text="SFX Vol: "+str(round(AudioManager.sfx_vol*10));
}
//------------------------------------------------------------------------------------------\\
//                                                                                          ||
//------------------------------------------------------------------------------------------//
function ButtonDiscord(){
    url_open("https://discord.gg/e28ByRr");
}
function ButtonResetSave(){
    if(file_exists("save.txt")){
        file_delete("save.txt");
        GameReset();
    }
}
function ButtonStartGame(){
    var _room=LoadGame();
    if(IsDefined(_room)){
        GoTo(_room);
    }else{
        GoTo(START_ROOM);
    }
}
function ButtonOptions(){
    room_goto(Options);
}
function ButtonKeyBindings(){
    room_goto(KeyBindings);
}
function ButtonAudio(){
    room_goto(Audio);
}
function ButtonCredits(){
    room_goto(Credits);
}
function ButtonExitGame(){
    game_end();
}
function ButtonScreenMode(){
    Camera.window_resize(wdScale-1,!Camera.fullscreen);
}
function ButtonScreenScale(){
    var _input=Input.gui_x<x?-1:1;
    Camera.window_resize(wdScale+_input);
}
function ButtonOptionsRevert(){
    with(Camera){
        read_options();
        window_resize();
    }
}
function ButtonOptionsSaveAndExit(){
    Camera.save_options();
    room_goto(MainMenu);
}
function ButtonMenu(){
    if(Exists(Menu)){
        with(Menu){
            if(state==state_despawn){
                state=state_spawn;
            }else{
                state=state_despawn;
            }
        }
    }else{
        InstanceCreate(Menu);
    }
}
function ButtonResume(){
    with(Menu)state=state_despawn;
}
function ButtonMainMenu(){
    GoTo(MainMenu);
}
