if(Exists(item_purchased)){
    var _x=round(x/16)*16;
    var _y=round(y/16)*16;
    DrawSetColor(c_green,0.8);
    draw_circle(_x+8,_y+8,item_purchased.range,false);
    DrawSetColor(c_white,1);
}
