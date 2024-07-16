import 'package:flutter/material.dart';

import 'custom/appbar_theme.dart';
import 'custom/checkbox_theme.dart';
import 'custom/elevated_button_theme.dart';
import 'custom/text_field_theme.dart';
import 'custom/text_theme.dart';

class TaiyoTheme {
  TaiyoTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTaiyoTheme.lightTextTheme,
    appBarTheme: TaiyoAppBarTheme.lightAppBarTheme,
    checkboxTheme: TaiyoCheckboxTheme.lightCheckboxTheme,
    elevatedButtonTheme: TaiyoElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TaiyoTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTaiyoTheme.darkTextTheme,
    appBarTheme: TaiyoAppBarTheme.darkAppBarTheme,
    checkboxTheme: TaiyoCheckboxTheme.darkCheckboxTheme,
    elevatedButtonTheme: TaiyoElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TaiyoTextFormFieldTheme.darkInputDecorationTheme,
  );
}
