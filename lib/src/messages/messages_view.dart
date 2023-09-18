import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  static const routeName = '/messagescreen';

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late final CustomWidgets customWidgets;

  @override
  void initState() {
    customWidgets = CustomWidgets(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: PITextButton(
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
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        leadingWidth: 20,
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
        child: Column(
          children: [customWidgets.instaSearchBar(), messageListTile()],
        ),
      ),
    );
  }

  Widget messageListTile() {
    return const ListTile();
  }
}
