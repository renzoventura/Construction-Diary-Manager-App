# Martin Pulgar Construction App

## Introduction

Martin Pulgar Construction is a fictitious construction company. This mobile app lets their ground staff to upload photos for logging purposes.

## How to run app
- **Run this command to created the generated files for the models**

  ```dart  run build_runner build --delete-conflicting-outputs```

- **Run this command **
  ```flutter run -t lib/main.dart ```

## How to run integrated tests
- **Run this command**

  ```flutter test integration_test/app_test.dart```

## Features

- **App Images**: The app provides access to the users gallery, to upload photos as part of their diary log.

- **Date picker**: Users can easily select which date the entry is for - based on their OS.

- **Tag system**: Tags are generated when users submits a text on the tag form. Users Can delete this later by tapping on the tags.

- **Simple form system**: Users are able to enter information on the app easily, with check boxes that hide forms if they are not needed but will appear when enabled. Dropdown options to make it easier to fill up the forms, instead of typing it up and simple textfields.

- **Popup**: Simple pop up messages to display if the diary entry is successful or not 

## State management
This app uses Riverpod for state management. The state management logic is implemented using the DiaryProvider class. Here's how it works:

- The DiaryProvider is created as a StateNotifierProvider and is responsible for managing the app's state.

- DiaryProvider initializes the state with empty feeds, no loading.

- As the user fills in the information on the form images, dates, text info are stores in the DiaryFormModel

- The DiaryFormModel class defines the structure of the app's state, including feeds(user info), loading status.

## Libraries Used
This app utilizes the following Flutter packages:

- flutter_riverpod: Our state management library of choice.
- getIt: For dependency injection, to access our api calls.
- dio: A Http client.
- json_annotation: Helps with serialization.
- path_provider: For file accessing with images
- intl: Date formatting 
- image: library to convert images to base64 
- fluttertoast: Easy pop up messages to let user know of the state of the app

