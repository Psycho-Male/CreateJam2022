function PercentageOf(_value,_maxValue){
    var i=100/_maxValue;
    _maxValue*=i;
    _value*=i;
    return _value/_maxValue*100;
}
//function HorizontalTiledPosition(_x,_y,_pos,_width,_sprite,_gap=0) {
//    var _sc_ss=sprite_get_width(_sprite)*guiScale/2;
//    var _sc_gap=(sprite_get_width(_sprite)-_gap)*guiScale;
//    var _row=floor(_pos/_width);
//    var _column=_pos%_width;
//    return [_sc_ss+_x+_column*_sc_gap,_sc_ss+_y+_row*sc_gap];
//}
//function VerticalTiledPosition(_x,_y,_pos,_height,_sprite,_gap=0) {
//    var _sc_ss=sprite_get_width(_sprite)*guiScale/2;
//    var _sc_gap=(sprite_get_width(_sprite)-_gap)*guiScale;
//    var _row=floor(_pos/_height);
//    var _column=_pos%_height;
//    return [_sc_ss+_x+_column*_sc_gap,_sc_ss+_y+_row*sc_gap];
//}
function IRandomEx(_min,_max,_exclude){
    var _result=irandom_range(_min,_max-1);
    if(_result)>=_exclude{_result++;}
    return _result;
}

