import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/assets.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/dimensions.dart';

class CustomWidgets {
  CustomWidgets();
  Widget visibleIcons({bool visiable = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: (ImageIcon(
        AssetImage(
          "assets/icons/${visiable ? "visiblityicon" : "invisiblityicon"}.webp",
        ),
        color: visiable ? AppColors.blue : null,
      )),
    );
  }

  Widget displayPictureView(
      {String? dp,
      int index = 1,
      double size = 50,
      bool isStroy = false,
      bool isStoryViwed = true,
      required BuildContext context}) {
    return Container(
        padding: const EdgeInsets.all(2),
        height: 100,
        width: 90,
        decoration: (isStroy)
            ? BoxDecoration(
                border: Border.all(
                    color: isStoryViwed ? AppColors.grey : AppColors.green,
                    width: 5),
                borderRadius: BorderRadius.circular(1000))
            : const BoxDecoration(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {
                print("object");
              },
              child: dp != null
                  ? CircleAvatar(
                      radius: size, backgroundImage: NetworkImage(dp))
                  : CircleAvatar(
                      radius: size,
                      backgroundImage: const AssetImage(AppAssets.defultDp)),
            ),
            index != 0
                ? const SizedBox()
                : Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.blue,
                            border: Border.all(
                                width: 2,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor)),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.white,
                        ),
                      ),
                    )),
          ],
        ));
  }

  Widget instaPostFeedView({required BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: displayPictureView(context: context, size: 18),
          titleAlignment: ListTileTitleAlignment.center,
          horizontalTitleGap: 0,
          title: const Text("username"),
          trailing: const Icon(Icons.more_horiz),
        ),
        const AspectRatio(aspectRatio: Dimensions.post, child: Placeholder()),
        const ListTile(
          leading: Icon(Icons.favorite_border_rounded),
          trailing: Icon(Icons.save_alt_outlined),
        ),
      ],
    );
  }
}
