for(var i=0;i<ds_list_size(notification_list);i++){
    notification_list[|i][1]--;
    var _text=notification_list[|i][0];
    var _timer=notification_list[|i][1];
    if(_timer<=0){
        ds_list_delete(notification_list,i);
    }else{
        scribble(_text).align(fa_center,fa_middle).blend(c_white,_timer/notification_timer).draw(guiHCenter,displayHeight*0.08+linebreak*i);
    }
}
fade.draw();
