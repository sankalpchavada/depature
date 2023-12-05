import 'package:depature/model/func_model.dart';
import 'package:flutter/material.dart';

class FuncProvider extends ChangeNotifier {
  ThemeDetail themeDetail = ThemeDetail(isDark: false);

  LanguageBool langBool = LanguageBool(ishindi: false);

  void changeTheme() {
    themeDetail.isDark = !themeDetail.isDark;
    notifyListeners();
  }

  void changeLang() {
    langBool.ishindi = !langBool.ishindi;
    notifyListeners();
  }
}
