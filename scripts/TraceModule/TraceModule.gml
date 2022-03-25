enum LOGLEVEL {
    ALL,
    TRACE,
    DEBUG,
    INFO,
    WARN,
    ERROR,
    FATAL,
    EXCEP,
    NONE
}
globalvar DEBUG;DEBUG={
    console_active      :false,
    enabled             :false,
    mode                :0,
    logging             :false,
    interface_enabled   :false,
    //start_room          :rm_debug,
    instance            :-1,
    variable            :-1,
    text                :"",
}
if DEBUG.logging{
    if file_exists("debug.txt") {
        file_delete("debug.txt");
    }
    if file_exists("output.log") {
        file_delete("output.log");
    }
}
function Trace(_text,_loglevel=LOGLEVEL.TRACE) {
    _text=string(_text);
    Print(_text);
    if DEBUG.logging {
        //TraceLog(_loglevel,_text);

        var _timetxt = str(date_current_datetime());
        var _callstack = debug_get_callstack();
        var _method = _callstack[1]; // 1st item should be the thing that called logger
        // make debug string
        switch(_loglevel) {
                default:
                case LOGLEVEL.TRACE: var _leveltxt="|TRACE|"; break;
                case LOGLEVEL.DEBUG: var _leveltxt="|DEBUG|"; break;
                case LOGLEVEL.INFO:  var _leveltxt="|INFO |"; break;
                case LOGLEVEL.WARN:  var _leveltxt="|WARN |"; break;
                case LOGLEVEL.ERROR: var _leveltxt="|ERROR|"; break;
                case LOGLEVEL.FATAL: var _leveltxt="|FATAL|"; break;
                case LOGLEVEL.EXCEP: var _leveltxt="|EXCEP|"; break;
        }
        if _loglevel==LOGLEVEL.ERROR||_loglevel==LOGLEVEL.FATAL{
            for(var i=2,cs=debug_get_callstack();i<array_length(cs)-1;i++){
                _method+=cs[i];
            }
        }
        var _debugstr=Stringify("{",_timetxt,"} [",_leveltxt,"]: ",_text,"-->(",_method,")");
        TxtAppend("output.log",_debugstr,true);
        //for(var i=0,_a=debug_get_callstack();i<array_length(_a);i++) _text+=str(_a[i])+"/";
    } else {
        if IsDefined(_loglevel) {
            switch _loglevel {
                case LOGLEVEL.INFO:
                sentry_add_breadcrumb("trace",SENTRY_INFO,_text);
                break;case LOGLEVEL.WARN:
                sentry_add_breadcrumb("trace",SENTRY_WARNING,_text);
                break;case LOGLEVEL.ERROR:
                sentry_add_breadcrumb("trace",SENTRY_ERROR,_text);
                break;case LOGLEVEL.FATAL:case LOGLEVEL.EXCEP:
                sentry_add_breadcrumb("trace",SENTRY_FATAL,_text);
                break;case LOGLEVEL.DEBUG:
                sentry_add_breadcrumb("trace",SENTRY_DEBUG,_text);
                break;
            }
        }
    }
}
function TracePop(_text) {
    Trace(_text);
    if SYSTEM.mobile    run_notification_pop(_text);
    else                show_message(_text);
}
function GuiTrace(){
    var _text="";
    for(var i=0;i<argument_count;i++){
        _text+=str(argument[i]);
    }
    DEBUG.text+=_text+"\n";
}
function Stringify() {
    var _str=""
    for (var i=0;i<argument_count;i++) _str+=str(argument[i]);	
    return _str;
}
function TraceException(_exception,_message) {
    if IsDefined(_message) Trace(_message,LOGLEVEL.EXCEP);
    var _txt=_exception.message+"\n"+_exception.longMessage;
    TxtWrite("crash",_exception.message+"\n"+_exception.longMessage);
    Trace("Message: "+_exception.message,LOGLEVEL.EXCEP);
    Trace("Long Message: "+_exception.longMessage,LOGLEVEL.EXCEP);
    Trace("Script: "+_exception.script,LOGLEVEL.EXCEP);
    for(var i=0;i<array_length(_exception.stacktrace);i++) {
        TxtAppend("error","Stacktrace["+str(i)+"]: "+_exception.stacktrace[i],true);
        _txt+="Stacktrace["+str(i)+"]: "+_exception.stacktrace[i];
        Trace("Stacktrace["+str(i)+"]: "+_exception.stacktrace[i],LOGLEVEL.EXCEP);
    }
    if LOGGER!="DEV"{sentry_capture_message(_txt,SENTRY_CRITICAL);}
}
function TraceCS(_text,_loglevel=LOGLEVEL.TRACE,_cslevel=3) {
    var _cs=debug_get_callstack();
    var _msg="";
    for(var i=1;i<min(array_length(_cs),_cslevel);i++) {
        _msg+=str(_cs[i])+"\n";
    }
    _msg+=_text;
    Trace(_msg,_loglevel);
}
function TraceExt() {
    // Usage: TraceExt(text, argument1, argument2..);
    // Looks for global variable first, instance variable second
    var _text = argument0;
    for(var i = 1; i < argument_count - 1; i++) {
        if string_lower(argument[i]) == argument[i] {
            if variable_instance_exists(id, argument[i]) {
                _text += argument[i] + ": " + variable_instance_get(id, argument[i]);
            } else {
                Trace("No valid variable found: " +	argument[i]);
            }
        } else {
            if variable_global_exists(argument[i]) {
                _text += argument[i] + ": " + variable_global_get(argument[i]);
            } else {
                Trace("No valid variable found: " +	argument[i]);
            }
        }
    }
}
function TraceLog() { //Level, message, scope
    // self start log level
    if (not variable_global_exists("logger_level_d92e137f5ebb170c9c2f0c3dcebee238")) {
            variable_global_set("logger_level_d92e137f5ebb170c9c2f0c3dcebee238", debug_mode ? LOGLEVEL.ALL : LOGLEVEL.DEBUG); 
    }
    var minlevel = variable_global_get("logger_level_d92e137f5ebb170c9c2f0c3dcebee238");

    // get incoming log level, early return if it's too low
    var loglevel=argument_count>0?argument[0]:LOGLEVEL.TRACE;
    if (loglevel<minlevel) return;

    // get the log message
    var logmessage = argument_count > 1 ? string(argument[1]) : "";

    // the logname is either a string, or comes from the scoped logger
    var scope = argument_count > 2 ? argument[2] : "default";
    var extraargs = [];
    if (is_array(scope)) {
        var loggername = string(scope[0]);

        // fetch extra args
        var len = floor((array_length_1d(scope)-1)/2)*2
        array_copy(extraargs, 0, scope, 1, len)
    }// else var loggername = string(scope)
    else {
        var _str=debug_get_callstack()[2];
        var _pos=string_pos(":",_str);
        var loggername=string_delete(_str,_pos,string_length(_str)-_pos+1);
    }

    // grab the rest of the extra args
    var extralen = array_length_1d(extraargs);
    for (var i=3; i+1<argument_count; i+=2) { // I don't think you can array_copy from argument
            extraargs[extralen++] = argument[i];
            extraargs[extralen++] = argument[i+1];
    }
    var echoargs = (argument_count > i) ? argument[i] : false; // secret argument! list argument is whether to echo extra parameters in name or not

    // get loglevel text
    switch(loglevel) {
            default:
            case LOGLEVEL.TRACE: var leveltxt = "TRACE"; break;
            case LOGLEVEL.DEBUG: var leveltxt = "DEBUG"; break;
            case LOGLEVEL.INFO:  var leveltxt = "INFO";  break;
            case LOGLEVEL.WARN:  var leveltxt = "WARN";  break;
            case LOGLEVEL.ERROR: var leveltxt = "ERROR"; break;
            case LOGLEVEL.FATAL: var leveltxt = "FATAL"; break;
    }

    // get unix time
    var timetxt = string_format((date_current_datetime() - 25569) * 86400, 0, 3); // to string containing unix time, 3 decimal places

    // process call stack
    var _method = "";
    if (1) {
            var callstack = debug_get_callstack();
            var _method = callstack[1]; // 1st item should be the thing that called logger
    }

    // make debug string
    var debugstr = "["+timetxt+" "+loggername+"] "+leveltxt+": "+logmessage;

    // extra props come in pairs
    var xmlpropstr = "";
    var extrastr = " { ";
    for (var i=0; i<extralen; i+=2) {
            var name = string_replace_all(string(extraargs[i]), @'"', "&quot;");
            var value = string_replace_all(string(extraargs[i+1]), @'"', "&quot;");
            xmlpropstr += @'<log4j:data name="'+name+@'" value="'+value+@'" />';
            extrastr += (i>0?", ":"")+string(extraargs[i])+": "+string(extraargs[i+1]);
    }
    extrastr += " }";

    if (extralen > 0) {
            debugstr += extrastr;
            if (echoargs) {
                    logmessage += extrastr;
            }
    }

    //Print(debugstr);

    // sanitize various things
    logmessage = string_replace_all(string_replace_all(logmessage, ">", "&gt;"), "<", "&lt;");
    loggername = string_replace_all(loggername, @'"', "&quot;");

    //var _str = @'<log4j:event logger="'+loggername+@'" timestamp="'+timetxt+@'" level="'+leveltxt+@'" thread="'+str(debug_get_callstack()[2])+@'">
    var _str = @'<log4j:event logger="'+loggername+@'" timestamp="'+timetxt+@'" level="'+leveltxt+@'" thread="[main]">
    <log4j:message>'+logmessage+@'</log4j:message>
    <log4j:locationInfo _method="'+_method+@'" class="" file="" />
    <log4j:properties>'+xmlpropstr+@'</log4j:properties>
    </log4j:event>
    ';

    // self-start. We use this to set a global variable of the socket that is hopefully doesn't collide with any existing variables
    // also, setting it this way makes sure the variable doesn't show up in autocomplete
    if (not variable_global_exists("logger_socket_d92e137f5ebb170c9c2f0c3dcebee238")) {
            variable_global_set("logger_socket_d92e137f5ebb170c9c2f0c3dcebee238", network_create_socket(network_socket_udp)); 
    }
    var socket = variable_global_get("logger_socket_d92e137f5ebb170c9c2f0c3dcebee238");

    var len = string_byte_length(_str);
    var buff = buffer_create(len, buffer_fixed, 1);
    buffer_write(buff, buffer_text,_str);
    network_send_udp_raw(socket, "127.0.0.1", 7071, buff, len);
    buffer_delete(buff);

}
function logger_bind() {
    var scoped_logger=argument_count>0&&is_array(argument[0])?argument[0]:[];
    var j=array_length_1d(scoped_logger)
    for (var i=1;i+1<argument_count;i+=2) {
        scoped_logger[@ j+i-1] = string(argument[i]);
        scoped_logger[@ j+i] = string(argument[i+1]);
    }
    return scoped_logger;
}
function logger_scoped() {
    var loggername=argument_count>0?string(argument[0]):"default";
    var scoped_logger=[loggername]
    for (var i=1;i+1<argument_count;i+=2) {
        scoped_logger[@i]=string(argument[i]);
        scoped_logger[@i+1]=string(argument[i+1]);
    }
    return scoped_logger;
}
function logger_scoped_copy() {
    var new_logger=argument_count>0?argument[0]:[];
    var new_name=argument_count>1?string(argument[1]):"default";
    new_logger[0]=new_name
    var j=array_length_1d(new_logger);
    for (var i=2;i+1<argument_count;i+=2) {
        new_logger[j++]=string(argument[i]);
        new_logger[j++]=string(argument[i+1]);
    }
    return new_logger;
}
function logger_set_level(argument0) {
    variable_global_set("logger_level_d92e137f5ebb170c9c2f0c3dcebee238",argument0);
}
function logger_text() {
    var _str=""
    for (var i=0;i<argument_count;i++) _str+=string(argument[i]);	
    return _str;
}
