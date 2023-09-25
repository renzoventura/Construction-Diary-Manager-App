import 'package:flutter/material.dart';

///Strings
String newDiary = "New Diary";
String locationId = "20041075 | TAP-NS TAP-North Strathfield";
String next = "Next";
String showInformation = 'Show information to user';
String addToSiteDiary = "Add to site diary";
String information = "Information";
String addLogInformation = "Add all information related to diary";
String close = "Close";
String tags = "Tags";
String comments = "Comments";
String details = "Details";
String taskCategory = 'Task category';
String selectArea = 'Select Area';
String selectAnEvent = 'Select an Event';
String linkToExistingEvent = 'Link to existing event?';
String addPhotosToSiteDiary = "Add photos to site diary";
String addPhoto = "Add photo";
String includeInPhotoGallery = "Include in photo gallery";
String tagAlreadyAdded = "Tag already added";
String failedToPostEntry = "Failed to post entry";
String instruction1 = "Enable checkboxes to upload photos and events";
String instruction2 =
    "Submit after entering tags to create a tag, tap on created tag to delete it.";

//dropbox options
List<String> taskOptions = [
  "Site Preparation",
  "Foundation Work",
  "Structural Framing"
];

List<String> areaOptions = [
  "NSW",
  "VIC",
  "QLD",
  "SA",
  "WA",
  "TAS",
];

List<String> eventOptions = [
  "Project Kickoff Meeting",
  "Site Selection",
  "Client Handover"
];

///TextStyles
TextStyle locationTextStyle = TextStyle(
  color: grey,
);
TextStyle addToSiteDiaryTextStyle = const TextStyle(
  color: Colors.black,
  fontSize: 24,
);

//Colors
Color backgroundColor = const Color(0xffF1F5F7);
Color primaryColor = const Color(0xff97D700);
Color grey = const Color(0xff616161);

//Size
double spaceBetweenForms = 16;
