import 'package:flutter/material.dart';
import 'package:privateinsta/core/utils/country_code.dart';
import 'package:privateinsta/src/widgets/buttons.dart';
import 'package:privateinsta/src/widgets/texts.dart';

class BottomSheets {
  BottomSheets({required this.context, this.child});
  final BuildContext context;
  final Widget? child;

  void menuBottomSheets() {
    showModalBottomSheet<int>(
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      const ListTile(),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(indent: 100),
                  itemCount: 13,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<int?> countryCodeBottomSheets() {
    return showModalBottomSheet<int>(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                PITextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('canecl'),
                ).basic(),
                Align(
                  child: Text(
                    'Select Country',
                    style: PITextStyle().bodyTextStyle(),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    Navigator.of(context).pop(index);
                  },
                  title: Text(CountryCode.countryData[index].countryName),
                  trailing: const Text('12'),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(indent: 10),
                itemCount: CountryCode.countryData.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
