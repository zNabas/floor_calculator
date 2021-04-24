import 'package:flutter/material.dart';

import 'constants.dart';

final kAppTheme = ThemeData(
  primarySwatch: Colors.cyan,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonTheme: ButtonThemeData(
    height: kButtonHeight,
    textTheme: ButtonTextTheme.primary,
  ),
);
