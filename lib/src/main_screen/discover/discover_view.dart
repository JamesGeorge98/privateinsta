import 'package:flutter/material.dart';
import 'package:privateinsta/core/constants/dimensions.dart';
import 'package:privateinsta/src/main_screen/main_screen.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/widgets.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  static const String routeName = '/discoverscreen';

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late CustomWidgets customWidget;
  bool isSerachFocused = false;
  @override
  void initState() {
    customWidget = CustomWidgets(context: context);
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      MainScreen.setIshome(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrollable) => <Widget>[
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
              },),
        ),
      ],
      body: SingleChildScrollView(
        child: !isSerachFocused
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  grids(textDirection: TextDirection.rtl),
                  grids(),
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
          children: <Widget>[
            Expanded(
              child: customWidget.asceptRatioCart(ratio: Dimensions.half),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  customWidget.asceptRatioCart(),
                  customWidget.asceptRatioCart(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  customWidget.asceptRatioCart(),
                  customWidget.asceptRatioCart(),
                ],
              ),
            ),
          ],
        ),);
  }

  Widget discoverSearchbar(
      {void Function()? onTap,
      void Function()? cancelOnPressed,
      void Function(PointerDownEvent)? onTapOutside,
      String? hintText,
      bool isSerachFocused = false,}) {
    final double initialWidth =
        MediaQuery.of(context).size.width - 35; // without cancel button
    return Row(
      children: <Widget>[
        AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width: !isSerachFocused ? initialWidth : initialWidth - 60,
            child: customWidget.instaSearchBar(
                onTap: onTap, onTapOutside: onTapOutside,),),
        Expanded(
          child: Visibility(
            visible: isSerachFocused,
            child: PITextButton(
                onPressed: cancelOnPressed,
                child: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: FittedBox(
                    child: Text(
                      'cancel',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),).iconButton(context),
          ),
        ),
      ],
    );
  }
}
