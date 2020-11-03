import 'package:favtest/core/models/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteItemTitle extends StatelessWidget {
  const FavoriteItemTitle(this.itemNro);

  final int itemNro;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNro % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNro',
          key: Key('favorites_text_$itemNro'),
        ),
        trailing: IconButton(
            key: Key('remove_icon_$itemNro'),
            icon: Icon(Icons.close),
            onPressed: () {
              Provider.of<Favorites>(context, listen: false).remove(itemNro);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Removed to Favorites'),
                  duration: Duration(milliseconds: 100),
                ),
              );
            }),
      ),
    );
  }
}
