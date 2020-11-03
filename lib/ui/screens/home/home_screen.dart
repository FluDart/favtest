import 'package:favtest/ui/widgets/item_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static String routName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: ListView.builder(
        itemCount: 100,
        padding: EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => ItemTitle(index),
      ),
    );
  }
}
