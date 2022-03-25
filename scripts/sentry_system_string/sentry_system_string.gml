/// @description  Determines the device OS and version
/// @returns      A string representing the OS and version
function sentry_system_string() {

	var device;
	switch (os_browser) {
		case browser_not_a_browser:
			switch (os_type) {
				case os_windows:
				case os_uwp:
				case os_win8native:
					device = "Windows";
				
					switch (os_version) {
						case 327680: device += " 2000"; break;
						case 327681:
						case 237862:
							device += " XP"; break;
						case 393216: device += " Vista"; break;
						case 393217: device += " 7"; break;
						case 393218: device += " 8"; break;
						case 393219: device += " 8.1"; break;
						case 655360: device += " 10"; break;
					}
					break;
				
				case os_linux: device = "Linux"; break;
				case os_macosx:
					device = "Mac OS X";
				
					var major = os_version >> 24;
					var minor = (os_version >> 12) & 0xfff;
					device += " " + string(major) + "." + string(minor)
				
					break;
				case os_ios:
					switch (os_device) {
						case device_ios_ipad:
						case device_ios_ipad_retina:
							device = "iPad"; break;
						case device_ios_iphone:
						case device_ios_iphone_retina:
						case device_ios_iphone6:
						case device_ios_iphone6plus:
						case device_ios_iphone5:
							device = "iPhone"; break;
						default: device = "iOS"
					}
				
					var major = os_version >> 24;
					var minor = (os_version >> 12) & 0xfff;
					device += " " + string(major) + "." + string(minor)
				
					break;
				case os_android:
					switch (os_device) {
						case device_tablet: device = "Android Tablet"; break;
						default: device = "Android"
					}
				
					switch (os_version) {
						case 21:
						case 22:
							device += " Lollipop"; break;
						case 23: device += " Marshmallow"; break;
						case 24: device += " Nougat"; break;
						case 25: device += " Oreo"; break;
						case 26: device += " Pie"; break;
					}
					break;
				case os_ps4: device = "PlayStation"; break;
				case os_xboxone: device = "XBox"; break;
				case os_switch: device = "Switch"; break;
				default: device = "Unknown"
			}
			break;
		case browser_ie:
		case browser_ie_mobile:
			device = "Internet Explorer"; break;
		case browser_firefox: device = "Firefox"; break;
		case browser_chrome: device = "Chrome"; break;
		case browser_safari:
		case browser_safari_mobile:
			device = "Safari"; break;
		case browser_opera: device = "Opera"; break;
		default: device = "Browser"; break;
	}

	return device;


}
