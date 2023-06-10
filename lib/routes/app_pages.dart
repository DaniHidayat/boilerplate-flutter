
import 'package:boilerplateflutter/bindings/dashboardbindings.dart';
import 'package:boilerplateflutter/screen/mainscreen.dart';
import 'package:get/get.dart';
import 'package:boilerplateflutter/screen/splashcreen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashScreen(),
    ),
   GetPage(
      name: AppRoutes.note,
      page: () => const Mainscreen(),
      binding: DashboardB(),
    ),
    GetPage(
      name: AppRoutes.home2,
      page: () => const Mainscreen(),
      binding: DashboardB(),
    ),
    GetPage(
      name: AppRoutes.home3,
      page: () => const Mainscreen(),
      binding: DashboardB(),
    ),
   
  ];
}
