import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/main_screen/main_screen.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/extensions.dart';
import 'package:privateinsta/src/widgets/page_transition.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  static const routeName = '/reelscreen';

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  late final PageController _controller;
  late final List<Widget> reels;

  @override
  void initState() {
    _controller = PageController();
    reels = List.generate(
        10,
        (index) => SingleReelsView(
              index: index,
            ));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MainScreen.setIshome(context: context, swipable: false);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          scrollDirection: Axis.vertical,
          controller: _controller,
          children: reels,
        ),
        SizedBox(
            height: Theme.of(context).appBarTheme.toolbarHeight ?? 80,
            child: appbar()),
      ],
    );
  }

  Widget appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: FadeOnScroll(
        controller: _controller,
        fullOpacityOffset: 180,
        child: const Row(
          children: [
            Text(
              "Reels",
              style: TextStyle(fontSize: 24),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 25,
            ),
          ],
        ),
      ),
      actions: [
        PITextButton(onPressed: () {}, child: const Icon(AppIcons.camera))
            .iconButton(context)
      ],
    );
  }
}

class SingleReelsView extends StatefulWidget {
  const SingleReelsView({super.key, required this.index});

  final int index;

  @override
  State<SingleReelsView> createState() => _SingleReelsViewState();
}

class _SingleReelsViewState extends State<SingleReelsView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Card(child: Center(child: Text("${widget.index}")))),
        Positioned(right: 0, bottom: 0, child: likeShareComment()),
        Positioned(left: 20, bottom: 40, child: profileInfo())
      ],
    );
  }

  Widget profileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: LimitedBox(
                  maxHeight: MediaQuery.of(context).size.height * .05,
                  child: CustomWidgets(context: context).displayPictureView(),
                )),
            const SizedBox().sizedWidth(width: 7),
            const Text("Username"),
            const SizedBox().sizedWidth(width: 7),
            PIOutlinedButton(
                onPressed: () {},
                child: Text(
                  "Follow",
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.bodyLarge?.color),
                )).basic(context)
          ],
        ),
        const Text("Tag your friend"),
      ],
    );
  }

  Widget likeShareComment() {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        PITextButton(
          onPressed: () {},
          child: const Icon(
            Icons.more_horiz_rounded,
            size: 25,
          ),
        ).iconButton(context),
      ],
    );
  }
}
