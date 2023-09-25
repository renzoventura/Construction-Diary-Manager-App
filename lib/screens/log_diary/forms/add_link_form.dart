import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:martinpulgarapp/constants/constant.dart';
import 'package:martinpulgarapp/screens/log_diary/components/dropdown_form.dart';
import 'package:martinpulgarapp/screens/log_diary/components/form_title_checkbox.dart';
import 'package:martinpulgarapp/screens/log_diary/provider/diary_provider.dart';

class AddLinkForm extends ConsumerStatefulWidget {
  const AddLinkForm({Key? key}) : super(key: key);

  @override
  ConsumerState<AddLinkForm> createState() => _AddLinkFormState();
}

class _AddLinkFormState extends ConsumerState<AddLinkForm> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(diaryProvider.notifier);

    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FormTitleCheckbox(
              title: linkToExistingEvent,
              onChange: (bool value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            if (isChecked)
              DropdownForm(
                hintText: selectAnEvent,
                options: eventOptions,
                onChange: (String value) {
                  provider.updateEvent(value);
                },
              ),
          ],
        ),
      ),
    );
  }
}
