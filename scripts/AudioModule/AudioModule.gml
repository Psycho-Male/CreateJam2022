function SfxPlayAt(_index,_pos) {
    var _id     = audio_play_sound(_index,aup.sfx,false);
    audio_sound_set_track_position(_id,_pos);
    return _id;
}
function AudioStopSound(_index) {
    //Trace("Stop audio: "+audio_get_name(_index),LOGLEVEL.INFO);
    audio_stop_sound(_index);
}
function AudioEmitterCreate(_falloff_ref=falloffRefDef,_falloff_max=falloffMaxDef,_falloff_factor=falloffFactorDef) {
    var _emit=audio_emitter_create();
    audio_emitter_falloff(_emit,_falloff_ref,_falloff_max,_falloff_factor);
    return _emit;
}
function EmitterPlaySfx(_emitter,_audio,_loop=false) {
    if(IsUndefined(_audio))return noone;
    audio_emitter_position(_emitter,x,y,0);
    return audio_play_sound_on(_emitter,_audio,_loop,aup.sfx);
}
function EmitterPlayEnv(_emitter,_audio,_loop) {
    audio_emitter_position(_emitter,x,y,0);
    return audio_play_sound_on(_emitter,_audio,_loop,aup.env);
}
function AudioTagGetAssets(_tags){
    return TagGetAssets(_tags,asset_sound);
}
function SfxTagPlay(_arr){
    if IsUndefined(_arr){
        Trace("Tag array is undefined.",LOGLEVEL.WARN);
        return false;
    }
    var _assets=tag_get_asset_ids(_arr,asset_sound);
    if array_length(_assets)>0{
        SfxPlay(ArrayChoose(_assets));
        return true;
    }else{
        Trace("Couldn't find any sound for tags: "+str(_arr),LOGLEVEL.WARN);
    }
    return false;
}
function AudioExists(_int){
    return IsDefined(_int)&&audio_exists(_int);
}
function SaveAudio(){
    with(AudioManager){
        ini_open("options.ini");
        ini_write_real("Sound","SFX",sfx_vol);
        ini_write_real("Sound","BGM",bgm_vol);
        ini_write_real("Sound","AMB",amb_vol);
        ini_close();
    }
}
function SfxPlay(_sfx,_loop=false){
    var _sfxVol=AudioManager.sfx_vol;
    if(IsString(_sfx)){
        _sfx=tag_get_asset_ids(_sfx,asset_sound);
    }
    if(IsArray(_sfx)){
        _sfx=ArrayChoose(_sfx);
    }
    var _id=audio_play_sound(_sfx,0,_loop);
    audio_sound_gain(_id,_sfxVol,0);
    return _id;
}
function BgmPlay(_bgm,_loop=true){
    var _bgmVol=AudioManager.bgm_vol;
    if(IsString(_bgm)){
        _bgm=tag_get_asset_ids(_bgm,asset_sound);
    }
    if(IsArray(_bgm)){
        _bgm=ArrayChoose(_bgm);
    }
    var _id=audio_play_sound(_bgm,0,_loop);
    audio_sound_gain(_id,_bgmVol,0);
    return _id;
}
function BgmCrossfade(_bgm,_fadeTime=2800,_loop=true){
    var _bgmVol=AudioManager.bgm_vol;
    audio_group_set_gain(aug_bgm,0,_fadeTime);
    if(!audio_is_playing(_bgm))audio_play_sound(_bgm,0,_loop);
    audio_sound_gain(_bgm,0,0);
    audio_sound_gain(_bgm,1*_bgmVol,_fadeTime);
}
function BgmReset(){
    audio_group_stop_all(aug_bgm);
}
function AmbCrossfade(_amb,_fadeTime,_loop=true){
    var _ambVol=AudioManager.bgm_vol;
    audio_group_set_gain(aug_amb,0,_fadeTime);
    if(!audio_is_playing(_amb))audio_play_sound(_amb,0,_loop);
    audio_sound_gain(_amb,0,0);
    audio_sound_gain(_amb,1*_ambVol,_fadeTime);
}
function AmbReset(){
    audio_group_stop_all(aug_amb);
}
