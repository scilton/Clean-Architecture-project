import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/config/routes/app_routes.dart';
import 'package:untitled3/core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
static SharedPreferences? sharedPreferences;
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
          () async => Navigator.of(context).pushReplacementNamed(Routes.screen1Route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image(
          image: AssetImage(
            AppImage.splash
          ),
        ),
      ),
    );
  }
}
