import 'dart:async';
import 'package:boilerplateflutter/component/style.dart';
import 'package:boilerplateflutter/component/toast.dart';
import 'package:boilerplateflutter/controller/maincontroller.dart';
import 'package:boilerplateflutter/screen/home/home.dart';
import 'package:boilerplateflutter/screen/note/note.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Mainscreen extends StatefulWidget {
  final int? tab;
  const Mainscreen({Key? key, this.tab}) : super(key: key);

  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final mainC = Get.find<MainController>();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.tab != null) {
      mainC.tabIndex = widget.tab!;
    }
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    EasyLoading.removeAllCallbacks();
  }

  DateTime currentBackPressTime = DateTime(2019);

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ToastCustom.toastInfo('Press again to Exit');
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () => onWillPop(),
      child: GetBuilder<MainController>(
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                IndexedStack(
                  index: controller.tabIndex,
                  children: [
                  NoteScreen(),
                   Home('2'),
                   Home('3'),
                  
                  ],
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 30,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Style.text2Color,
              unselectedItemColor: Style.text3Color,
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: [
                _bottomNavigationBarItem(
                    icon: 'assets/images/home.png', label: 'Notif'),
               
                _bottomNavigationBarItem(
                  icon: 'assets/images/calendar.png',
                  label: 'Email',
                ),
                _bottomNavigationBarItem(
                    icon: 'assets/images/Path5.png', label: 'Profile'),
              ],
            ),
            //   floatingActionButton: Container(
            //     margin: EdgeInsets.only(top: 30),
            //     height: 70,
            //     width: 70,
            //     child: Padding(
            //       padding: const EdgeInsets.all(3.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(50),
            //           border:
            //               Border.all(color: Color(0xffCDCDCD).withOpacity(0.4)),
            //         ),
            //         child: IconButton(
            //           icon: Icon(

            //             size: 50,
            //             color: Color(0xff0F1C61),
            //           ),
            //           onPressed: () {},
            //         ),
            //       ),
            //     ),
            //   ),
            //   floatingActionButtonLocation:
            //       FloatingActionButtonLocation.miniCenterDocked,
          );
        },
      ),
    );
  }

  _bottomNavigationBarItem({
    String? icon,
    String? label,
  }) {
    return BottomNavigationBarItem(
        backgroundColor: Colors.transparent,
        icon: ImageIcon(AssetImage(icon.toString())),
        label: label);
  }
}
