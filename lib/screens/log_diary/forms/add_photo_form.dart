import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:martinpulgarapp/constants/constant.dart';
import 'package:martinpulgarapp/screens/log_diary/components/form_title.dart';
import 'package:martinpulgarapp/screens/log_diary/components/checkbox_widget.dart';
import 'package:martinpulgarapp/screens/log_diary/components/list_of_images.dart';
import 'package:martinpulgarapp/widget_keys.dart';

import '../provider/diary_provider.dart';

class AddPhotoForm extends ConsumerStatefulWidget {
  const AddPhotoForm({super.key});

  @override
  ConsumerState<AddPhotoForm> createState() => _AddPhotoFormState();
}

class _AddPhotoFormState extends ConsumerState<AddPhotoForm> {
  bool isUploadingPhotos = false;
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(diaryProvider.notifier);
    final model = ref.watch(diaryProvider);

    Future<void> pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        provider.addPhoto(pickedFile);
      }
    }

    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FormTitle(title: addPhotosToSiteDiary),
            if (isUploadingPhotos)
              Column(
                children: [
                  if (model.photos.isNotEmpty)
                    const SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: ListOfImages(),
                    ),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      key: WidgetKeys.addImageButton,
                      onPressed: pickImage,
                      child: Text(addPhoto),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 12),
            CheckboxWidget(
              checkBoxKey: WidgetKeys.photoCheckBox,
              title: includeInPhotoGallery,
              onChange: (bool value) {
                setState(() {
                  isUploadingPhotos = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
