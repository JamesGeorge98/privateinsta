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
      {String heading = 'Heading',
      String subheading = 'Subheading',
      TextStyle? headingTextStyle,
      TextStyle? subHeadingTextStyle,}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          heading,
          style: headingTextStyle ?? const TextStyle(),
        ),
        Text(
          subheading,
          style: subHeadingTextStyle ?? const TextStyle(),
        ),
      ],
    );
  }

  Widget displayPictureView(
      {String? dp,
      int index = 1,
      double size = 50,
      bool isStroy = false,
      bool isStoryViwed = true,
      bool isHighlights = false,}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: CustomPaint(
        painter: GradientBorder(
            bRadius: 100,
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: isStroy
                  ? <Color>[
                      AppColors.instaSandle,
                      AppColors.instaOrange,
                      AppColors.instaPink,
                      AppColors.instaPurple,
                      // AppColors.instaBlue,
                    ]
                  : <Color>[Colors.grey, Colors.grey],
            ),
            sWidth: isStroy ? 10 : 0,),
        child: Center(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: Theme.of(context).colorScheme.background,),
          padding: const EdgeInsets.all(2),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: dp != null
                    ? CircleAvatar(
                        radius: size,
                        backgroundImage: isHighlights ? null : NetworkImage(dp),)
                    : CircleAvatar(
                        radius: size,
                        backgroundImage: isHighlights
                            ? null
                            : const AssetImage(AppAssets.defultDp),),
              ),
              if (index != 0) const SizedBox() else Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.blue,
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor,),),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.white,
                          ),
                        ),
                      ),),
              if (isHighlights) const Positioned.fill(
                      child: Icon(
                        Icons.add_rounded,
                        weight: 0.1,
                        size: 35,
                      ),
                    ) else const SizedBox(),
            ],
          ),
        ),),
      ),
    );
  }

  Widget storyHighligths({bool isHighlight = false}) {
    return Column(
      children: <Widget>[
        Expanded(
            child: displayPictureView(
                size: 35, isHighlights: isHighlight,),),
        const Text('name'),
      ],
    );
  }

  Widget instaPostFeedView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          titleAlignment: ListTileTitleAlignment.titleHeight,
          leading: displayPictureView(size: 18),
          horizontalTitleGap: 0,
          title: const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text('username'),
          ),
          minLeadingWidth: 5,
          trailing: const Icon(Icons.more_horiz),
        ),
        const AspectRatio(aspectRatio: Dimensions.post, child: Placeholder()),
        likesharecommet(),
      ],
    );
  }

  Widget instaReelsFeedView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AspectRatio(
            aspectRatio: Dimensions.igtv,
            child: Stack(
              children: <Widget>[
                ListTile(
                  titleAlignment: ListTileTitleAlignment.titleHeight,
                  leading: displayPictureView(size: 18),
                  horizontalTitleGap: 0,
                  title: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('username'),
                  ),
                  minLeadingWidth: 5,
                  trailing: const Icon(Icons.more_horiz),
                ),
                const Placeholder(),
              ],
            ),),
        likesharecommet(),
      ],
    );
  }

  Widget likesharecommet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
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
            PITextButton(
              onPressed: () {},
              child: const Icon(
                AppIcons.save,
                size: 35,
              ),
            ).iconButton(context),
          ],
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Text('3197 Likes'),
            Text('Username bad grammer'),
          ],),
        ),
      ],
    );
  }

  Widget instaSearchBar({
    void Function()? onTap,
    void Function(PointerDownEvent)? onTapOutside,
  }) {
    return TextFormField(
      onTap: onTap,
      onTapOutside: onTapOutside,
      decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(maxHeight: 40),
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 8, left: 2),
            child: Icon(
              AppIcons.search,
              color: AppColors.white.withOpacity(0.5),
              size: 16,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: 'Search',
          hintStyle: const TextStyle(fontSize: 13),),
    );
  }

  Widget asceptRatioCart({double ratio = Dimensions.post}) {
    return AspectRatio(
      aspectRatio: ratio,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(),),
        margin: const EdgeInsets.all(0),
        color: AppColors.darkFieldColor,
        child: const Center(child: Text('1')),
      ),
    );
  }
}
