import 'dart:async';
import 'package:boilerplateflutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checklogin() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    print(token);
    int? udhpernah = _prefs.getInt('skip');

    if (token != null && token != "") {
      Timer(const Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.note);
        // Get.offAllNamed(AppRoutes.dasboard);
      });
    } else {
      if (udhpernah == 0) {
        Timer(
          const Duration(seconds: 3),
          () {
            // Get.offAllNamed(AppRoutes.login);
            Get.offAllNamed(AppRoutes.note);
          },
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () {
          Get.offAllNamed(AppRoutes.note);
          },
        );
      }
    }
  }

  @override
  void initState() {
    checklogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/img-splashscreen.png'),
      ),
    );
  }
}
