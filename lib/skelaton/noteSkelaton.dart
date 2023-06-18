import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skeletons/skeletons.dart';

class NoteSkelaton extends StatelessWidget {
  const NoteSkelaton({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      itemCount: 8,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            constraints: BoxConstraints(minHeight: (index % 2 + 1) * 85),
            padding: EdgeInsets.all(15),
            child: SkeletonAvatar(
              style: SkeletonAvatarStyle(
                borderRadius: BorderRadius.circular(10),
                width:250,
                height: (index % 2 + 1) * 85,
              ),
            ),
          ),
        );
      },
    );
  }
}
