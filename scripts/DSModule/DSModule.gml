function DsGridCreate(_width,_height) {
    return ds_grid_create(_width,_height);
}
function DsGridAdd(_index,_value,_mode) {
    if _mode==0 { // Horizontal
        var _width = ds_grid_width(_index);
        for(var i=0;i<_width;i++) {
            if IsUndefined(_index[#i,0]) {
                _index[#i,0] = _value;
                return i;
            }
        }
    } else if _mode==1 { // Vertical
        var _height = ds_grid_height(_index);
        for(var i=0;i<_height;i++) {
            if IsUndefined(_index[#0,i]) {
                _index[#0,i] = _value;
                return i;
            }
        }
    }
    Trace("Failed DsGridAdd.");
    return -1;
}
function DsGridAppend(_index,_value,_mode,_pos) {
    var _width=ds_grid_width(_index);
    var _height=ds_grid_height(_index);
    if _mode==0 { // Horizontal
        _pos=SetUndefined(_pos,_height-1);
        ds_grid_resize(_index,_width,_height-1);
        _index[#_width-1,_pos]=_value;
        return _width-1;
    } else if _mode==1 { // Vertical
        _pos=SetUndefined(_pos,_width-1);
        ds_grid_resize(_index,_width-1,_height);
        _index[#_pos,_height-1]=_value;
        return _height-1;
    }
    Trace("Failed DsGridAppend.");
    return -1;
}
function DsGridAddAppend(_index,_value,_mode) {
    Trace("DsGridAddAppend running.");
    if DsGridAdd(_index,_mode,_value)==-1 {
        Trace("DsGridAddAppend failed adding, trying appending.");
        return DsGridAppend(_index,_mode,_value)
    }
}
function DsListFindDeteleIndex(_index,_value) {
    var __value=ds_list_find_index(_index,_value);
    if __value==-1 return false;
    ds_list_delete(_index,__value);
    return true;
}
function DsGridResizeSet(_index,_width,_height,_value) {
    ds_grid_resize(_index,_width,_height);
    ds_grid_clear(_index,_value);
}
function DsMapCreate() {
    var _map=ds_map_create();
    var _cs=debug_get_callstack();
    return _map;
}
function DsMapClear(_index) {
    if _index==-1{
        Trace("ds_map doesn't exists.",LOGLEVEL.INFO);
    }else{
        ds_map_clear(_index);
    }
}
function DsMapWriteDestroy(_index) {
    var _str=ds_map_write(_index);
    DsMapDestroy(_index);
    return _str;
}
function DsMapDestroy(_index) {
    if(IsDefined(_index)){
        ds_map_destroy(_index)
    }else{
        //Trace("ds_map doesn't exists.",LOGLEVEL.INFO);
    }
}
function DsListCreate() {
    var _list=ds_list_create();
    return _list;
}
function DsListClear(_index) {
    try ds_list_clear(_index);
    catch(e) {
        Trace(e.message);
        Trace(e.longMessage);
        Trace(e.script);
        Trace(e.stacktrace);
        Trace("_index: "+str(_index));
        DsListLog();
    }
}
function DsListSize(_index) {
    try {
        if(IsUndefined(_index)||_index==-1) return 0;
        else                                return ds_list_size(_index);
    } catch(e) {
        Trace(e.message);
        Trace(e.longMessage);
        Trace(e.script);
        Trace(e.stacktrace);
        Trace("_index: "+str(_index));
        DsListLog();
        return 0;
    }
}
function DsListAdd() {
    for(var i=1;i<argument_count;i++) {
        ds_list_add(argument[0],argument[i]);
    }
}
function DsListInsert(_index,_pos,_value) {
    try ds_list_insert(_index,_pos,_value);
    catch(e) {
        Trace(e.message);
        Trace(e.longMessage);
        Trace(e.script);
        Trace(e.stacktrace);
        Trace("_index: "+str(_index));
        DsListLog();
        return 0;
    }
}
function DsListWriteDestroy(_index) {
    var _str=ds_list_write(_index);
    DsListDestroy(_index);
    return _str;
}
function DsListDestroy(_index) {
    if IsDefined(_index){
        ds_list_destroy(_index)
    }else{
        //Trace("ds_list doesn't exists.",LOGLEVEL.INFO);
    }
}
function DsGridDestroy(_index) {
    if IsDefined(_index){
        ds_grid_destroy(_index)
    }else{
        Trace("ds_grid doesn't exists.",LOGLEVEL.INFO);
    }
}
function DsListAddAsMap(_index,_map) {
    DEBUG.ds_maps[array_length(DEBUG.ds_maps)]=_map;
    DsListAdd(_index,_map);
    ds_list_mark_as_map(_index,DsListSize(_index)-1);
}
function DsCheck() {
    Trace("Checking data structures...",LOGLEVEL.INFO);
    var _missing_ds_found=false;
    for(var i=0;i<array_length(LISTINDEXARR);i++) {
        if IsDefined(LISTINDEXARR[i])&&!ds_exists(LISTINDEXARR[i],ds_type_list) {
            Trace(Stringify("LISTOFLISTS[",i,"] doesn't exists! DsList ",LISTOFLISTS[i]),LOGLEVEL.INFO);
            _missing_ds_found=true;
        }
    }
    for(var i=0;i<array_length(MAPINDEXARR);i++) {
        if IsDefined(MAPINDEXARR[i])&&!ds_exists(MAPINDEXARR[i],ds_type_map) {
            Trace(Stringify("LISTOFMAPS[",i,"] doesn't exists! DsMap ",LISTOFMAPS[i]),LOGLEVEL.INFO);
            _missing_ds_found=true;
        }
    }
    //if _missing_ds_found GameController.game_unstable=true;
}
function DsGridValuePos(_index,_value) {//return array
    var _width=ds_grid_width(_index);
    var _height=ds_grid_height(_index);
    var _arr;
    _arr[0]=ds_grid_value_x(_index,0,0,_width-1,_height-1,_value);
    _arr[1]=ds_grid_value_y(_index,0,0,_width-1,_height-1,_value);
    if _arr[0]==-1||_arr[1]==-1 return undefined
    else                        return _arr;
}
function DsListRandom(_list) {
    var _len=DsListSize(_list);
    return _list[|irandom(_len-1)];
}
function DsQueueCreate() {
    return ds_queue_create();
}
function DsQueueDestroy(_index) {
    ds_queue_destroy(_index);
    return -1;
}
function DsListChoose(_index) {
    var _len=ds_list_size(_index);
    for(var i=0,j=irandom(_len-1);i<_len;i++) if i==j return _index[|i];
}
function DsListMoveToTop(_list,_value){
    var _position=ds_list_find_index(_list,_value);
    if _position!=-1{
        for(var i=_position;i<ds_list_size(_list)-1;i++){
            _list[|i]=_list[|i+1];
        }
        _list[|i]=_value;
    }else{
        Trace("Value to move top couldn't found in ds_list: "+str(_list),LOGLEVEL.WARN);
    }
}
function DsListAddBottom(_list,_value){
    for(var i=ds_list_size(_list);i>0;i--){
        _list[|i]=_list[|i-1];
    }
    _list[|0]=_value;
}
function DsListDequeue(_list){
    var _pos=ds_list_size(_list)-1;
    var _value=_list[|_pos];
    ds_list_delete(_list,_pos);
    return _value;
}
function DsListEmpty(_list){
    return ds_list_size==0;
}
function DsListPop(_list){
    var _value=_list[|ds_list_size(_list)-1];
    ds_list_delete(_list,ds_list_size(_list)-1);
    return _value;
}
function GetDetailsFromMap(_map,_arr,_named=true){
    var _text="";
    for(var i=0;i<array_length(_arr);i++){
        if IsDefined(_map[?_arr[i]]){
            var _value=_map[?_arr[i]];
            var _isList=is_real(_arr[i])&&!is_array(_arr[i]);
            if !_isList&&!IsString(_value)&&_value==""{continue;}//To prevent adding empty values names
            if _named{_text+=_arr[i]+":";}
            if _isList{
                for(var j=0;j<ds_list_size(_value);j++){
                    _text+=_value[|j];
                    if j<ds_list_size(_value)-1{_text+=",";}
                }
                _text+="\n";
            }else{
                _text+=str(_value)+"\n";
            }
        }
    }
    return _text;
}
