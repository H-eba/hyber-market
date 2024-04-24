import 'package:ecommerce/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyThem {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
    ),

      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorManager.primaryColor,
          primary: ColorManager.primaryColor),
      textTheme: TextTheme(
          labelSmall: TextStyle(fontSize: 14.sp,
              fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(fontSize: 18.sp,
          fontWeight: FontWeight.w500,
      color: ColorManager.headLineColor),
        titleMedium: TextStyle(fontSize: 24.sp,
            fontWeight: FontWeight.w600,color: Colors.white),
          titleSmall: TextStyle(fontSize: 18.sp,
              fontWeight: FontWeight.w300,color: Colors.black)
      ),

  );
}
