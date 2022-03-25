/// @description  Determines the device OS and version
/// @returns      A string representing the OS and version
function sentry_os_version_string() {

	switch (os_type) {
		case os_windows:
		case os_uwp:
		case os_win8native:
			switch (os_version) {
				case 327680: return "2000";
				case 327681:
				case 237862:
					return "XP"; break;
				case 393216: return "Vista";
				case 393217: return "7";
				case 393218: return "8";
				case 393219: return "8.1";
				case 655360: return "10";
			}
			break;
		case os_macosx:
		case os_ios:
			var major = os_version >> 24;
			var minor = (os_version >> 12) & 0xfff;
			return string(major) + "." + string(minor)
		case os_android:
			switch (os_version) {
				case 21:
				case 22:
					return "Lollipop";
				case 23: return "Marshmallow";
				case 24: return "Nougat";
				case 25: return "Oreo";
				case 26: return "Pie";
			}
			break;
	}
	return "Unknown"



}
