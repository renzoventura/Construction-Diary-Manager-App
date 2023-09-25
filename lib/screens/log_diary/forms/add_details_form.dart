import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:martinpulgarapp/constants/constant.dart';
import 'package:martinpulgarapp/screens/log_diary/components/date_picker.dart';
import 'package:martinpulgarapp/screens/log_diary/components/dropdown_form.dart';
import 'package:martinpulgarapp/screens/log_diary/components/form_title.dart';
import 'package:martinpulgarapp/screens/log_diary/components/tags_form.dart';
import 'package:martinpulgarapp/screens/log_diary/provider/diary_provider.dart';
import 'package:martinpulgarapp/widget_keys.dart';

class AddDetailsForm extends ConsumerWidget {
  const AddDetailsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(diaryProvider.notifier);
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // key: _formKey,
          child: Column(
            children: <Widget>[
              FormTitle(title: details),
              DatePicker(
                onDateChange: (DateTime value) {
                  provider.updateDate(value);
                },
              ),
              DropdownForm(
                hintText: taskCategory,
                options: taskOptions,
                onChange: (value) {
                  provider.updateCategory(value);
                },
                dropdownKey: WidgetKeys.taskDropDown,
              ),
              DropdownForm(
                hintText: selectArea,
                options: areaOptions,
                onChange: (value) {
                  provider.updateArea(value);
                },
                dropdownKey: WidgetKeys.areaDropDown,
              ),
              const TagInputFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
