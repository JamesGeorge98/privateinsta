import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/src/main_screen/main_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  static const routeName = '/postscreen';

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool isPost = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MainScreen.setIshome(context: context, swipable: true);
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   DefaultTabController.of(context).removeListener(() {});
  //   DefaultTabController.of(context).dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Center(child: Text("1")),
                      Center(child: Text("2")),
                      Center(child: Text("3")),
                      Center(child: Text("4")),
                    ]),
              ),
              StatefulBuilder(builder: (context, setState) {
                DefaultTabController.of(context).addListener(() {
                  if (DefaultTabController.of(context).index == 0) {
                    isPost = true;
                    setState(() {});
                  } else {
                    isPost = false;
                    setState(() {});
                  }
                });
                return TabBar(
                  labelPadding: const EdgeInsets.all(0),
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.only(left: 170.0),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50)),
                            color: isPost
                                ? AppColors.darkFieldColor
                                : AppColors.transparent),
                        child: const Tab(
                          child: Text(
                            'POST',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: isPost
                              ? AppColors.darkFieldColor
                              : AppColors.transparent),
                      child: const Tab(
                        child: Text(
                          'STORY',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: isPost
                              ? AppColors.darkFieldColor
                              : AppColors.transparent),
                      child: const Tab(
                        child: Text(
                          'REEL',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 170.0),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 30, 0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                            color: isPost
                                ? AppColors.darkFieldColor
                                : AppColors.transparent),
                        child: const Tab(
                          child: Text(
                            'LIVE',
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
