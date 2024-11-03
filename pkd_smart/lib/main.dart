import 'package:flutter/material.dart';
import 'package:pkd_smart/page/ScanCodePage.dart';
import 'package:pkd_smart/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PKD SMART',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        )
      ),
      home:  HomePage(),
      routes: {
        "/generate": (context) => const Scancodepage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


