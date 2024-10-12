import 'main.dart';

class Constant {
  static String? Language =
      sharedPref.getString('Language') ?? 'en'; // Default to 'en' if not set
}
