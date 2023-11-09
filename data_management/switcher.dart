import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_provider.dart';

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

// Widget build(BuildContext context) {
//   final themeProvider = Provider.of<ThemeProvider>(context);
//   return Switch(
//     value: themeProvider.isDarkMode,
//     onChanged: (value) {
//       final provider = Provider.of<ThemeProvider>(context, listen: false);
//       provider.toggleTheme(value);
//       Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(
//           builder: (context) =>
//               const UserMainScreen(selectedBottomNavBarIndex: 0),
//         ),
//         (route) => false,
//       );
//     },
//     activeColor: AppColors.blackColor,
//     inactiveTrackColor: AppColors.primaryColor.withOpacity(0.3),
//     activeThumbImage: const AssetImage('assets/img/moon.png'),
//     inactiveThumbImage: const AssetImage('assets/img/sun.png'),
//   );
// }
