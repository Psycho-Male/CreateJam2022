/// @description  deletes any saved logifles
function sentry_saved_delete() {

	with (sentry_handler) {
	
		var file = file_find_first(gmSentryLogFilePrefix + "*", 0);
		while (file != "") {
			file_delete(file);
			file = file_find_next();
		}
		file_find_close();
	
	}


}
