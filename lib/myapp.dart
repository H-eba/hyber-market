import 'package:ecommerce/config/them/them.dart';
import 'package:ecommerce/core/local/prefsHelper.dart';
import 'package:ecommerce/core/utils/route_manager.dart';
import 'package:ecommerce/presentation/home/login_screen/login.dart';
import 'package:ecommerce/presentation/home/register_screen/register.dart';
import 'package:ecommerce/presentation/home/tabs/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute: PrefsHelper.getToken().isNotEmpty?
          RoutesManager.homeRouteName
         : RoutesManager.loginRouteName,

      routes: {
        RoutesManager.homeRouteName:(_)=>HomeScreen(),
        RoutesManager.registerRouteName:(_)=>RegisterScreen(),
        RoutesManager.loginRouteName:(_)=>LoginScreen(),
      },
      theme: MyThem.lightTheme,

    ),
    );
  }
}