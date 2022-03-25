/// @description  creates a breadcrumb
/// @argument category the category of the breadcrumb, e.g. "ui.keypress.L"
/// @argument level the level of the breadcrumb: SENTRY_CRITICAL, SENTRY_ERROR, SENTRY_WARNING, SENTRY_INFO, SENTRY_DEBUG
/// @argument message a message
/// @argument data* a map containing additional data
function sentry_add_breadcrumb() {


	with(sentry_handler) {
		var crumb = ds_map_create();
		ds_map_add(crumb, "timestamp", sentry_unix_timestamp());
		ds_map_add(crumb, "category", string(argument[0]));
		ds_map_add(crumb, "level", string(argument[1]));
		ds_map_add(crumb, "message", string(argument[2]));
	
		if (argument_count > 3) {
			var data = ds_map_create()
			ds_map_copy(data, argument[3])
			ds_map_add_map(crumb, "data", data);
		}
	
		ds_list_add(breadcrumbsList, crumb);
		ds_list_mark_as_map(breadcrumbsList, ds_list_size(breadcrumbsList)-1);
	
		// trim breadcrumbs
		while (ds_list_size(breadcrumbsList) > ds_map_find_value(options, "breadcrumbs_max")) {
			ds_map_destroy(ds_list_find_value(breadcrumbsList, 0));
			ds_list_delete(breadcrumbsList, 0);
		}
	}


}
