/// @description  Returns the last UUID4
/// @returns      string uuid4
function sentry_last_event_id() {

	with (sentry_handler) {
		return lastUuid4;	
	}

	return undefined;


}
