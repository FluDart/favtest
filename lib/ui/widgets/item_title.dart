import 'package:favtest/core/models/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemTitle extends StatelessWidget {
  const ItemTitle(this.itemNro);
  final int itemNro;

  @override
  Widget build(BuildContext context) {
    var favoritesList = Provider.of<Favorites>(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[itemNro % Colors.primaries.length],
      ),
      title: Text(
        'Item Nro $itemNro',
        key: Key('text_$itemNro'),
      ),
      trailing: IconButton(
          key: Key('icon_$itemNro'),
          icon: favoritesList.items.contains(itemNro)
              ? Icon(Icons.favorite, color: Colors.red)
              : Icon(Icons.favorite_border),
          onPressed: () {
            !favoritesList.items.contains(itemNro)
                ? favoritesList.add(itemNro)
                : favoritesList.remove(itemNro);

            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(favoritesList.items.contains(itemNro)
                    ? 'Add to Favorites'
                    : 'Removed to Favorites'),
                duration: Duration(milliseconds: 100),
              ),
            );
          }),
    );
  }
}
