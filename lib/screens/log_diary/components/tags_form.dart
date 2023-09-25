import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:martinpulgarapp/constants/constant.dart';
import 'package:martinpulgarapp/screens/log_diary/provider/diary_provider.dart';
import 'package:martinpulgarapp/widget_keys.dart';

class TagInputFormField extends ConsumerStatefulWidget {
  const TagInputFormField({super.key});

  @override
  ConsumerState<TagInputFormField> createState() => _TagInputFormFieldState();
}

class _TagInputFormFieldState extends ConsumerState<TagInputFormField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(diaryProvider.notifier);
    final model = ref.watch(diaryProvider);

    void addTag() {
      final String tag = _controller.text.trim();
      if (tag.isNotEmpty && !model.tags.contains(tag)) {
        provider.addTag(tag);
        _controller.clear();
      }

      if (model.tags.contains(tag)) {
        final snackBar = SnackBar(content: Text(tagAlreadyAdded));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                key: WidgetKeys.tagFormField,
                controller: _controller,
                decoration: InputDecoration(hintText: tags),
                onSubmitted: (String text) {
                  addTag();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.start,
          children: model.tags.map((tag) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: Chip(
                key: WidgetKeys.tag,
                label: Text(tag),
                onDeleted: () {
                  provider.removeTag(tag);
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
