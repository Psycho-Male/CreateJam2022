if(object_index==Knob){
    if(clicked){
        image_index=Input.gui_x<x?3:4;
    }else if(highlight){
        image_index=Input.gui_x<x?1:2;
    }else{
        image_index=0;
    }
}else{
    if(clicked){
        image_index=2;
    }else if(highlight){
        image_index=1;
    }else{
        image_index=0;
    }
}
if(IsDefined(runtime_function)){
    runtime_function();
}
