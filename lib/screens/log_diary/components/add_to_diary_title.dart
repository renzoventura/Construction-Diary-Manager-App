import 'package:flutter/material.dart';
import 'package:martinpulgarapp/constants/constant.dart';

class AddToDiaryTitle extends StatelessWidget {
  const AddToDiaryTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            addToSiteDiary,
            style: addToSiteDiaryTextStyle,
          ),
          const TooltipWidget(),
        ],
      ),
    );
  }
}

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Tooltip(
          message: showInformation,
          child: InkWell(
            onTap: () {
              showPopup(context);
            },
            child: const Icon(
              Icons.help,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(information),
          content: Text(
            "1.$addLogInformation \n\n2.$instruction1 \n\n3.$instruction2",
            textAlign: TextAlign.start,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(close),
            ),
          ],
        );
      },
    );
  }
}
