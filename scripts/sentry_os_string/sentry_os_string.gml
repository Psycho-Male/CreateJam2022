/// @description  Determines the device OS and version
/// @returns      A string representing the OS and version
function sentry_os_string() {


	switch (os_type) {
		case os_windows:
		case os_uwp:
		case os_win8native:
			return "Windows";
		case os_linux: return "Linux";
		case os_macosx:
			return "Mac OS X";
		case os_ios:
			return "iOS";
		case os_android:
			return "Android";
		case os_ps4: return "PlayStation";
		case os_xboxone: return "XBox";
		case os_switch: return "Switch";
		default: return "Unknown"
	}



}
