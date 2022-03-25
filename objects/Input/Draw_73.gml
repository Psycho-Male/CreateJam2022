//CONTROLLER DEBUG(DON'T DELETE)---------------------------------------------------------------------------//
/*draw_set_color(c_white);
draw_set_halign(fa_left);
var _x = 32;
var _y = 32;//+(160 * i);
i = 0;
for(var i=0;i<gamepad_get_device_count();i++)if(gamepad_is_connected(i)){
    draw_text(_x, _y, "Gamepad Slot - " +str(i));  _y+=20;
    draw_text(_x, _y, "Gamepad Type - " +str(gamepad_get_description(i))); _y+=20;
    draw_text(_x, _y, "Left H Axis - "  +str(gamepad_axis_value(i, gp_axislh))); _y+=20;
    draw_text(_x, _y, "Left V Axis - "  +str(gamepad_axis_value(i, gp_axislv))); _y+=20;
    draw_text(_x, _y, "Right H Axis - " +str(gamepad_axis_value(i, gp_axisrh))); _y+=20;
    draw_text(_x, _y, "Right V Axis - " +str(gamepad_axis_value(i, gp_axisrv))); _y+=20;
    draw_text(_x, _y, "Fire Rate - "    +str(gamepad_button_value(i, gp_shoulderrb))); _y+=20;
    draw_text(_x, _y, "PADU - "         +str(gamepad_button_check(i, gp_padu))); _y+=20;
    draw_text(_x, _y, "PADD - "         +str(gamepad_button_check(i, gp_padd))); _y+=20;
    draw_text(_x, _y, "PADL - "         +str(gamepad_button_check(i, gp_padl))); _y+=20;
    draw_text(_x, _y, "PADR - "         +str(gamepad_button_check(i, gp_padr))); _y+=20;
    draw_text(_x, _y, "FACE1 - "        +str(gamepad_button_check(i, gp_face1))); _y+=20;
    draw_text(_x, _y, "FACE2 - "        +str(gamepad_button_check(i, gp_face2))); _y+=20;
    draw_text(_x, _y, "FACE3 - "        +str(gamepad_button_check(i, gp_face3))); _y+=20;
    draw_text(_x, _y, "FACE4 - "        +str(gamepad_button_check(i, gp_face4))); _y+=20;
    draw_text(_x, _y, "SHOULDERL - "    +str(gamepad_button_check(i, gp_shoulderl))); _y+=20;
    draw_text(_x, _y, "SHOULDERR - "    +str(gamepad_button_check(i, gp_shoulderr))); _y+=20;
    draw_text(_x, _y, "SHOULDERLB - "   +str(gamepad_button_check(i, gp_shoulderlb))); _y+=20;
    draw_text(_x, _y, "SHOULDERRB - "   +str(gamepad_button_check(i, gp_shoulderrb))); _y+=20;
    draw_text(_x, _y, "GAMEPAD ACTIVE - "+str(GPAD.active)); _y+=20;
    _x = 256; _y = 32+20+20;
    draw_text(_x, _y, "Pressed JOY RV - "       +str(GPS1.lv_val); _y+=20;
    draw_text(_x, _y, "Pressed JOY RH - "       +str(GPS1.lh_val); _y+=20;
    draw_text(_x, _y, "Pressed JOY RV - "       +str(GPS1.rv_val); _y+=20;
    draw_text(_x, _y, "Pressed JOY RH - "       +str(GPS1.rh_val); _y+=20;
    draw_text(_x, _y, "Pressed PADU - "         +str(GP1.up     ); _y+=20;
    draw_text(_x, _y, "Pressed PADD - "         +str(GP1.down   ); _y+=20;
    draw_text(_x, _y, "Pressed PADL - "         +str(GP1.left   ); _y+=20;
    draw_text(_x, _y, "Pressed PADR - "         +str(GP1.right  ); _y+=20;
    draw_text(_x, _y, "Pressed FACE1 - "        +str(GP1.confirm); _y+=20;
    draw_text(_x, _y, "Pressed FACE2 - "        +str(GP1.action1); _y+=20;
    draw_text(_x, _y, "Pressed FACE3 - "        +str(GP1.action2); _y+=20;
    draw_text(_x, _y, "Pressed FACE4 - "        +str(GP1.action3); _y+=20;
    draw_text(_x, _y, "Pressed SHOULDERL - "    +str(GP1.       );_y+=20;
    draw_text(_x, _y, "Pressed SHOULDERR - "    +str(GP1.       );_y+=20;
    draw_text(_x, _y, "Pressed SHOULDERLB - "   +str(GP1.       );_y+=20;
    draw_text(_x, _y, "Pressed SHOULDERRB - "   +str(GP1.       );_y+=20;
    _x = 512; _y = 32+20+20;
    draw_text(_x, _y, "JOY UP - "       +str(GAMEPAD.joyu)); _y+=20;
    draw_text(_x, _y, "JOY DOWN - "     +str(GAMEPAD.joyd)); _y+=20;
    draw_text(_x, _y, "JOY LEFT - "     +str(GAMEPAD.joyr)); _y+=20;
    draw_text(_x, _y, "JOY RIGHT - "    +str(GAMEPAD.joyl)); _y+=20;
    draw_text(_x, _y, "PADU - "         +str(GAMEPAD.padu)); _y+=20;
    draw_text(_x, _y, "PADD - "         +str(GAMEPAD.padd)); _y+=20;
    draw_text(_x, _y, "PADL - "         +str(GAMEPAD.padl)); _y+=20;
    draw_text(_x, _y, "PADR - "         +str(GAMEPAD.padr)); _y+=20;
    draw_text(_x, _y, "FACE1 - "        +str(GAMEPAD.face1)); _y+=20;
    draw_text(_x, _y, "FACE2 - "        +str(GAMEPAD.face2)); _y+=20;
    draw_text(_x, _y, "FACE3 - "        +str(GAMEPAD.face3)); _y+=20;
    draw_text(_x, _y, "FACE4 - "        +str(GAMEPAD.face4)); _y+=20;
    draw_text(_x, _y, "SHOULDERL - "    +str(GAMEPAD.sl)); _y+=20;
    draw_text(_x, _y, "SHOULDERR - "    +str(GAMEPAD.sr)); _y+=20;
    draw_text(_x, _y, "SHOULDERLB - "   +str(GAMEPAD.slb)); _y+=20;
    draw_text(_x, _y, "SHOULDERRB - "   +str(GAMEPAD.srb)); _y+=20;
    //Trace("gamepad_button_check(i, gp_padu) = "+str(gamepad_button_check(i, gp_padu)));
}
/*var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;){
    if gamepad_is_connected(i){
        draw_text(32, 32 + (i * 32), gamepad_get_description(i));
    }else{
        draw_text(32, 32 + (i * 32), "No Gamepad Connected");
    }
}
//else
//    {
//    draw_text(xx, yy+220, "Gamepad Slot - "+str(i));
//    draw_text(xx, yy+240, "Gamepad not connected"+str(gamepad_get_description(i)));
//    }
//}
