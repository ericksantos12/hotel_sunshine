import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_sunshine/presentation/pages/main_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const MainView(),
      theme: ThemeData(
        // scaffoldBackgroundColor: AppColor.backgroundColor,
        // canvasColor: AppColor.backgroundColor
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(244, 144, 86, 1),
            brightness: Brightness.dark),
      ),
      title: 'Hotel Sunshine',
      debugShowCheckedModeBanner: false,
    );
  }
}
