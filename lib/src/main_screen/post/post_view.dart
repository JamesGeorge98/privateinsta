import 'package:flutter/material.dart';
import 'package:privateinsta/src/main_screen/main_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  static const routeName = '/postscreen';

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MainScreen.setIshome(context: context, swipable: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TabBarView(children: [
                Text("dasda"),
                Text("dasda"),
                Text("dasda"),
                Text("dasda"),
              ]),
            ),
            TabBar(
              isScrollable: true,
              physics: NeverScrollableScrollPhysics(),
              indicatorColor: Colors.transparent,
              tabs: [
                Padding(
                  padding: EdgeInsets.only(left: 150),
                  child: Tab(
                    child: Text(
                      'POST',
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'STORY',
                  ),
                ),
                Tab(
                  child: Text('REEL'),
                ),
                Tab(
                  child: Text('LIVE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
