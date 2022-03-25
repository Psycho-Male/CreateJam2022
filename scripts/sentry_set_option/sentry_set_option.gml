/// @description set a sentry option
/// @argument option name of option
/// @argument value value of option
function sentry_set_option(argument0, argument1) {

	var option = argument0;
	var value = argument1;

	with(sentry_handler) {
		ds_map_replace(options, option, value);
	}


}
