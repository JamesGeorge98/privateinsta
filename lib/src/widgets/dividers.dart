import 'package:flutter/material.dart';

class PIDividers extends Divider {
  const PIDividers({super.key});

  static Widget centerText({required String text}) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: Colors.grey.shade500,
          indent: 20,
          endIndent: 20,
        )),
        Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
        Expanded(
            child: Divider(
          color: Colors.grey.shade500,
          indent: 20,
          endIndent: 20,
        ))
      ],
    );
  }
}
