import 'package:flutter/material.dart';
import 'package:simcodeapp/page/main/page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.transparent),
        canvasColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: const MainPage(),
    );
  }
}
