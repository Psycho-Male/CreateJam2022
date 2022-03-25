bgm_list=ds_list_create();
amb_list=ds_list_create();
sfx_vol=1;
bgm_vol=1;
amb_vol=1;
if(file_exists("options.ini")){
    ini_open("options.ini");
    sfx_vol=ini_read_real("Sound","SFX",1);
    bgm_vol=ini_read_real("Sound","BGM",1);
    amb_vol=ini_read_real("Sound","AMB",1);
    ini_close();
    
}
audio_group_load(aug_bgm);
audio_group_load(aug_sfx);
audio_group_load(aug_amb);
audio_group_set_gain(aug_bgm,bgm_vol,0);
audio_group_set_gain(aug_sfx,sfx_vol,0);
audio_group_set_gain(aug_amb,amb_vol,0);
//------------------------------------------------------------------------------------------\\
//Maybe create a list for each room with ambiance and music, check on room switch           ||
//------------------------------------------------------------------------------------------//
