/// @description Initialize sentry
/// @argument DSN Sentry DSN for your project
function sentry_init(argument0) {

	// spawn the sentry_handler if it doesn't already exist
	if (not instance_exists(sentry_handler)) {
		instance_create_depth(0, 0, 0, sentry_handler);
	}


	with(sentry_handler) {
		var dsn = argument0;
	
		var protPos = string_pos("://", dsn);
		if (protPos == 0) {
			show_debug_message("Sentry Error: Malformed DSN, no protocol found");
			return false;
		}
	
		var atPos = string_pos("@", dsn)
		if (atPos == 0) {
			show_debug_message("Sentry Error: Malformed DSN, no @ found");
			return false;
		}
	
		var dsnProt = string_copy(dsn, 1, protPos-1);
	
		var atPre = string_copy(dsn, protPos+3, atPos-protPos-3);
		var keyPos = string_pos(":", atPre);
		if (keyPos) {
			dsnPublicKey = string_copy(atPre, 1, keyPos-1);
			dsnSecretKey = string_copy(atPre, keyPos+1, string_length(atPre)-keyPos);
		}
		else {
			dsnPublicKey = atPre;
			dsnSecretKey = "";
		}
	
		if (string_length(dsnPublicKey) == 0) {
			show_debug_message("Sentry Error: Malformed DSN, no public key found");
			return false;
		}
	
		var atPost = string_copy(dsn, atPos+1, string_length(dsn)-atPos);
		for (var nextPos = 1, slashPos = 1; nextPos != 0; slashPos += nextPos) {
			nextPos = string_pos("/", string_copy(atPost, slashPos, string_length(atPost)-slashPos));
		}
	
		var dsnHostPath = string_copy(atPost, 1, slashPos-2);
	
		if (string_length(dsnHostPath) == 0) {
			show_debug_message("Sentry Error: Malformed DSN, no host/path found");
			return false;
		}
	
		var dsnProject = string_copy(atPost, slashPos, string_length(atPost)-slashPos+1);
	
		if (string_length(dsnProject) == 0) {
			show_debug_message("Sentry Error: Malformed DSN, no project found");
			return false;
		}
	
		endpoint = dsnProt + "://" + dsnHostPath + "/api/" + dsnProject + "/store/";
		return true;
	}


}
