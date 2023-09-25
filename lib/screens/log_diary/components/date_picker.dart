import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:martinpulgarapp/widget_keys.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.onDateChange});

  final Function(DateTime) onDateChange;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    controller.text = formatDate(selectedDate);
    super.initState();
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    if (Platform.isAndroid) {
      _androidDatePicker(context);
    } else {
      _iosDatePicker(context);
    }
  }

  Future<void> _androidDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    setState(() {
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        controller.text = formatDate(selectedDate);
      }
      widget.onDateChange(selectedDate);
    });
  }

  void _iosDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: selectedDate,
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                selectedDate = newDate;
                controller.text = formatDate(selectedDate);
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: WidgetKeys.datePicker,
      onTap: () {
        _selectDate(context);
      },
      child: IgnorePointer(
        child: TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            suffixIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
