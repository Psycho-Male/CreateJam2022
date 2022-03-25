function sentry_request(argument0) {
	var buffer = argument0;

	with(sentry_handler) {

		var timestamp = sentry_unix_timestamp();
	
		var x_auth = "Sentry sentry_version=7," +
			            " sentry_client="+ game_project_name + "/" + GM_version + "," +
		 				" sentry_timestamp=" + string(timestamp) + "," +
						" sentry_key=" + dsnPublicKey;
				 
		if (not is_undefined(dsnSecretKey)) {
			x_auth += "," +
						" sentry_secret=" + dsnSecretKey;
		}
	
		var headers = ds_map_create();
		ds_map_add(headers, "Content-Type", "application/json");
		ds_map_add(headers, "X-Sentry-Auth", x_auth);
	
		var asyncId = http_request(endpoint, "POST", headers, buffer_base64_encode(buffer, 0, buffer_get_size(buffer)));
		ds_map_destroy(headers);
	
		return asyncId;
	}
	return undefined;


}
