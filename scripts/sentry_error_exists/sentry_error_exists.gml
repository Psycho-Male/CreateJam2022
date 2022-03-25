/// @description  Check if UUID is available in resultMap
/// @argument     uuid	UUID to check
/// @returns      true if a UUID is available
function sentry_error_exists(argument0) {

	with (sentry_handler) {
		return not is_undefined(ds_map_find_value(errorMap, string(argument0)))
	}


}
