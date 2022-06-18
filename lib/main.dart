import 'package:flutter/material.dart';
import 'package:grocery_app/constants/theme_data.dart';
import 'package:grocery_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isDark = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Styles.themeData(true, context),
      home: HomeScreen(),
    );
  }
}
