import 'package:favtest/ui/screens/favorites/favorites_screen.dart';
import 'package:favtest/ui/widgets/item_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Test'),
        centerTitle: false,
        actions: [
          FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, FavoritesPage.routeName);
            },
            icon: Icon(Icons.favorite_border),
            label: Text('Favorites'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, index) => ItemTitle(index),
      ),
    );
  }
}
