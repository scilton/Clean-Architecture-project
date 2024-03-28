import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme () {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      )
    )
    
  );
}