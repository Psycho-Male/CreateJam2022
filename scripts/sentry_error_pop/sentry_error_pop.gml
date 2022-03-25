/// @description  Pops UUID from resultMap
/// @argument     uuid	UUID to check
/// @returns      value stored in resultMap
function sentry_error_pop(argument0) {

	var key = string(argument0);

	with (sentry_handler) {
		var retval = ds_map_find_value(errorMap, key);
		if (not is_undefined(retval)) {
			ds_map_delete(errorMap, key);
		}
		return retval;
	}

	return undefined;


}
