function DrawSetAlign(_halign=draw_get_haling(),_valign=draw_get_valign()){
    draw_set_halign(_halign);
    draw_set_valign(_valign);
}
function DrawSetColor(_color=draw_get_color(),_alpha=draw_get_alpha()){
    draw_set_color(_color);
    draw_set_alpha(_alpha);
}
function DrawTextOutline(_x,_y,_txt,_scale,_innercolor=c_white,_outercolor=c_black,_outersize=1,_alpha=1){
    //draw_text_outline(x, y, text, xScale, yScale, angle, c1, c2, c3, c4, a, outlineColor, outlineSize);
    var _offset=max(1,drawEvent*guiScale);
    var _os=_outersize*_offset;
    _txt=scribble(_txt).transform(_scale,_scale,0).align(draw_get_halign(),draw_get_valign()).blend(_outercolor,_alpha);
    _txt.draw(_x-_os,_y    );
    _txt.draw(_x+_os,_y    );
    _txt.draw(_x    ,_y-_os);
    _txt.draw(_x    ,_y+_os);
    _txt.blend(_innercolor,_alpha).draw(_x,_y);
    return [_txt.get_width,_txt.get_height];
}
function DrawTextTransformed(_x,_y,_text,_scale){
    draw_text_transformed(_x,_y,_text,_scale,_scale,0);
}
function DrawTextExtTransformed1(_x,_y,_text,_sep,_width,_scale){
    draw_text_ext_transformed(_x,_y,_text,_sep,_width,_scale,_scale,0);
}
function DrawTextArray(_x,_y,_text) {
    for(var i=0;i<array_length(_text);i++){
        draw_text(_x[i],_y[i],_text[i]);
    }
}
function DrawTextArrayTransformed(_x,_y,_text,_scale,_angle=0){
    for(var i=0;i<array_length(_text);i++) {
        draw_text_transformed(_x[i],_y[i],_text[i],_scale,_scale,_angle);
    }
}
function DrawTextArrayExtTransformed(_x,_y,_text,_sep=ftScaled,_width,_scale,_angle=0){
    var _offset=0;
    var _height=string_height(_text[0]);
    _width/=_scale;
    var _sep2=_sep/_scale;
    for(var i=0;i<array_length(_text);i++) {
        var _h=string_height_ext(_text[i],_sep,_width);
        draw_text_ext_transformed(_x,_y+_sep*i+_offset,_text[i],_sep2,_width,_scale,_scale,_angle);
        if _h>_height {
            _offset+=(round(_h/_height)-1)*_sep2;
        }
    }
}
function SpriteGetMaskWidth(_sprite){
    var _left=sprite_get_bbox_left(_sprite);
    var _right=sprite_get_bbox_right(_sprite);
    return _right-_left;
}
function SpriteGetMaskHeight(_sprite){
    var _top=sprite_get_bbox_top(_sprite);
    var _bottom=sprite_get_bbox_bottom(_sprite);
    return _top-_bottom;
}
function DrawSlider(_x,_y,_sprite,_frame,_cur,_max,_widthTotal=sprite_get_width(_sprite),_imageBlend=c_white){
    _width=_widthTotal*(PercentageOf(_cur,_max)/100);
    draw_sprite_ext(_sprite,_frame,_x,_y,_width/_widthTotal,1,0,_imageBlend,1);
}
function Notification(_text,_time=Control.notification_timer){
    with(Control){
        ds_list_add(notification_list,[_text,_time]);
    }
}
