import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationsProvider extends ChangeNotifier {
  Locale locale = const Locale('tr');

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('languageCode') == null) {
      locale = const Locale('tr');
    }else{
      locale = Locale(prefs.getString('languageCode')!);
    }
    notifyListeners();
  }

  void setLocale(Locale newLocale) async {
    locale = newLocale;
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
    notifyListeners();
  }
}