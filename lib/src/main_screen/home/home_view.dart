import 'package:flutter/material.dart';
import 'package:privateinsta/src/widgets/appbar,.dart';
import 'package:privateinsta/src/widgets/sizedbox.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PIAppBar(
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: LimitedBox(
                  maxHeight: MediaQuery.of(context).size.height * .1,
                  maxWidth: MediaQuery.of(context).size.height * .1,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          CustomWidgets().displayPictureView(
                              index: index,
                              context: context,
                              isStroy: index == 0 ? false : true,
                              isStoryViwed: false),
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) =>
                          PISizedBox().sizedWidth(width: 5)),
                )),
            PISizedBox().sizedHeight(height: 10),
            CustomWidgets().instaPostFeedView(context: context),
          ],
        ),
      ),
    );
  }
}
