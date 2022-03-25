/// @description  Returns correctly formatted datetime string
/// @argument timestamp* timestamp to format
/// @returns      datetime string
function sentry_datetime_string() {

	if (argument_count > 0) {
		var timestamp = argument[0];	
	}
	else {
		var timestamp = date_current_datetime();
	}

	var oldTz = date_get_timezone();
	date_set_timezone(timezone_utc);

	var datetimeString = string_format(date_get_year(timestamp), 4, 0) + "-" +
	                      string_format(date_get_month(timestamp), 2, 0) + "-" +
	                      string_format(date_get_day(timestamp), 2, 0) + "T" +
	                      string_format(date_get_hour(timestamp), 2, 0) + ":" +
	                      string_format(date_get_minute(timestamp), 2, 0) + ":" +
	                      string_format(date_get_second(timestamp), 2, 0)
	datetimeString = string_replace_all(datetimeString, " ", "0");

	date_set_timezone(oldTz);

	return datetimeString;


}
