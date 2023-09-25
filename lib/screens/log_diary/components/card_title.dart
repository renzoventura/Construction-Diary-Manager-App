import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        const Divider(),
      ],
    );
  }
}
