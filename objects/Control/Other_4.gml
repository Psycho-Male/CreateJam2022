if(room==Init){
    room_goto(MainMenu);
    exit;
}
if(RoomIsPlayable()){
    Trace("room: "+room_get_name(room));
    var _cellSize=16;
    GRID=mp_grid_create(0,0,room_width,room_height,_cellSize,_cellSize);
    mp_grid_add_rectangle(GRID,0,0,room_width,room_height);
    var _tilemap=layer_tilemap_get_id(layer_get_id("Road"));
    for(var i=0;i<room_width;i+=_cellSize)for(var j=0;j<room_height;j+=_cellSize){
        if(tilemap_get_at_pixel(_tilemap,i,j)){
            mp_grid_clear_rectangle(GRID,i+1,j+1,i+_cellSize-1,j+_cellSize-1);
        }
    }
    SaveGame();
}
