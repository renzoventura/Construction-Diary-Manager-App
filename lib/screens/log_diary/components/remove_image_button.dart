import 'package:flutter/material.dart';

class RemoveImageButton extends StatelessWidget {
  const RemoveImageButton({Key? key, required this.onRemoveTap})
      : super(key: key);

  final Function onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onRemoveTap.call();
      },
      child: const SizedBox(
        width: 20,
        height: 20,
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.close,
              color: Colors.white, // Icon color
              size: 18, // Icon size
            ),
          ),
        ),
      ),
    );
  }
}
