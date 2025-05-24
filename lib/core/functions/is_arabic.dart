
import 'package:intl/intl.dart';

bool isArabic() {
  String currentLocale = Intl.getCurrentLocale();
 
  bool isArabic = currentLocale.startsWith('ar');
// log('currentLocale: $currentLocale, isArabic: $isArabic');
  return isArabic;
}
