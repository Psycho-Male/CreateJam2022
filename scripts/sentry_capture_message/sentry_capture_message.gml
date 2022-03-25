/// @description generic sentry event
/// @argument message a message or exception to capture
/// @argument level* the level of the message: SENTRY_CRITICAL, SENTRY_ERROR, SENTRY_WARNING, SENTRY_INFO, SENTRY_DEBUG
/// @argument logger* optional logger name
/// @argument vars* object or instance to dump variables from
function sentry_capture_message() {


	var messageStr = argument[0]
	var level = (argument_count > 1) ? argument[1] : SENTRY_INFO;
	var logger = (argument_count > 2) ? argument[2] : "logger";
	var fetchVars = (argument_count > 3) ? argument[3] : undefined;
	var parseException = (argument_count > 4) ? bool(argument[4]) : false;

	with (sentry_handler) {
		if (is_undefined(endpoint) or is_undefined(dsnPublicKey)) {
			show_error("Sentry Error: No endpoint or key, did you run sentry_init with your DSN, and did it succeed?", true)	
		}
	
		var body = ds_map_create();
		ds_map_add(body, "platform", "other");
		ds_map_add(body, "release", GM_version);
	
		lastUuid4 =  sentry_uuid4_string();
		ds_map_add(body, "event_id", lastUuid4);
		ds_map_add(body, "timestamp", sentry_datetime_string());
		ds_map_add(body, "logger", logger);
		ds_map_add(body, "level", level);
	
		if (parseException) {
			var _str = messageStr;
			var errorType = "ERROR (UNPARSED)";
			var errorModule = "";
			var errorValue = "";
			var stacktrace = ds_map_create();
			var frames = ds_list_create();
		
			do { // single do loop that I can break out of
				var pos = string_pos("###\r\n", _str);
				if (pos == 0) break;
			
				_str = string_delete(_str, 1, pos+4);
				pos = string_pos(" in", _str)
				if (pos == 0) break;
			
				errorType = string_copy(_str, 1, pos);
		
				_str = string_delete(_str, 1, pos+3);
				pos = string_pos("\r\n\r\n", _str);
				if (pos == 0) break;
			
				errorModule = string_replace_all(string_copy(_str, 1, pos-1), "\r\n", " ");
		
				_str = string_delete(_str, 1, pos+3);
				pos = string_pos("\r\n", _str);
				if (pos == 0) break;
			
				errorValue = string_copy(_str, 1, pos);
	
				_str = string_delete(_str, 1, pos+1);
				var at = false;
	
				while (string_pos("\r\n", _str) != 0) {
					pos = string_pos("\r\n", _str);
					var line = string_copy(_str, 1, pos);
					_str = string_delete(_str, 1, pos+1);
		
					var linePos = string_pos(" (line ", line);
					var bracketPos = string_pos(")", line);
					if (linePos*bracketPos == 0) continue;
				
					if (at = true) continue; // skips the first stack trace line if first stack context already provided
					if (string_copy(line, 1, 4) == " at " ){
						at = true; // pre-providing first stack context
						line = string_delete(line, 1, 4);
						linePos -= 4;
						bracketPos -= 4;
					}
				
					var _func = string_copy(line, 1, linePos-1);
					var lineText = string_copy(line, linePos+7, bracketPos-linePos-7);
					var lineNumber = real(string_digits(lineText));
					var context = string_delete(line, 1, bracketPos+3);
			
					var frame = ds_map_create();
					// further split function
				
					pos = string_pos("called from - ", _func);
					if (pos != 0) {
						_func = string_delete(_func, pos, pos+14);
					}
				
					if (string_pos("gml_Script_", _func) == 1) { // a script
						_func = string_delete(_func, 1, 11);
						ds_map_add(frame, "module", _func);
					}
					else if (string_pos("gml_Object_", _func) == 1) { // an object
						_func = string_delete(_func, 1, 11);
						// find second-last _ in object name
						var f1 = 1
						var f2 = 1;
						var underscore = 1;
						var max_iter = 100;
						do {
							f1 = f2;
							f2 = underscore;
							var stub = string_copy(_func, underscore, string_length(_func)-underscore+1)
							var find = string_pos("_", stub);
							underscore += find;
					
						} until (find == 0 or max_iter-- <=0)
				
						var module = string_delete(_func, 1, f1-1);
						_func = string_copy(_func, 1, f1-2);
						ds_map_add(frame, "module", module);
					}
		
					ds_map_add(frame, "_func", _func);
					ds_map_add(frame, "lineno", lineNumber);
				
					if (context != "") ds_map_add(frame, "context_line", context);
				
					ds_list_insert(frames, 0, frame);
					ds_list_mark_as_map(frames, 0);
				}
			} until (true);
		
			ds_map_add_list(stacktrace, "frames", frames);
		
			var exception = ds_map_create();
			var values = ds_list_create();
			var value = ds_map_create();
			ds_map_add(value, "type", errorType);
			ds_map_add(value, "value", errorValue + "\r\n\r\n" + errorModule + "\r\n\r\n" + messageStr);
			ds_map_add(value, "module", errorModule);
			ds_map_add_map(value, "stacktrace", stacktrace);
			ds_list_add(values, value);
			ds_list_mark_as_map(values, ds_list_size(values)-1);
			ds_map_add_list(exception, "values", values);
		
			ds_map_add_map(body, "exception", exception);
		}
		else {
			var message = ds_map_create();
			ds_map_add(message, "formatted", messageStr)
			ds_map_add_map(body, "sentry.interfaces.Message", message);
	
			// stacktrace
			var stacktrace = ds_map_create();
			var frames = ds_list_create();
			var stack = debug_get_callstack();
			for (var i=1; i<array_length_1d(stack); i++) { // ignore first item to avoid reporting this _func
				var script = stack[i];
				var linePos = string_pos(":", script);
				if (linePos) {
				
					var frame = ds_map_create();
					var _func = string_copy(script, 1, linePos-1);
					var lineText = string_copy(script, linePos+1, string_length(script)-linePos);
					var lineNumber = real(string_digits(lineText));
		
					if (string_pos("gml_Script_", _func) == 1) { // a script
						_func = string_delete(_func, 1, 11);
						ds_map_add(frame, "module", _func);
					}
					else if (string_pos("gml_Object_", _func) == 1) { // an object
						_func = string_delete(_func, 1, 11);
						// find second-last _ in object name
						var f1 = 1
						var f2 = 1;
						var underscore = 1;
						var max_iter = 100;
						do {
							f1 = f2;
							f2 = underscore;
							var stub = string_copy(_func, underscore, string_length(_func)-underscore+1)
							var find = string_pos("_", stub);
							underscore += find;
					
						} until (find == 0 or max_iter-- <=0)
				
						var module = string_delete(_func, 1, f1-1);
						_func = string_copy(_func, 1, f1-2);
						ds_map_add(frame, "module", module);
					}
		
					ds_map_add(frame, "_func", _func);
					ds_map_add(frame, "lineno", lineNumber);
				
					ds_list_insert(frames, 0, frame);
					ds_list_mark_as_map(frames, 0);
				}
			}
			ds_map_add_list(stacktrace, "frames", frames);
			ds_map_add_map(body, "stacktrace", stacktrace);
		}
	
		ds_map_add_map(body, "sdk", precomputeSdk);
		ds_map_add_map(body, "tags", precomputeTags);
		ds_map_add_map(body, "extra", precomputeExtra);
		ds_map_add_map(body, "contexts", precomputeContexts);
		ds_map_add_map(body, "user", precomputeUser);
	
		// breadcrumbs
		var breadcrumbs = ds_map_create();
		ds_map_add_list(breadcrumbs, "values", breadcrumbsList);
		ds_map_add_map(body, "breadcrumbs", breadcrumbs);
	
		// variables
		var variables = ds_map_create();
		if (not is_undefined(fetchVars)) {
			var names = variable_instance_get_names(fetchVars);
			for (var i=0; i<array_length_1d(names); i++) {
				var key = names[i];
				var value = variable_instance_get(fetchVars, key);
				ds_map_add(variables, key, value);
			}
		}
		ds_map_add_map(precomputeContexts, "vars", variables);
	
		var json_str = json_encode(body);
	
		ds_map_replace(breadcrumbs, "values", undefined);
		ds_map_replace(body, "sdk", undefined);
		ds_map_replace(body, "tags", undefined);
		ds_map_replace(body, "extra", undefined);
		ds_map_replace(body, "contexts", undefined);
		ds_map_replace(body, "user", undefined);
		ds_map_replace(precomputeContexts, "vars", undefined);
		ds_map_destroy(variables);
		ds_map_destroy(body);
	
		var buff = buffer_create(string_byte_length(json_str), buffer_fixed, 1);
		buffer_write(buff, buffer_text, json_str);
		var compress = buffer_compress(buff, 0, buffer_tell(buff));
		buffer_delete(buff);
	
		if (ds_map_find_value(options, "backup_before_send") == true) {
			var filename = gmSentryLogFilePrefix + lastUuid4;
			buffer_save(compress, filename);
		}
	
		var asyncId = sentry_request(compress);
	
		buffer_delete(compress);
	
		ds_map_add(requestMap, string(asyncId), lastUuid4);
		return lastUuid4;
	}

	return undefined;


}
