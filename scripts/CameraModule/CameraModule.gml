//function OutsideCamera(_inst=id){
//    return (_inst.x<CAMERA.x||_inst.x>CAMERA.right)||(_inst.y<CAMERA.y||_inst.y>CAMERA.bottom);
//}
//function GuiToCameraX(_x){
//    var _result=CAMERA.x+(_x/CAMERA.gui_w)*CAMERA.width;
//    Trace("Gui to Camera x: "+str(_result));
//    return _result;
//}
//function GuiToCameraY(_y){
//    var _result=CAMERA.y+(_y/CAMERA.gui_h)*CAMERA.height;
//    Trace("Gui to Camera y: "+str(_result));
//    return _result;
//}
function CameraFollow(_inst){
    if(Exists(_inst)){
        Camera.locked_on=_inst;
    }else{
        Trace("Instance doesn't exists.",LOGLEVEL.ERROR);
    }
}
function CameraFree(){
    Camera.state=Camera.state_free;
    Camera.locked_on=noone;
}
