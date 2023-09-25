import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:martinpulgarapp/constants/constant.dart';
import 'package:martinpulgarapp/screens/log_diary/components/form_title.dart';
import 'package:martinpulgarapp/screens/log_diary/provider/diary_provider.dart';
import 'package:martinpulgarapp/widget_keys.dart';

class AddCommentForm extends ConsumerStatefulWidget {
  const AddCommentForm({super.key});

  @override
  ConsumerState<AddCommentForm> createState() => _AddCommentFormState();
}

class _AddCommentFormState extends ConsumerState<AddCommentForm> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(diaryProvider.notifier);
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            FormTitle(title: comments),
            TextFormField(
              key: WidgetKeys.commentTextFormField,
              controller: _textController,
              decoration: InputDecoration(
                labelText: comments,
              ),
              onChanged: (value) {
                provider.updateComment(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
