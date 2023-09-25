import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget(
      {super.key,
      required this.onChange,
      required this.title,
      this.checkBoxKey});

  final String title;
  final Function(bool) onChange;
  final Key? checkBoxKey;

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          widget.title,
          style: const TextStyle(color: Colors.grey),
        ),
        SizedBox(
          height: 24.0,
          width: 24.0,
          child: Checkbox(
            key: widget.checkBoxKey,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
                widget.onChange(isChecked);
              });
            },
          ),
        ),
      ],
    );
  }
}
