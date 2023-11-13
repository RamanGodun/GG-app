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
    primaryColor: ColorsForApp.white,
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: ColorsForApp.background,
    indicatorColor: AdditionalColorsForApp.amber1,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ColorsForApp.white,
        unselectedItemColor: AdditionalColorsForApp.hover,
        backgroundColor: ColorsForApp.background),
    appBarTheme: const AppBarTheme(
        elevation: 0, backgroundColor: ColorsForApp.background),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        contentTextStyle:
            TextStyle(color: ColorsForApp.white, fontFamily: 'MA')),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'MA', color: ColorsForApp.white),
    ),
  );
}

ThemeData _createLightTheme() {
  return ThemeData.light().copyWith(
    primaryColor: ColorsForApp.black,
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: ColorsForApp.white,
    indicatorColor: AdditionalColorsForApp.amber1,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ColorsForApp.black,
        unselectedItemColor: AdditionalColorsForApp.bottomNavBarUnselectedLight,
        backgroundColor: Color.fromARGB(255, 255, 255, 255)),
    appBarTheme: const AppBarTheme(
        color: ColorsForApp.white,
        iconTheme: IconThemeData(color: ColorsForApp.black),
        elevation: 0),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: AdditionalColorsForApp.lightSnackBar,
        contentTextStyle:
            TextStyle(color: ColorsForApp.black, fontFamily: 'MA')),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'MA', color: ColorsForApp.black),
    ),
  );
}

class ColorsForApp {
  static const Color white = Colors.white;
  static const Color primary = Color(0xFFFFB100);
  static const Color background = Color(0xFF1B1B1B);
  static const Color black = Colors.black;
}

class AdditionalColorsForApp {
  static const Color lightSnackBar = Color.fromARGB(255, 225, 225, 225);
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
