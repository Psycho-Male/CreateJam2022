#macro saveData         SAVELOAD.data
#macro saveFile         "save.dat"
globalvar SAVELOAD;SAVELOAD={
    data:ds_map_create(),
    variables:
    [
    ["Gold"         ,PLAYER,"gold"],
    ],
    lists:
    [
    ],
}
function SaveGame(){
    Trace("Save Game.",LOGLEVEL.INFO);
    for(var i=0;i<array_length(SAVELOAD.variables);i++){
        var _arr=SAVELOAD.variables[i];
        saveData[?_arr[0]]=VSGet(_arr[1],_arr[2]);
    }
    for(var i=0;i<array_length(SAVELOAD.lists);i++){
        var _arr=SAVELOAD.lists[i];
        saveData[?_arr[0]]=VSGet(_arr[1],_arr[2]);
    }
    saveData[?"Last Room"]=room_get_name(room);
    saveData[?"Version"]=GAME.version;
    saveData[?"Build Date"]=GAME.build_date;
    BufferWrite(json_encode(saveData),saveFile,true);
}
function LoadGame(){
    Trace("Load Game.",LOGLEVEL.INFO);
    if(!file_exists(saveFile)){
        Trace("Can't find save file, abort.",LOGLEVEL.INFO);
        return undefined;
    }else{
        var _map=JsonDecode(ReadBuffer(saveFile,true));
    }
    if(IsUndefined(_map[?"Version"])||IsUndefined(_map[?"Build Date"])){
        ds_map_destroy(_map);
        return undefined;
    }
    saveData=DsMapDestroy(saveData);
    saveData=JsonDecode(ReadBuffer(saveFile,true));
    for(var i=0;i<array_length(SAVELOAD.variables);i++){
        var _arr=SAVELOAD.variables[i];
        VSSet(_arr[1],_arr[2],saveData[?_arr[0]]);
    }
    for(var i=0;i<array_length(SAVELOAD.lists);i++){
        var _arr=SAVELOAD.lists[i];
        VSSet(_arr[1],_arr[2],LoadListAsArray(saveData[?_arr[0]]));
    }
    LOADING=true;
    return AssetIndex(saveData[?"Last Room"]);
}
