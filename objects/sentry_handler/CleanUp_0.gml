if (created) {
	ds_map_destroy(precomputeSdk);
	ds_map_destroy(precomputeTags);
	ds_map_destroy(precomputeContexts);
	ds_map_destroy(precomputeExtra);
	ds_map_destroy(precomputeUser);

	ds_map_destroy(requestMap);
	ds_map_destroy(resultMap);
	ds_map_destroy(errorMap);

	ds_list_destroy(breadcrumbsList);

	ds_map_destroy(options);
}