import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import '../controller/maincontroller.dart';
import '../model/note_model.dart';

class Custom extends StatelessWidget {
  final mainC = Get.find<MainController>();
  var isloading = false.obs;
  @override
  Widget build(BuildContext context) {
    // Tampilkan MasonryGridView jika listNotes tidak kosong
    return MasonryGridView.count(
      crossAxisCount: 2,
      itemCount: 7,
      itemBuilder: (context, index) {
        Note note = mainC.listNotes[index];
        return GestureDetector(
          onTap: () {},
          child:
           Container(
           margin: EdgeInsets.symmetric(horizontal: 35.0,vertical: 10.0),
            
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonAvatar(
              
                  style: SkeletonAvatarStyle(
                    
                    borderRadius: BorderRadius.circular(10),
                    width: 180,
                    height: (index % 2 + 1) * 85,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // return GestureDetector(
  //   onTap: () {

  //   },
  //   child: Container(
  //     width: 200,
  //     height: 323,
  //     margin: EdgeInsets.only(
  //       left: 16.0,
  //       top: 16.0,
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SkeletonAvatar(
  //           style: SkeletonAvatarStyle(
  //             borderRadius: BorderRadius.circular(18),
  //             width: 180,
  //             height: 220,
  //           ),
  //         ),

  //       ],
  //     ),
  //   ),
  // );
}
