
import 'package:boilerplateflutter/component/toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../model/note_model.dart';
import '../services/mainservices.dart';

class MainController extends GetxController {
  var tabIndex = 0;
  var isLoading = false.obs;
 
 final mainservices = MainServices();

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
    List<Note> listNotes = [];
  getNotes() async {
    try {
      isLoading(true);
       update();
      final art = await mainservices.getNotes();
     
      listNotes = art.data!;
      isLoading(false);
       update();
    } catch (e) {
      isLoading(false);
      ToastCustom.toastError(e.toString());
    }
  }

}
