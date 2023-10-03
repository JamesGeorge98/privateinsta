import 'dart:math';

import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/display_picture.dart';
import 'package:privateinsta/src/widgets/extensions.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  static const String routeName = '/notificationscreen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final Random _random = Random();
  int next(int min, int max) => min + _random.nextInt(max - min);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: PITextButton(
            onPressed: () {},
            child: const Text(
              'Notification',
              style: TextStyle(
                fontSize: 20,
              ),
            ),).iconButton(context),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20, right: 10),
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Last 7 days',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox().sizedHeight(),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) =>
                      next(0, 2) == 1
                          ? next(0, 2) == 0
                              ? likedTile(index)
                              : commentTile(index)
                          : followingTile(index),
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox().sizedHeight(height: 15),),
              const SizedBox().sizedHeight(height: 30),
              const Text(
                'Last 30 days',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox().sizedHeight(),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) =>
                      next(0, 2) == 1
                          ? next(0, 2) == 0
                              ? likedTile(index)
                              : commentTile(index)
                          : followingTile(index),
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox().sizedHeight(height: 15),),
            ],
          ),
        ),
      ),
    );
  }

  Widget likedTile(int index) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const DisplayPicture(avatarSize: 50),
      title: Text(
        'user$index liked your photo',
        style: const TextStyle(fontSize: 14),
      ),
      trailing: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).textTheme.bodyMedium?.color ??
                    AppColors.white,),),
      ),
    );
  }

  Widget commentTile(int index) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      minVerticalPadding: 0,
      titleAlignment: ListTileTitleAlignment.top,
      leading: const DisplayPicture(avatarSize: 50),
      title: Text(
        'user$index mentioned you in a comment: ',
        style: const TextStyle(fontSize: 14),
      ),
      subtitle: Text('@username ' * next(1, 5)),
      trailing: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).textTheme.bodyMedium?.color ??
                    AppColors.white,),),
      ),
    );
  }

  Widget followingTile(int index) {
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: const DisplayPicture(avatarSize: 50),
        title: Text(
          'user$index started following you',
          style: const TextStyle(fontSize: 14),
        ),
        trailing:
            PIElevatedButton(onPressed: () {}, child: const Text('Following'))
                .sameThemeButton(context),);
  }
}
