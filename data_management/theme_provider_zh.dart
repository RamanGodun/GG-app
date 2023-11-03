import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  ThemeProvider() {
    loadThemeFromSharedPreferences();
  }

  void loadThemeFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('theme');
    if (savedTheme == 'dark') {
      themeMode = ThemeMode.dark;
    } else if (savedTheme == 'light') {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  void saveThemeToSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (themeMode == ThemeMode.dark) {
      prefs.setString('theme', 'dark');
    } else if (themeMode == ThemeMode.light) {
      prefs.setString('theme', 'light');
    }
  }

  bool get isDarkMode {
    return themeMode == ThemeMode.dark;
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    saveThemeToSharedPreferences();
    notifyListeners();
  }
}

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 255, 179, 0);
  static const Color backgroundColor = Color(0xFF1B1B1B);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color errorColor = Colors.red;
  static const Color darkGreyColor = Color.fromARGB(255, 120, 120, 120);
  static const Color saleColor = Color.fromARGB(255, 201, 76, 76);
}

class MyThemes {
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      color: AppColors.backgroundColor,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: Colors.white,
    cardColor: const Color.fromARGB(255, 46, 46, 46),
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        contentTextStyle: TextStyle(color: Colors.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      selectedIconTheme: IconThemeData(
        color: Color.fromARGB(255, 228, 228, 228),
      ),
      unselectedIconTheme: IconThemeData(
        color: Color.fromARGB(255, 88, 88, 88),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'MA'),
    ),
  );

  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    cardColor: const Color.fromARGB(255, 243, 243, 243),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'MA'),
    ),
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.black))),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 225, 225, 225),
        contentTextStyle: TextStyle(color: Colors.black)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      selectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color.fromARGB(255, 193, 193, 193),
      ),
    ),
  );
}
