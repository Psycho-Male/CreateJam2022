randomize();
Print("InitSystem()");
sentry_init("https://71cc9a39c91a49949f10999c0331c086@o432685.ingest.sentry.io/5385806");
Print("Set font: "+font_get_name(ftMain));
draw_set_font(ftMain);
scribble_font_set_default("fnt_main");
surface_depth_disable(true);
//------------------------------------------------------------------------------------------\\
//                                                                                          ||
//------------------------------------------------------------------------------------------//
globalvar VERSION;VERSION="build:"+str(GM_build_date)+" v:"+str(GM_version);
globalvar HUD_POSITIONS;HUD_POSITIONS=DsMapCreate();
globalvar SYSTEM;SYSTEM = {
    mobile                  : false,
    browser                 : false,
    unix                    : false,
}
var _pcount=parameter_count();
var _config=os_get_config();
globalvar LOGGER;LOGGER="default";
for(var i=0;i<_pcount;i++)Print("Parameter["+str(i)+"]: "+str(parameter_string(i)));
globalvar DEVELOPER;DEVELOPER=os_get_config()=="Default"||parameter_count()>=3;
SYSTEM.mobile=os_type=os_android||os_type==os_ios;
SYSTEM.unix=os_type==os_linux;
SYSTEM.browser=os_browser!=-1;
Print("Operating System: "+str(os_type));
if DEBUG.logging{
    if file_exists("debug.txt") {
        file_delete("debug.txt");
    }
    if file_exists("output.log") {
        file_delete("output.log");
    }
}
Print("Version:             "+str(VERSION));
Print("Config:              "+str(os_get_config()));
Print("Log file directory:  "+str(filename_path("debug.txt")));
Print("parameter_count:     "+str(parameter_count())+"\n");
Print("Logging active:      "+yn(DEBUG.logging));
Print("Debug mode active:   "+yn(DEBUG.enabled));
