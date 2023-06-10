import 'package:boilerplateflutter/routes/app_pages.dart';
import 'package:boilerplateflutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      title: 'dani',
      // home: const OnBoardingPage(),
      theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black.withOpacity(0))),
      builder: EasyLoading.init(),
      initialRoute: AppRoutes.initial,
    );
  }
}