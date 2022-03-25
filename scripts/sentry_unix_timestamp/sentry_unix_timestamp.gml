/// @description  Gets current Unix timestamp
/// @returns      a unix timestamp
function sentry_unix_timestamp() {

	var oldTz = date_get_timezone();
	date_set_timezone(timezone_utc);
	var timestamp = floor((date_current_datetime() - 25569) * 86400);
	date_set_timezone(oldTz);
	return timestamp;




}
