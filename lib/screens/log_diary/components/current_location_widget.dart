import 'package:flutter/material.dart';
import 'package:martinpulgarapp/constants/constant.dart';

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: grey,
          ),
          const SizedBox(width: 8),
          Text(
            locationId,
            style: locationTextStyle,
          ),
        ],
      ),
    );
  }
}
