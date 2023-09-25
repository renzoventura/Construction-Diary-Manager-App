import 'package:flutter/material.dart';

class FormTitleCheckbox extends StatefulWidget {
  const FormTitleCheckbox({
    Key? key,
    required this.title,
    required this.onChange,
  }) : super(key: key);

  final String title;
  final Function(bool) onChange;

  @override
  State<FormTitleCheckbox> createState() => _FormTitleCheckboxState();
}

class _FormTitleCheckboxState extends State<FormTitleCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: Checkbox(
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
        ),
        const Divider(),
      ],
    );
  }
}
