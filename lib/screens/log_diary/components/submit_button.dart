import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:martinpulgarapp/constants/constant.dart';
import 'package:martinpulgarapp/screens/log_diary/provider/diary_provider.dart';

class SubmitButton extends ConsumerWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(diaryProvider.notifier);
    final model = ref.watch(diaryProvider);

    return model.isLoading
        ? CircularProgressIndicator(
            color: primaryColor,
          )
        : SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                provider.postEntry();
              },
              child: Text(next),
            ),
          );
  }
}
