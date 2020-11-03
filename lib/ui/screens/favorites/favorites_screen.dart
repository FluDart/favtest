import 'package:favtest/core/models/favorites.dart';
import 'package:favtest/ui/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorites_page';
  const FavoritesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<Favorites>(
        builder: (context, value, child) => ListView.builder(
            itemCount: value.items.length,
            padding: const EdgeInsets.symmetric(vertical: 15),
            itemBuilder: (context, index) =>
                FavoriteItemTitle(value.items[index])),
      ),
    );
  }
}
