import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/assets.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/src/widgets/custom_painter.dart';

class DisplayPicture extends StatelessWidget {
  const DisplayPicture(
      {super.key,
      this.networkImage,
      this.avatarSize = 40,
      this.isOnline = false,
      this.isPost = false,
      this.isStroyAvailable = false,
      this.addHighligths = false,})
      : assert(
            addHighligths == false &&
                (isPost == false ||
                    isStroyAvailable == false ||
                    isOnline == false),
            'Cannot keep AddHighligths true with any other Flag',);

  const DisplayPicture.online({
    super.key,
    this.isOnline = true,
    this.avatarSize = 40,
    this.isPost = false,
    this.isStroyAvailable = false,
    this.addHighligths = false,
    this.networkImage,
  });
  final double avatarSize;
  final bool isOnline;
  final bool isPost;
  final bool isStroyAvailable;
  final bool addHighligths;
  final String? networkImage;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: CustomPaint(
        painter: GradientBorder(
            bRadius: 100,
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: isStroyAvailable
                  ? <Color>[
                      AppColors.instaSandle,
                      AppColors.instaOrange,
                      AppColors.instaPink,
                      AppColors.instaPurple,
                      // AppColors.instaBlue,
                    ]
                  : <Color>[Colors.grey, Colors.grey],
            ),
            sWidth: isStroyAvailable ? 10 : 3,),
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
                child: networkImage != null
                    ? CircleAvatar(
                        radius: avatarSize,
                        backgroundImage: NetworkImage(networkImage!),)
                    : CircleAvatar(
                        radius: avatarSize,
                        backgroundImage: const AssetImage(AppAssets.defultDp),),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: isPost
                      ? GestureDetector(
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
                        )
                      : isOnline
                          ? Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.green,
                                  border: Border.all(
                                      width: 2,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,),),
                            )
                          : const SizedBox(),),
              if (addHighligths) const Positioned.fill(
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
}
