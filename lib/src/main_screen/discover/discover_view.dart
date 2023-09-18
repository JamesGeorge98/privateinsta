import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/dimensions.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  static const routeName = '/discoverscreen';

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late CustomWidgets customWidget;
  bool isSerachFocused = false;
  @override
  void initState() {
    customWidget = CustomWidgets(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrollable) => [
        SliverAppBar(
          floating: true,
          automaticallyImplyLeading: false,
          title: customWidget.instaSearchBar(
              cancelOnPressed: () {
                isSerachFocused = !isSerachFocused;
                FocusScope.of(context).unfocus();
                setState(() {});
              },
              isSerachFocused: isSerachFocused,
              onTap: () {
                isSerachFocused = !isSerachFocused;
                setState(() {});
              }),
        )
      ],
      body: SingleChildScrollView(
        child: !isSerachFocused
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  grids(textDirection: TextDirection.rtl),
                  grids(textDirection: TextDirection.ltr),
                  grids(textDirection: TextDirection.rtl),
                ],
              )
            : const Placeholder(),
      ),
    );
  }

  Directionality grids({TextDirection textDirection = TextDirection.ltr}) {
    return Directionality(
        textDirection: textDirection,
        child: Row(
          children: [
            Expanded(
              child: customWidget.asceptRatioCart(ratio: Dimensions.half),
            ),
            Expanded(
              child: Column(
                children: [
                  customWidget.asceptRatioCart(ratio: Dimensions.post),
                  customWidget.asceptRatioCart(ratio: Dimensions.post)
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  customWidget.asceptRatioCart(ratio: Dimensions.post),
                  customWidget.asceptRatioCart(ratio: Dimensions.post)
                ],
              ),
            ),
          ],
        ));
  }
}
