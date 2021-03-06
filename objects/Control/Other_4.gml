if(room==Init){
    room_goto(MainMenu);
    exit;
}
play_room=RoomIsPlayable();
if(play_room){
    if(audio_is_playing(bgm_menu)){
        audio_stop_sound(bgm_menu);
    }
    if(!audio_is_playing(bgm_game)){
        BgmPlay(bgm_game);
    }
    plHp=plHpMax;
    Trace("room: "+room_get_name(room));
    //------------------------------------------------------------------------------------------\\
    var _cellSize=16;
    GRID=mp_grid_create(0,0,room_width,room_height,_cellSize,_cellSize);
    mp_grid_add_rectangle(GRID,0,0,room_width,room_height);
    var _tilemap=layer_tilemap_get_id(layer_get_id("Road"));
    for(var i=0;i<room_width;i+=_cellSize)for(var j=0;j<room_height;j+=_cellSize){
        if(tilemap_get_at_pixel(_tilemap,i,j)){
            mp_grid_clear_rectangle(GRID,i+1,j+1,i+_cellSize-1,j+_cellSize-1);
        }
    }
    //------------------------------------------------------------------------------------------//
    //------------------------------------------------------------------------------------------\\
    TILEMAP=layer_tilemap_get_id(layer_get_id("Tiles_1"));
    //------------------------------------------------------------------------------------------//
    SaveGame();
}else{
    if(audio_is_playing(bgm_game)){
        audio_stop_sound(bgm_game);
    }
    if(!audio_is_playing(bgm_menu)){
        BgmPlay(bgm_menu);
    }
}
