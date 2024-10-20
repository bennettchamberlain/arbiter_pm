import 'package:arbiter_pm/constants/constants.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class Themes {
  static final lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    textTheme: GoogleFonts.questrialTextTheme(ThemeData.light().textTheme),
    colorScheme: ThemeData.light()
        .colorScheme
        .copyWith(secondary: secondaryColorLightTheme),
    textButtonTheme: textButtonThemeData,
    outlinedButtonTheme: outlinedButtonThemeData,
    elevatedButtonTheme: elevatedButtonThemeData,
    inputDecorationTheme: kInputDecorationTheme,
  );

  static final darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: bgColorDarkTheme,
    scaffoldBackgroundColor: bgColorDarkTheme,
    textTheme: GoogleFonts.questrialTextTheme(ThemeData.dark().textTheme),
    colorScheme: ThemeData.dark()
        .colorScheme
        .copyWith(secondary: secondaryColorDarkTheme),
    textButtonTheme: textButtonThemeData,
    outlinedButtonTheme: outlinedButtonThemeData,
    elevatedButtonTheme: elevatedButtonThemeData,
    inputDecorationTheme: kInputDecorationTheme,
  );
}

final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: const EdgeInsets.all(kDefaultPadding * .8),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
    ),
    shadowColor: textColorLightTheme.withOpacity(.5),
  ),
);

final textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) => (states.contains(MaterialState.hovered))
          ? const Color(0xFF9C6CAB)
          : const Color(0xFFD8DBE2),
    ),
    shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
      (Set<MaterialState> states) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
    padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
      (Set<MaterialState> states) => const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 1.5,
        vertical: kDefaultPadding,
      ),
    ),
  ),
);

final outlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(
      horizontal: kDefaultPadding * 1.5,
      vertical: kDefaultPadding,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
      side: const BorderSide(
        color: kTextColor,
      ),
    ),
  ),
);

const kInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPinker, width: 1.5),
  ),
  floatingLabelStyle: TextStyle(color: kDarker),
  errorStyle: TextStyle(fontSize: 1),
  floatingLabelAlignment: FloatingLabelAlignment.center,
);
