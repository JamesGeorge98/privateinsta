import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/assets.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/dimensions.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/custom_painter.dart';

class CustomWidgets {
  CustomWidgets({required this.context});

  final BuildContext context;

  Widget headingSubHeading(
      {String heading = "Heading",
      String subheading = "Subheading",
      TextStyle? headingTextStyle,
      TextStyle? subHeadingTextStyle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          heading,
          style: headingTextStyle ?? const TextStyle(),
        ),
        Text(
          subheading,
          style: subHeadingTextStyle ?? const TextStyle(),
        )
      ],
    );
  }

  Widget displayPictureView(
      {String? dp,
      int index = 1,
      double size = 50,
      bool isStroy = false,
      bool isStoryViwed = true,
      bool isHighlights = false}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: CustomPaint(
        painter: GradientBorder(
            bRadius: 100,
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: isStroy
                  ? [
                      AppColors.instaSandle,
                      AppColors.instaOrange,
                      AppColors.instaPink,
                      AppColors.instaPurple,
                      // AppColors.instaBlue,
                    ]
                  : [Colors.grey, Colors.grey],
            ),
            sWidth: isStroy ? 10 : 0),
        child: Center(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: Theme.of(context).colorScheme.background),
          padding: const EdgeInsets.all(2.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () {},
                child: dp != null
                    ? CircleAvatar(
                        radius: size,
                        backgroundImage: isHighlights ? null : NetworkImage(dp))
                    : CircleAvatar(
                        radius: size,
                        backgroundImage: isHighlights
                            ? null
                            : const AssetImage(AppAssets.defultDp)),
              ),
              index != 0
                  ? const SizedBox()
                  : Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
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
              isHighlights
                  ? const Positioned.fill(
                      child: Icon(
                        Icons.add_rounded,
                        weight: 0.1,

                        size: 35,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        )),
      ),
    );
  }

  Widget storyHighligths({bool isHighlight = false}) {
    return Column(
      children: [
        Expanded(
            child: displayPictureView(
                size: 35, isStroy: false, isHighlights: isHighlight)),
        const Text("name")
      ],
    );
  }

  Widget instaPostFeedView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          titleAlignment: ListTileTitleAlignment.titleHeight,
          leading: displayPictureView(size: 18, isStroy: false),
          horizontalTitleGap: 0,
          title: const Padding(
            padding: EdgeInsets.only(bottom: 8.0, left: 8),
            child: Text("username"),
          ),
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
                  size: 35,
                ),
              ).iconButton(context),
              PITextButton(
                onPressed: () {},
                child: const Icon(
                  AppIcons.comment,
                  size: 25,
                ),
              ).iconButton(context),
              PITextButton(
                onPressed: () {},
                child: const Icon(
                  AppIcons.share,
                  size: 25,
                ),
              ).iconButton(context),
            ],
          ),
          trailing: PITextButton(
            onPressed: () {},
            child: const Icon(
              AppIcons.save,
              size: 35,
            ),
          ).iconButton(context),
        ),
      ],
    );
  }
}
