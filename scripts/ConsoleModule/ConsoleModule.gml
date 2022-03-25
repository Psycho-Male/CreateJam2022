/*globalvar CONSOLE;CONSOLE={
    open:false,
    command:["",""],
    result:["",""],
    n:1,
    sprite:spr_console_bg,
    x:0,
    y:180,
    y_target:180,
    run:function(){
        if(kp_anykey){
            if(!open&&ReturnSpecialChr(keyboard_key)==":"){
                activate();
            }else if(kp_escape){
                deactivate();
            }else if(open){
                if(kp_up){
                    n=clamp(n+1,1,array_length(command)-1);
                    Trace("n: "+str(n));
                }else if(kp_down){
                    n=clamp(n-1,1,array_length(command)-1);
                    Trace("n: "+str(n));
                }else if(kp_enter&&command[n]!=""){
                    try{
                        var _result=parse(command[n]);
                        ArrayAdd(result,_result);
                        command[++n]="";
                    }catch(e){
                        TraceException(e);
                        command[n]="";
                    }
                }else if(kp_backspace){
                    command[n]=string_delete(command[n],string_length(command[n]),1);
                }else{
                    var _key=ReturnSpecialChr(keyboard_key);
                    if(_key!=-1){
                        if(!kc_shift)_key=lowercase(_key);
                        command[n]+=_key;
                    }
                }
            }
        }
        y=LerpSnap(y,y_target,.15,1);
    },
    draw:function(){
        draw_sprite(sprite,0,x,y);
        scribble(result[n]).blend(c_red,1).draw(x+6,y+6);
        scribble(command[n-1]).blend(c_blue,1).draw(x+6,y+18);
        scribble(command[n]).blend(c_green,1).draw(x+6,y+32);
    },
    activate:function(){
        open=true;
        y_target=180-sprite_get_height(spr_console_bg);
    },
    deactivate:function(){
        open=false;
        y_target=180;
    },
    parse:function(_str){
        var _dotPos=string_pos(".",_str);
        var _paranPos=string_pos("(",_str);
        if(_dotPos!=0||_paranPos!=0){
            if(_paranPos!=0&&(_dotPos==0||_dotPos>_paranPos)){
                var _func;_func[0]=AssetIndex(string_copy(_str,1,_paranPos-1));
                var _inner=string_delete(_str,1,_paranPos);
                _inner=string_replace(_inner,")","");
                if(_inner!=""){
                    var _args=ParseSeperator(_inner,",");
                    ArrayMerge(_func,_args);
                }
                return ScriptExecute(_func);
            }else{
                var _first=string_copy(_str,1,_dotPos-1);
                _first=parse(_first);
                _str=string_delete(_str,1,_dotPos);
                //Check if we still have a dot
                _dotPos=string_pos(".",_str);
                if(_dotPos!=0){
                    var _second=string_copy(_str,1,_dotPos-1);
                    _second=parse(_second);
                    _str=string_delete(_str,1,_dotPos);
                    _second=VGet(_first,_second);
                    return VGet(_second,_str);
                }else{
                    VGet(_first,_str);
                }
            }
        }else if(AssetIndex(_str)!=-1){
            return AssetIndex(_str);
        }else if(IsMacro(_str)){
            return ParseMacro(_str);
        }else if(letters(_str)==""){
            return real(_str);
        }
    }
}
