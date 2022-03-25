var asyncId = ds_map_find_value(async_load,"id")
var requestUuid = ds_map_find_value(requestMap, string(asyncId));

if (not is_undefined(requestUuid)) {
	var asyncStatus = ds_map_find_value(async_load,"status")
	var asyncHttpStatus = ds_map_find_value(async_load, "http_status")
	var asyncResult = ds_map_find_value(async_load, "result")
	
	// check status
	if (asyncHttpStatus == 200) { // success
		ds_map_add(resultMap, requestUuid, asyncResult);
		ds_map_delete(requestMap, string(asyncId));
		
		if (ds_map_find_value(options, "backup_autoclean") == true) {
			var filename = gmSentryLogFilePrefix + requestUuid;
			if (file_exists(filename)) {
				file_delete(filename);
			}
		}
	}
	else if (asyncStatus == 1) { // downloading
		// don't need to do anything
	}
	else if (asyncStatus == 0 or not is_undefined(asyncHttpStatus)) { // completed, but returned non-200 status
		var resText = ""
		if (not is_undefined(asyncHttpStatus)) {
			resText += string_format(asyncHttpStatus, 0, 0) + " - ";
		}
		if (not is_undefined(asyncResult)) {
			resText += asyncResult;
		}
		ds_map_add(errorMap, requestUuid, resText);
		ds_map_delete(requestMap, string(asyncId));
	}
	else { // falure
		show_debug_message("Async event returned failure:")
		show_debug_message(json_encode(async_load))
	}

}