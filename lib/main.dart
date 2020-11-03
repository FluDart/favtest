import 'package:favtest/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      routes: {
        HomePage.routName: (context) => HomePage(),
      },
      initialRoute: HomePage.routName,
    );
  }
}
