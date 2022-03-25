/// @description add custom tags
/// @argument key key of tag
/// @argument value value of tag
function sentry_add_tag(argument0, argument1) {

	var key = argument0;
	var value = argument1;

	with(sentry_handler) {
		ds_map_replace(precomputeTags, key, value);
	}


}
