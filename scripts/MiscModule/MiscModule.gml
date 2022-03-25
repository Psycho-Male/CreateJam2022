function FindAndExecute(_str){
    var _script=AssetIndex(_str);
    if(script_exists(_script)){
        return _script();
    }else{
        Trace("Script not found: "+str(_str));
    }
}
function GetGMBuildDate(_buildDate=GM_build_date){
    // getBuildDate()
    // get GM_build_date in YYYYMMDDHRMN format
    var yy, mm, dd, h, mn;
    yy = date_get_year(_buildDate);
    mm = date_get_month(_buildDate);
    if (mm < 10) mm = "0" + string(mm);
    dd = date_get_day(_buildDate);
    if (dd < 10) dd = "0" + string(dd);
    hr = date_get_hour(_buildDate);
    if (hr < 10) hr = "0" + string(hr);
    mn = date_get_minute(_buildDate);
    if (mn < 10) mn = "0" + string(mn);
    var _result=(string(yy)+":"+string(mm)+":"+string(dd)+":"+string(hr)+":"+string(mn));
    return _result;
}
function AssetGetName(_str){
    var _type=asset_get_type(_str);
    switch _type{
        case asset_object:
        return object_get_name(asset_get_index(_str));
        case asset_sprite:
        return sprite_get_name(asset_get_index(_str));
        case asset_script:
        return script_get_name(asset_get_index(_str));
        case asset_room:
        return room_get_name(asset_get_index(_str));
        case asset_sound:
        return sound_get_name(asset_get_index(_str));
        default:
        return "";
    }
}
function FileFormatLinux(_str) {
    if string_copy(_str,1,7)!="assets/" {
        _str="assets/"+string_replace_all(string_lower(_str)," ","_");
    }
    Trace("Formatted file for Unix: "+str(_str),LOGLEVEL.INFO);
    return _str;
}
function ClampCycle(_value,_max,_min=0) {//max recrusive
    if _max==0{
        Trace("Max is 0 for ClampCycle.",LOGLEVEL.WARN);
        return 0;
    }
    if _value<_min{return _max-1;}
    return _value%_max;
}
function yn(_bool) {
    return _bool?"Yes":"No";
}
function SetUndefined(_var,_value) {
    if IsDefined(_var) return _var;
    else if IsDefined(_value) return _value;
    Trace("Both values are undefined.",LOGLEVEL.ERROR);
}
function IsDefined(_var){
    return !is_undefined(_var);
}
function TimerStep(_amount=1){
    timer-=GAME.speed*_amount;
}
function VGet(_obj,_var){
    if(IsStruct(_obj))return VSGet(_obj,_var);
    else{
        if(_obj>=100000){
            return VIGet(Find(_obj,0),_var);
        }else{
            return VIGet(_obj,_var);
        }
    }
}
function LerpSnap(_value,_target,_lerpAmount,_snapTresh){
    var _result=lerp(_value,_target,_lerpAmount);
    if(abs(_result-_target)<_snapTresh){
        return _target;
    }
    return _result;
}
function IsGlobal(_str) {
    return string_upper(_str)==_str;
}
function IsStruct(_struct,_id){
    if IsString(_struct) {
        if(IsDefined(_id))_id=id;
        return IsGlobal(_struct)?is_struct(VGGet(_struct)):is_struct(VIGet(_id,_struct));
    }else{
        return is_struct(_struct);
    }
}
function ParseSeperator(_text,_seperator="."){
    var _str=_text;
    var _pos=-1;var _arr=[];
    //var _pos=string_pos(_seperator,_str);
    //if _pos==0 return [_text];
    //var _arr=[string_copy(_str,1,_pos-1)];
    //_str=string_delete(_str,1,_pos);
    //_pos=string_pos(_seperator,_str);
    while _pos!=0{
        //Check if whitespace is inside a bracket
        var n=0;
        var _bracketPosStart=0;var _bracketPosEnd=0;
        var _cBracketPos=0;var _cBracketPosEnd=0;
        var _bracketFound=false;var _cBracketFound=false;
        if _seperator!="("{
            _bracketPosStart=string_pos("(",_str);
            _bracketPosEnd=string_pos(")",_str);
            _bracketFound=_bracketPosStart!=0&&_bracketPosEnd!=0&&_bracketPosStart<_bracketPosEnd;
        }
        //Check if whitespace is inside a curly bracket
        if _seperator!="{"{
            _cBracketPosStart=string_pos("{",_str);
            _cBracketPosEnd=string_pos("}",_str);
            _cBracketFound=(_cBracketPosStart!=0&&_cBracketPosEnd!=0)&&_cBracketPosStart<_cBracketPosEnd;
        }
        _pos=string_pos(_seperator,_str);
        while (_bracketFound&&_bracketPosStart<_pos&&_pos<_bracketPosEnd)
        ||    (_cBracketFound&&_cBracketPosStart<_pos&&_pos<_cBracketPosEnd){
            _pos=StringPosNth(_str,_seperator,n++);
        }
        if _pos==0{break;}
        ArrayAdd(_arr,string_copy(_str,1,_pos-1));
        _str=string_delete(_str,1,_pos);
        _pos=string_pos(_seperator,_str);
    }
    if array_length(_arr)==0{return [_text];}
    _arr[array_length(_arr)]=_str;
    return _arr;
}
function ScriptExecute(_cs){
    var _output=undefined;
    var _len=array_length(_cs)-1;
    switch(_len){
        case 0:_output=script_execute(_cs[0]);break;
        case 1:_output=script_execute(_cs[0],_cs[1]);break;
        case 2:_output=script_execute(_cs[0],_cs[1],_cs[2]);break;
        case 3:_output=script_execute(_cs[0],_cs[1],_cs[2],_cs[3]);break;
        case 4:_output=script_execute(_cs[0],_cs[1],_cs[2],_cs[3],_cs[4]);break;
        case 5:_output=script_execute(_cs[0],_cs[1],_cs[2],_cs[3],_cs[4],_cs[5]);break;
        case 6:_output=script_execute(_cs[0],_cs[1],_cs[2],_cs[3],_cs[4],_cs[5],_cs[6]);break;
        case 7:_output=script_execute(_cs[0],_cs[1],_cs[2],_cs[3],_cs[4],_cs[5],_cs[6],_cs[7]);break;
        case 8:_output=script_execute(_cs[0],_cs[1],_cs[2],_cs[3],_cs[4],_cs[5],_cs[6],_cs[7],_cs[8]);break;
        case 9:_output=script_execute(_cs[0],_cs[1],_cs[2],_cs[3],_cs[4],_cs[5],_cs[6],_cs[7],_cs[8],_cs[9]);break;
        case 10:_output=script_execute(_cs[0],_cs[1],_cs[2],_cs[3],_cs[4],_cs[5],_cs[6],_cs[7],_cs[8],_cs[9],_cs[10]);
        break;
        case 11:_output=script_execute(_cs[0],_cs[1],_cs[2],_cs[3],_cs[4],_cs[5],_cs[6],_cs[7],_cs[8],_cs[9],_cs[10],
        _cs[11]);break;
        case 12:_output=script_execute(_cs[0],_cs[1],_cs[2],_cs[3],_cs[4],_cs[5],_cs[6],_cs[7],_cs[8], _cs[9],_cs[10],
        _cs[11],_cs[12]);break;
        case 13:_output=script_execute(_cs[0],_cs[1],_cs[2],_cs[3],_cs[4],_cs[5],_cs[6],_cs[7],_cs[8],
        _cs[9],_cs[10],_cs[11],_cs[12],_cs[13]);break;
    }
    return _output;
}
function Approach(c,t,a){
    a = abs(a);
    c = c<t ? min(c+a,t) : max(c-a,t);
    return c;
}
function TagContained(_assetName,_tag){
    var _tags=asset_get_tags(_assetName);
    for(var i=0;i<array_length(_tags);i++){
        if(_tags[i]==_tag)return true;
    }
    return false;
}
function GetTimer(_time,_autoReset=true){
    var _timer=new Timer(_time);
    _timer.auto_reset=_autoReset;
    return _timer;
}
function Timer(_time) constructor{
    time_reset=_time;
    time=time_reset;
    auto_reset=true;
    function countdown(){
        if(time<=0){
            if(auto_reset)reset();
            return true;
        }else{
            time--;
            return false;
        }
    }
    function reset(){
        time=time_reset;
    }
}
