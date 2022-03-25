/// @description  Determines the device OS and version
/// @returns      A string representing the OS and version
function sentry_browser_string() {

	switch (os_browser) {
		case browser_not_a_browser: return undefined;
		case browser_ie:
		case browser_ie_mobile:
			return "Internet Explorer";
		case browser_firefox: return "Firefox";
		case browser_chrome: return "Chrome";
		case browser_safari:
		case browser_safari_mobile:
			return "Safari";
		case browser_opera: return "Opera";
		default: return "Unknown Browser";
	}


}
