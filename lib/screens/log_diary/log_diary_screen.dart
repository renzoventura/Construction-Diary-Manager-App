import 'package:flutter/material.dart';
import 'package:martinpulgarapp/constants/constant.dart';
import 'package:martinpulgarapp/screens/log_diary/forms/add_comment_form.dart';
import 'package:martinpulgarapp/screens/log_diary/forms/add_details_form.dart';
import 'package:martinpulgarapp/screens/log_diary/forms/add_link_form.dart';
import 'package:martinpulgarapp/screens/log_diary/forms/add_photo_form.dart';
import 'package:martinpulgarapp/screens/log_diary/components/add_to_diary_title.dart';
import 'package:martinpulgarapp/screens/log_diary/components/current_location_widget.dart';
import 'package:martinpulgarapp/screens/log_diary/components/submit_button.dart';

class LogDiaryScreen extends StatelessWidget {
  const LogDiaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(newDiary),
        centerTitle: false,
        backgroundColor: Colors.black,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          const CurrentLocationWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Column(
                  children: [
                    SizedBox(height: spaceBetweenForms),
                    const AddToDiaryTitle(),
                    SizedBox(height: spaceBetweenForms),
                    const SizedBox(
                      width: double.infinity,
                      child: AddPhotoForm(),
                    ),
                    SizedBox(height: spaceBetweenForms),
                    const AddCommentForm(),
                    SizedBox(height: spaceBetweenForms),
                    const AddDetailsForm(),
                    SizedBox(height: spaceBetweenForms),
                    const AddLinkForm(),
                    SizedBox(height: spaceBetweenForms),
                    const SubmitButton(),
                    const SizedBox(height: 54),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
