import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/assets.dart';
import 'package:privateinsta/core/constants/dimensions.dart';

class DisplayPicture extends StatelessWidget {
  const DisplayPicture({super.key});

  factory DisplayPicture.story() {
    return const DisplayPicture();
  }

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: Dimensions.post,
      child: CircleAvatar(
          radius: 50, backgroundImage: AssetImage(AppAssets.defultDp)),
    );
  }
}
