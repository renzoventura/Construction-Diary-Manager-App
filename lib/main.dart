import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:martinpulgarapp/constants/constant.dart';
import 'package:martinpulgarapp/di/setup_dependencies.dart';

import 'screens/log_diary/log_diary_screen.dart';

void main() {
  setUpDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColor,
        ),
        unselectedWidgetColor: Colors.transparent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              primaryColor,
            ), // Change the color here
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
      home: const LogDiaryScreen(),
    );
  }
}
