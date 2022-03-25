function ArrayFind(_array,_value){
    for(var i=0;i<array_length(_array);i++){
        if _array[i]==_value{
            return i;
        }
    }
}
function ArrayChoose(_array) {
    if(array_length(_array)==0)exit;
    return _array[irandom(array_length(_array)-1)];
}
function ArrayAdd(_arr) {
    for(var i=1;i<argument_count;i++){
        array_push(_arr,argument[i]);
    }
}
//function ArrayDelete(_arr,_pos){
//    for(var i=0,j=0;i<array_length(_arr);i++){
//        if i==_pos continue;
//        _new[j++]=_arr[i];
//    }
//}
function ArrayInsert(_arr,_value,_pos){
    for(var i=array_length(_arr);i>=0;i--){
        if i==_pos{
            _arr[@i]=_value;
            break;
        }else{
            _arr[@i]=_arr[i-1];
        }
    }
    return _arr;
}
function ArrayPop(_arr){
    return _arr[array_length(_arr)-1];
}
function ArrayFromList(_list){
    var _arr;
    for(var i=0;i<ds_list_size(_list);i++){
        _arr[i]=_list[|i];
    }
    return _arr;
}
function ArrayDeleteValue(_arr,_value){
    for(var i=0;i<array_length(_arr);i++)if(_arr[i]==_value){
        ArrayDelete(_arr,i,1);
        return true;
    }
    return false;
}
function ArrayMerge(_arr1,_arr2){
    for(var i=0,j=array_length(_arr1);i<array_length(_arr2);i++){
        _arr1[@j++]=_arr2[i];
    }
}
function ArrayDuplicate(_dest,_src){
    for(var i=0;i<array_length(_src);i++){
        _dest[@i]=_src[i];
    }
}
function ArrayDelete(_arr,_index,_num=1){
    array_delete(_arr,_index,_num);
}
