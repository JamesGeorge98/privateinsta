import 'package:flutter/material.dart';

class BottomSheets {
  BottomSheets({required this.context, this.child});
  final BuildContext context;
  final Widget? child;

  void menuBottomSheets() {
    showModalBottomSheet<int>(
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),),
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
                    itemBuilder: (BuildContext context, int index) => const ListTile(),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(indent: 100),
                    itemCount: 13,),
              ),
            ],
          ),
        );
      },
    );
  }
}
