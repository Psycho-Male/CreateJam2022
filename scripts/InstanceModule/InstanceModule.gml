function ExcessiveInstance(){
    if(instance_number(object_index)>1){
        Trace("Excessive instance of: "+object_get_name(object_index)+", destroying...");
        Destroy();
        return true;
    }else return false;
}
function InstanceCreate(_index,_x=0,_y=0,_depth=0){
    //Trace("Create instance: "+object_get_name(_index));
    if IsString(_depth){
        return instance_create_layer(_x,_y,_depth,_index);
    }else{
        return instance_create_depth(_x,_y,_depth,_index);
    }
}
function NearestNth(_inst,_obj,n) {
    var _prio,_nearest;
    _prio=ds_priority_create();
    n=min(max(1,n),instance_number(_obj));
    with(_obj){
        ds_priority_add(_prio,id,distance_to_point(_inst.x,_inst.y));
    }
    repeat(n){
        _nearest=ds_priority_delete_min(_prio);
    }
    ds_priority_destroy(_prio);
    return _nearest;
}
function InstanceToggle(_x,_y,_depth,_inst) {
    if instance_exists(_inst) {
        Destroy(_inst);
    } else {
        if is_string(_depth) {
            instance_create_layer(_x, _y, _depth, _inst);
        } else {
            instance_create_depth(_x, _y, _depth, _inst);
        }
    }
}
function InstanceFade(_inst,_spd) {
    with(_inst){
        if(image_alpha>0) image_alpha-=_spd;
        else              Destroy();
    }
}
function IsInst(_int){
    if !IsReal(_int){return false;}
    return _int>=100000;
}
function Inst(_int) {
    return IsInst(_int)?_int:instance_find(_int,0);
}
function Destroy(){
    if(argument_count==0){
        instance_destroy(id);
    }else{
        for(var i=0;i<argument_count;i++){
            if Exists(argument[i]){
                instance_destroy(argument[i]);
            }
        }
    }
}
function DestroyArray(_arr){
    for(var i=0;i<array_length(_arr);i++){Destroy(_arr[i]);}
}
function Exists(_int){
    return IsDefined(_int)&&(is_struct(_int)||instance_exists(_int));
}
function VariableSet(_variable,_value,_id){
    if IsDefined(_id){
        if IsStruct(_id){
            VSSet(_id,_variable,_value);
        }else if Exists(_id){
            VISet(Inst(_id),_variable,_value);
        }
    }else{
        VGSet(_variable,_value);
    }
}
function VariableGet(_variable,_id){
    if IsDefined(_id){
        if IsStruct(_id){
            return VSGet(_id,_variable);
        }else if Exists(_id){
            return VIGet(Inst(_id),_variable);
        }
    }else{
        return VGGet(_variable);
    }
}
function SetScale(_scale){
    image_xscale=_scale;
    image_yscale=_scale
}
function InstancePlace(_inst,_x=x,_y=y){
    return instance_place(_x,_y,_inst);
}
function PlaceMeeting(_inst,_x=x,_y=y){
    return place_meeting(_x,_y,_inst);
}
function Find(_index,_num=0){
    return instance_find(_index,0);
}
function Nearest(_index,_x=x,_y=y){
    return instance_nearest(_x,_y,_index);
}
function ControllerCreate(_index){
    if(instance_exists(_index)){
        return instance_find(_index,0);
    }else{
        return instance_create_depth(0,0,0,_index);
    }
}
