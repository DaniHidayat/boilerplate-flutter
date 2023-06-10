import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class CustomLoader extends StatelessWidget {
  final double? width;
  const CustomLoader({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff100553),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black.withOpacity(0.25),
          //       blurRadius: 25,
          //       offset: const Offset(0, 4))
          // ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp,
              colors: [
                const Color(0xFFFFFFFF).withOpacity(0.4),
                const Color(0xFFFFFFFF).withOpacity(0)
              ])),
      child: const ListTileShimmer(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        bgColor: Colors.transparent,
        height: 30,
        isDisabledAvatar: true,
        isDisabledButton: true,
        // isPurplishMode: true,
      ),
    );
  }
}
