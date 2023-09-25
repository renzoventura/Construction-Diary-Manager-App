import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:martinpulgarapp/constants/constant.dart';
import 'package:martinpulgarapp/di/setup_dependencies.dart';
import 'package:martinpulgarapp/main.dart';
import 'package:martinpulgarapp/screens/log_diary/components/list_of_images.dart';
import 'package:martinpulgarapp/screens/log_diary/components/submit_button.dart';
import 'package:martinpulgarapp/widget_keys.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'End to end integration tests',
    () {
      setUpDependencies();
      testWidgets(
        'Add photo feature is hidden on start',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();
          expect(find.byType(ListOfImages), findsNothing);
        },
      );
      testWidgets(
        'Add photo button is visible when checkbox is enabled',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();
          final checkBox = find.byKey(WidgetKeys.photoCheckBox);
          await tester.tap(checkBox);
          await tester.pump();
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.addImageButton), findsOneWidget);
        },
      );

      ///Cant find a way to test image picker - Could be possible to mock it in code?
      // testWidgets(
      //   'Images should appear when user picks an image',
      //   (tester) async {
      //     await tester.pumpWidget(const ProviderScope(child: MyApp()));
      //     await tester.pumpAndSettle();
      //     final checkBox = find.byKey(WidgetKeys.photoCheckBox);
      //     await tester.tap(checkBox);
      //     await tester.pump();
      //     await tester.pumpAndSettle();
      //     final addImageButton = find.byKey(WidgetKeys.addImageButton);
      //     await tester.tap(checkBox);
      //     await tester.pump();
      //     await tester.pumpAndSettle();
      //     //Cant test native imagePicker - ?
      //     expect(find.byType(DiaryImage), findsOneWidget);
      //   },
      // );
      // testWidgets(
      //   'Images should disappear when user taps on delete',
      //   (tester) async {
      //     await tester.pumpWidget(const ProviderScope(child: MyApp()));
      //     await tester.pumpAndSettle();
      //     final checkBox = find.byKey(WidgetKeys.photoCheckBox);
      //     await tester.tap(checkBox);
      //     await tester.pump();
      //     await tester.pumpAndSettle();
      //     final addImageButton = find.byKey(WidgetKeys.addImageButton);
      //     await tester.tap(addImageButton);
      //     await tester.pump();
      //     await tester.pumpAndSettle();
      //     //Cant test native imagePicker - ?
      //     expect(find.byType(DiaryImage), findsOneWidget);
      //     final removeImageButton = find.byType(RemoveImageButton);
      //     await tester.tap(removeImageButton);
      //     await tester.pump();
      //     await tester.pumpAndSettle();
      //     expect(find.byType(DiaryImage), findsNothing);
      //   },
      // );

      testWidgets(
        'Comment TextFormField Test',
        (tester) async {
          String commentToEnter = "The day was good!";
          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();

          /// Find TextFormField widget by Key and enter text
          await tester.enterText(
              find.byKey(WidgetKeys.commentTextFormField), commentToEnter);
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(find.text("The day was good!"), findsOneWidget);
        },
      );

      if (Platform.isAndroid) {
        testWidgets(
          'Date picker test (Android)',
          (tester) async {
            DateTime now = DateTime.now();
            String dateChosen = "20";
            await tester.pumpWidget(const ProviderScope(child: MyApp()));
            await tester.pumpAndSettle();

            await tester.tap(find.byKey(WidgetKeys.datePicker));
            await tester.pump();
            await tester.pumpAndSettle();

            await tester.tap(find.text(dateChosen));
            await tester.pumpAndSettle(const Duration(seconds: 1));
            await tester.tap(find.text('OK'));
            await tester.pump();
            await tester.pumpAndSettle();

            String newMonth =
                now.month > 9 ? now.month.toString() : "0${now.month}";

            String newDate = "${now.year}-$newMonth-$dateChosen";
            expect(find.text(newDate), findsOneWidget);
          },
        );
      }

      testWidgets(
        'Dropdown Area Test',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();

          await tester.tap(find.byKey(WidgetKeys.areaDropDown));
          await tester.pump();
          await tester.pumpAndSettle();
          await tester.tap(find.text(areaOptions[0]));
          await tester.pump();
          await tester.pumpAndSettle();
          expect(find.text(areaOptions[0]), findsOneWidget);
        },
      );

      testWidgets(
        'Dropdown Tasks Test',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();

          await tester.tap(find.byKey(WidgetKeys.areaDropDown));
          await tester.pump();
          await tester.pumpAndSettle();
          await tester.tap(find.text(areaOptions[2]));
          await tester.pump();
          await tester.pumpAndSettle();
          expect(find.text(areaOptions[2]), findsOneWidget);
        },
      );

      testWidgets(
        'Dropdown tags Test - Tag is not created until user submits',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();

          await tester.enterText(
              find.byKey(WidgetKeys.tagFormField), "this is a test");
          await tester.pump();
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.tag), findsNothing);
        },
      );

      testWidgets(
        'Dropdown tags Test - Tag created is when user submits',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();

          await tester.enterText(
              find.byKey(WidgetKeys.tagFormField), "this is a tag");
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.tag), findsOneWidget);
        },
      );

      testWidgets(
        'Dropdown tags Test - Tag is not created when user does not submit but enters text',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();

          await tester.enterText(
              find.byKey(WidgetKeys.tagFormField), "this is a tag");
          await tester.pump();
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.tag), findsNothing);
        },
      );

      testWidgets(
        'Dropdown tags Test - Tag created is when user submits - Creates 2 tags',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();

          await tester.enterText(find.byKey(WidgetKeys.tagFormField), "Tag1");
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(WidgetKeys.tagFormField));
          await tester.enterText(find.byKey(WidgetKeys.tagFormField), "Tag2");
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.tag), findsAtLeastNWidgets(2));
        },
      );

      testWidgets(
        'Dropdown tags Test - User creates 1 tag and deletes 1',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: MyApp()));
          await tester.pumpAndSettle();

          await tester.enterText(find.byKey(WidgetKeys.tagFormField), "Tag1");
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          await tester.pumpAndSettle();
          await tester.tap(find.descendant(
            of: find.byKey(WidgetKeys.tag),
            matching: find.byIcon(Icons.cancel),
          ));
          await tester.pump();
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.tag), findsNothing);
        },
      );

      testWidgets('No loading indicator until user taps submit button',
          (WidgetTester tester) async {
        await tester.pumpWidget(const ProviderScope(child: MyApp()));
        await tester.pumpAndSettle();
        final listView = find.byType(SingleChildScrollView);

        await tester.drag(listView, Offset(0, -400));

        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsNothing);
      });

      testWidgets('Tap submit check loading Indicator',
          (WidgetTester tester) async {
        await tester.pumpWidget(const ProviderScope(child: MyApp()));
        await tester.pumpAndSettle();
        final listView = find.byType(SingleChildScrollView);

        await tester.drag(listView, Offset(0, -400));

        await tester.pump();
        await tester.tap(find.byType(SubmitButton));
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    },
  );
}
