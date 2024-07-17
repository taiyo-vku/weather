import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/utils/theme/theme.dart';

import 'screens/home_screen.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TaiyoTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: TaiyoTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
