if(key_code==""){
    name="";
    key="";
}else{
    key=KEY.inputs[key_code];
    name=INPUT_NAMES[key_code];
}
t=0;tt=60;
function update(){
    if(key_code!=""){
        text=name+": "+ChrName(key);
        ini_open("controls.ini");
        ini_write_real("Keyboard",name,key);
    }
}
update();
clickable=true;
wait_for_key=false;
function activate(){
    with(object_index){
        wait_for_key=false;
        update();
    }
    wait_for_key=true;
    if(AudioExists(sfx))SfxPlay(sfx);
}
highlight=false;
clicked=false
