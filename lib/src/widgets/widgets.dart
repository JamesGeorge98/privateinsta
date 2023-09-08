import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/assets.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/dimensions.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/sizedbox.dart';

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
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
          padding: const EdgeInsets.all(2),
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
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor)),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.white,
                          ),
                        ),
                      )),
            ],
          )),
    );
  }

  Widget instaPostFeedView({required BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          leading: displayPictureView(context: context, size: 18),
          horizontalTitleGap: 0,
          title: const Text("username"),
          minLeadingWidth: 5,
          trailing: const Icon(Icons.more_horiz),
        ),
        const AspectRatio(aspectRatio: Dimensions.post, child: Placeholder()),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          minLeadingWidth: 0,
          title: Row(
            children: [
              PITextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.favorite_border_rounded,
                  size: 40,
                ),
              ).iconButton(context),
              PITextButton(
                onPressed: () {},
                child: const Icon(
                  AppIcons.commentIcon,
                  size: 30,
                ),
              ).iconButton(context),
              PITextButton(
                onPressed: () {},
                child: const Icon(
                  AppIcons.sharIcon,
                  size: 30,
                ),
              ).iconButton(context),
            ],
          ),
          trailing: PITextButton(
            onPressed: () {},
            child: const Icon(
              AppIcons.savedIcon,
              size: 25,
            ),
          ).iconButton(context),
        ),
      ],
    );
  }
}
