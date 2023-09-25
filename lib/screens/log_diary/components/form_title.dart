import 'package:flutter/material.dart';

class FormTitle extends StatefulWidget {
  const FormTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FormTitle> createState() => _FormTitleState();
}

class _FormTitleState extends State<FormTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}
