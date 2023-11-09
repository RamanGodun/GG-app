import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  static final ThemeData darkTheme = _createDarkTheme();
  static final ThemeData lightTheme = _createLightTheme();

  ThemeProvider() {
    loadThemeFromSharedPreferences();
  }

  void loadThemeFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isDarkTheme = prefs.getBool('isDarkTheme');

    if (isDarkTheme != null) {
      themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  void saveThemeToSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', themeMode == ThemeMode.dark);
  }

  void setThemeMode(ThemeMode newMode) {
    themeMode = newMode;
    saveThemeToSharedPreferences();
    notifyListeners();
  }

  ThemeData getCurrentTheme() {
    return themeMode == ThemeMode.light ? lightTheme : darkTheme;
  }
}

ThemeData _createDarkTheme() {
  return ThemeData.dark().copyWith(
    primaryColor: ColorsForApp.primary,
    canvasColor: ColorsForApp.background,
    scaffoldBackgroundColor: ColorsForApp.background,
    hoverColor: AdditionalColorsForApp.hover,
    focusColor: ColorsForApp.white,
    shadowColor: AdditionalColorsForApp.silver,
    indicatorColor: AdditionalColorsForApp.amber1,
    primaryColorLight: AdditionalColorsForApp.amber1.withOpacity(0.5),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AdditionalColorsForApp.grey),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ColorsForApp.white,
      unselectedItemColor: AdditionalColorsForApp.hover,
      backgroundColor: AdditionalColorsForApp.silver,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: ColorsForApp.background,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'MA'),
    ),
  );
}

ThemeData _createLightTheme() {
  return ThemeData.light().copyWith(
    primaryColor: ColorsForApp.primary,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AdditionalColorsForApp.silver),
    focusColor: ColorsForApp.black.withOpacity(0.5),
    hoverColor: AdditionalColorsForApp.lighthover,
    indicatorColor: AdditionalColorsForApp.amber1,
    canvasColor: ColorsForApp.white,
    scaffoldBackgroundColor: ColorsForApp.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ColorsForApp.black,
      unselectedItemColor: AdditionalColorsForApp.bottomNavBarUnselectedLight,
      backgroundColor: ColorsForApp.white,
    ),
    appBarTheme: const AppBarTheme(
      color: ColorsForApp.white,
      iconTheme: IconThemeData(color: ColorsForApp.black),
      elevation: 0,
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'MA')),
  );
}

class ColorsForApp {
  static const Color white = Color(0xFFD9D9D9);
  static const Color primary = Color(0xFFFFB100);
  static const Color background = Color(0xFF1B1B1B);
  static const Color black = Colors.black;
}

class AdditionalColorsForApp {
  static const Color white = Color(0xFFFFFFFF);

  static const Color silver = Color(0xFF999A9B);
  static const Color lightGrey = Color(0xFF777777);
  static const Color shadow = Color(0xFF999A9B);
  static const Color grey = Color(0xFF666666);
  static const Color hover = Color(0xFF525559);
  static const Color lighthover = Color.fromARGB(255, 224, 227, 207);
  static const Color darkGrey1 = Color(0xFF3A3A3A);
  static const Color darkGrey2 = Color(0xFF454545);
  static const Color darkGrey3 = Color(0xFF343434);
  static const Color bottomNavBarUnselectedLight =
      Color.fromARGB(255, 193, 193, 193);

  static const Color amber1 = Colors.amber;
  static const Color yellow1 = Color.fromARGB(255, 227, 171, 79);
  static const Color yellow2 = Color.fromARGB(255, 255, 179, 0);
  static const Color amber2 = Color(0xFFB56933);
  static const Color darkAmber1 = Color(0xFF8F4E26);
  static const Color darkAmber2 = Color(0xFF753B1F);
  static const Color alert = Color.fromARGB(255, 201, 76, 76);
  static const Color error = Colors.red;

  static const Color black1 = Color(0xFF242424);
  static const Color black2 = Color(0xFF1F1F1F);
  static const Color black3 = Color(0xFF000000);
}
