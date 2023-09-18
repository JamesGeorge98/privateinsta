import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/page_transition.dart';

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
    reels = List.generate(10, (index) => const SingleReelsView());
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
        child: const Text(
          "Reels",
          style: TextStyle(fontSize: 24),
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
  const SingleReelsView({super.key});

  @override
  State<SingleReelsView> createState() => _SingleReelsViewState();
}

class _SingleReelsViewState extends State<SingleReelsView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: Card(child: Center(child: Text("11")))),
        Positioned(right: 0, bottom: 0, child: likeShareComment())
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
            Icons.more_vert_rounded,
            size: 35,
          ),
        ).iconButton(context),
      ],
    );
  }
}
