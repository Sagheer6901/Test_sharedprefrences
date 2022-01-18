import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_sharedpreferencees/constants.dart';
import 'package:test_sharedpreferencees/screens/homepage_screen.dart';

void main() {
  SystemUiOverlayStyle(
    statusBarColor: Constants.primaryColor,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
