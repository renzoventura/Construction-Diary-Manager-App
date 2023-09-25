import 'package:flutter/material.dart';

class DropdownForm extends StatefulWidget {
  const DropdownForm({
    super.key,
    required this.hintText,
    required this.options,
    required this.onChange,
    this.dropdownKey,
  });

  final String hintText;
  final List<String> options;
  final Function(String) onChange;
  final Key? dropdownKey;

  @override
  State<DropdownForm> createState() => _DropdownFormState();
}

class _DropdownFormState extends State<DropdownForm> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton<String>(
          key: widget.dropdownKey,
          hint: Text(widget.hintText),
          value: selectedValue,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.grey,
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedValue = newValue;
              });
              widget.onChange(newValue);
            }
          },
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
