import 'package:flutter/material.dart';

class BottomSheets {
  BottomSheets({this.child, required this.context});
  final BuildContext context;
  final Widget? child;

  void menuBottomSheets() {
    showModalBottomSheet<int>(
      useSafeArea: true,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Column(
            children: [
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
                    itemBuilder: (context, index) => const ListTile(),
                    separatorBuilder: (context, index) =>
                        const Divider(indent: 100),
                    itemCount: 13),
              )
            ],
          ),
        );
      },
    );
  }
}
