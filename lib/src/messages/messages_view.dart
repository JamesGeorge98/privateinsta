import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/main_screen/main_screen.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/display_picture.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  static const routeName = '/messagescreen';

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late final CustomWidgets customWidget;
  List<String> tabs = ["Primary", "General", "Requested", "Channel"];

  @override
  void initState() {
    customWidget = CustomWidgets(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                MainScreen.changePage(context: context, index: false);
              },
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            PITextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text(
                      "_james_george_",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 25,
                    ),
                  ],
                )).iconButton(context),
          ],
        ),
        actions: [
          PITextButton(
              onPressed: () {
                //Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
              child: const Icon(
                Icons.more_horiz_rounded,
                size: 25,
              )).iconButton(context),
          PITextButton(
              onPressed: () {},
              child: const Icon(
                Icons.edit_square,
                size: 30,
              )).iconButton(context),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              messageSearchBar(),
              const SizedBox().sizedHeight(),
              LimitedBox(
                maxHeight: MediaQuery.of(context).size.height * .09,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        const DisplayPicture.online(),
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox().sizedWidth(width: 5)),
              ),
              const SizedBox().sizedHeight(),
              LimitedBox(
                maxHeight: MediaQuery.of(context).size.height * .04,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        PIElevatedButton(
                            onPressed: () {},
                            child: Text(
                              tabs[index],
                              style: const TextStyle(fontSize: 12),
                            )).sameThemeButton(context),
                    itemCount: 4,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox().sizedWidth(width: 5)),
              ),
              const SizedBox().sizedHeight(),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) =>
                      messageListTile(index),
                  itemCount: 30,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox().sizedHeight(height: 15))
            ],
          ),
        ),
      ),
    );
  }

  Widget messageListTile(int index) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const DisplayPicture(avatarSize: 50),
      title: Text("Username$index"),
      trailing: const Icon(AppIcons.camera),
    );
  }

  Widget messageSearchBar(
      {void Function()? onTap,
      void Function()? cancelOnPressed,
      void Function(PointerDownEvent)? onTapOutside,
      String? hintText,
      bool isSerachFocused = false}) {
    return Row(
      children: [
        Expanded(
            child: customWidget.instaSearchBar(
                onTap: onTap, onTapOutside: onTapOutside)),
        TextButton(
            onPressed: cancelOnPressed,
            style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
            child: const Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "Filter",
                  style: TextStyle(fontSize: 12, color: AppColors.blue),
                ),
              ),
            ))
      ],
    );
  }
}
