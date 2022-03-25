/// @description clears the custom context
function sentry_clear_extra() {

	with(sentry_handler) {
		ds_map_destroy(precomputeExtra);
		precomputeExtra = ds_map_create();
	}


}
