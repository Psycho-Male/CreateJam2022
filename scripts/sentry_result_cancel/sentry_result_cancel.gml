/// @description  Pops UUID from resultMap
/// @argument     uuid	UUID to check
/// @returns      value stored in resultMap
function sentry_result_cancel(argument0) {

	var key = string(argument0);

	with (sentry_handler) {
		ds_map_delete(requestMap, key);
	}


}
