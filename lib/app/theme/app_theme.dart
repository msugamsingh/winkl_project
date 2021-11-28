import 'package:flutter/material.dart';
import 'package:winkl_project/app/theme/styles.dart';

class AppTheme {
  static final theme = ThemeData(
    fontFamily: 'poppins',
    primaryColor: Colors.deepPurple,
    unselectedWidgetColor: Colors.blueGrey[400],
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: Styles.tsAppBar,
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.blueGrey[900]),
    ),
  );
}
