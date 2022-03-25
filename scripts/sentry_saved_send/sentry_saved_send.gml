/// @description  Sends saved files
function sentry_saved_send() {

	with (sentry_handler) {
	
		var file = file_find_first(gmSentryLogFilePrefix + "*", 0);
		while (file != "") {
			var lastUuid4 = string_delete(file, 1, string_length(gmSentryLogFilePrefix));
		
			if (string_length(lastUuid4) == 32) {
				var buff = buffer_load(file);
				var asyncId = sentry_request(buff);
				buffer_delete(buff);
	
				ds_map_add(requestMap, string(asyncId), lastUuid4);
			}
			file = file_find_next();
		}
	
		file_find_close();
	
	}



}
