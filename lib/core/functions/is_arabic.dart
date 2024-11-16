import 'package:intl/intl.dart';

bool isArabic() {
  String currentLocale = Intl.getCurrentLocale();
  return currentLocale.startsWith('ar');
}
