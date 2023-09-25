import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:martinpulgarapp/screens/log_diary/components/diary_image.dart';
import 'package:martinpulgarapp/screens/log_diary/provider/diary_provider.dart';

class ListOfImages extends ConsumerWidget {
  const ListOfImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(diaryProvider.notifier);
    final model = ref.watch(diaryProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          model.photos.length,
          (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DiaryImage(
                  path: model.photos[index].path,
                  onRemoveTap: () => provider.removePhoto(index),
                ),
                if (index < model.photos.length - 1) const SizedBox(width: 12),
              ],
            );
          },
        ),
      ),
    );
  }
}
