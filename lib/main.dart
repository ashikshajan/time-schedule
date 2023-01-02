import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scheduler/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

          // ignore: deprecated_member_use
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
    );
  }
}

// 
