import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/dimensions.dart';
import 'package:privateinsta/core/constants/icons.dart';
import 'package:privateinsta/src/main_screen/main_screen.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MainScreen.setIshome(context: context, swipable: false);
    });
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
          title: discoverSearchbar(
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

  Widget discoverSearchbar(
      {void Function()? onTap,
      void Function()? cancelOnPressed,
      void Function(PointerDownEvent)? onTapOutside,
      String? hintText,
      bool isSerachFocused = false}) {
    var initialWidth =
        MediaQuery.of(context).size.width - 35; // without cancel button
    return Row(
      children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width: !isSerachFocused ? initialWidth : initialWidth - 60,
            child: customWidget.instaSearchBar(
                onTap: onTap, onTapOutside: onTapOutside)),
        Expanded(
          child: Visibility(
            visible: isSerachFocused,
            child: PITextButton(
                onPressed: cancelOnPressed,
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "cancel",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )).iconButton(context),
          ),
        )
      ],
    );
  }
}
