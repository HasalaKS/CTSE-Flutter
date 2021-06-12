import 'package:technology_app/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Technology App',
      theme: ThemeData(),
      home: MainMenu(),
    );
  }
}