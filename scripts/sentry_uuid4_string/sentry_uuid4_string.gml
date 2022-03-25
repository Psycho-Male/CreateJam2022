/// @description generates UUID4 (no dashes)
function sentry_uuid4_string() {

	// we cheat and use md5
	var uuid = md5_string_utf8(string(current_time) + string(date_current_datetime()) + string(random(1000000)));
	uuid = string_set_byte_at(uuid, 13, ord("4"));
	uuid = string_set_byte_at(uuid, 17, ord(choose("8", "9", "a", "b")));
	return uuid;


}
