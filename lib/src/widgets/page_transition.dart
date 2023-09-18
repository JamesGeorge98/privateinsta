import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PIPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  PIPageRoute({
    this.direction = AxisDirection.right,
    required this.child,
    RouteSettings? settings,
  }) : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: getBeginOffset(), end: Offset.zero)
            .animate(animation),
        child: child,
      );

  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.left:
        return const Offset(1, 0);
      case AxisDirection.right:
        return const Offset(-1, 0);

      default:
        return const Offset(1, 0);
    }
  }
}

class FadeOnScroll extends StatefulWidget {
  final PageController controller;
  final double zeroOpacityOffset;
  final double fullOpacityOffset;
  final Widget child;

  const FadeOnScroll(
      {super.key,
      required this.controller,
      required this.child,
      this.zeroOpacityOffset = 0,
      this.fullOpacityOffset = 0});

  @override
  State<FadeOnScroll> createState() => _FadeOnScrollState();
}

class _FadeOnScrollState extends State<FadeOnScroll> {
  late ScrollDirection swipe;
  @override
  initState() {
    super.initState();
    swipe = ScrollDirection.idle;
    widget.controller.addListener(_setOffset);
  }

  @override
  dispose() {
    widget.controller.removeListener(_setOffset);
    super.dispose();
  }

  void _setOffset() {
    if (widget.controller.position.userScrollDirection !=
        ScrollDirection.idle) {
      swipe = widget.controller.position.userScrollDirection;
      setState(() {});
    }
  }

  double _calculateOpacity() {
    if (swipe == ScrollDirection.forward) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _calculateOpacity(),
      child: widget.child,
    );
  }
}
