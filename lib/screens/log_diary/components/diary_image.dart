import 'dart:io';

import 'package:flutter/material.dart';
import 'package:martinpulgarapp/screens/log_diary/components/remove_image_button.dart';

class DiaryImage extends StatelessWidget {
  const DiaryImage({Key? key, required this.path, required this.onRemoveTap})
      : super(key: key);

  final String path;
  final Function onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 90,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Center(
              child: Image.file(
                File(path),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: -8,
            right: 2,
            child: RemoveImageButton(
              onRemoveTap: onRemoveTap,
            ),
          ),
        ],
      ),
    );
  }
}
