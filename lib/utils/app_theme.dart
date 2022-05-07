import 'package:flutter/material.dart';
import 'package:movies_project/utils/costants/consts_style.dart';

ThemeData appTheme([BuildContext? context]) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(accentColor: Colors.white),
    androidOverscrollIndicator: AndroidOverscrollIndicator.glow,
    appBarTheme: const AppBarTheme(
      color: StyleConstants.bluePrimaryColor,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: StyleConstants.whiteColor,
          fontSize: StyleConstants.titleFontSize),
      iconTheme: IconThemeData(color: StyleConstants.whiteColor),
    ),
  );
}
