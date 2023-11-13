import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_management/theme_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
      children: [
        Switch(
          value: themeProvider.themeMode == ThemeMode.light,
          onChanged: (isLightMode) {
            final newMode = isLightMode ? ThemeMode.light : ThemeMode.dark;
            themeProvider.setThemeMode(newMode);
          },
          inactiveTrackColor: ColorsForApp.black,
          activeColor: ColorsForApp.primary.withOpacity(0.3),
          inactiveThumbImage: const AssetImage('assets/img/moon.png'),
          activeThumbImage: const AssetImage('assets/img/sun.png'),
        ),
      ],
    );
  }
}
