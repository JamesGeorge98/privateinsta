import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/widgets/buttons.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    reels = List.generate(10, (index) => const SingleReelsView());
    return PageView(
      scrollDirection: Axis.vertical,
      controller: _controller,
      children: reels,
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          const Positioned.fill(child: Card(child: Center(child: Text("11")))),
          Positioned(child: appbar()),
          Positioned(right: 0, bottom: 0, child: likeShareComment())
        ],
      ),
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

  Widget appbar() {
    return AppBar(
      title: const Text(
        "Reels",
        style: TextStyle(fontSize: 24),
      ),
      actions: [
        PITextButton(onPressed: () {}, child: const Icon(AppIcons.camera))
            .iconButton(context)
      ],
    );
  }
}
