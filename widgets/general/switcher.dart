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
        Icon(
          Icons.nightlight_outlined,
          size: 20,
          color: Theme.of(context).focusColor,
        ),
        const SizedBox(width: 5),
        Switch(
          value: themeProvider.themeMode == ThemeMode.light,
          onChanged: (isLightMode) {
            final newMode = isLightMode ? ThemeMode.light : ThemeMode.dark;
            themeProvider.setThemeMode(newMode);
          },
          inactiveThumbColor: Theme.of(context).hoverColor,
          inactiveTrackColor: Theme.of(context).disabledColor,
        ),
        const SizedBox(width: 5),
        Icon(
          Icons.wb_sunny_outlined,
          size: 20,
          color: Theme.of(context).focusColor,
        ),
      ],
    );
  }
}
