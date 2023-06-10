import 'package:boilerplateflutter/controller/maincontroller.dart';

import 'package:get/get.dart';

class DashboardB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
 
  }
}
