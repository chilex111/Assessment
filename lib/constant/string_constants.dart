import 'package:intl/intl.dart';

class StringConstants{
  static String appName = "";

  static String genericErrorMessage = "Oops! an error occurred please retry";
  static String userAlreadyExistErrorMessage = "User details already exist!";
  static String userNotVerifiedErrorMessage = "Email verification";
  static String dummyImage = "https://conferenceoeh.com/wp-content/uploads/profile-pic-dummy.png";

  ///cacheKeys
  static String tokenKey = "tokenKey";
  static String refreshTokenKey = "refreshTokenKey";
  static String userDataKey = "userLoginDataKey";
  static String onBoardingStatus = "onBoardingStatus";
  static String rememberMe = "rememberMe";

}
String convertTimestampToUnit(String timestamp) {
  DateTime dateObj = DateTime.parse(timestamp);
  DateTime now = DateTime.now();

  Duration timeDiff = now.difference(dateObj);

  if (timeDiff.inSeconds < 60) {
    return '${timeDiff.inSeconds}sec';
  } else if (timeDiff.inMinutes < 60) {
    return '${timeDiff.inMinutes}min';
  } else if (timeDiff.inHours < 24) {
    return '${timeDiff.inHours}h';
  } else {
    return '${timeDiff.inDays} days';
  }
}
String convertLongDateToString(int timestamp) {
  // Convert timestamp to DateTime object
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  // Format the date and time according to the desired format
  var formatter = DateFormat('yyyy-MM-dd • HH:mm');
  return formatter.format(date);
}
