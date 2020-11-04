import 'package:favtest/core/models/favorites.dart';
import 'package:favtest/ui/screens/favorites/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Favorites favoritesList;

Widget createFavoritePage() => ChangeNotifierProvider<Favorites>(
      create: (context) {
        favoritesList = Favorites();
        return favoritesList;
      },
      child: MaterialApp(
        home: FavoritesPage(),
      ),
    );

void addItems() {
  for (var i = 0; i < 30; i += 2) {
    favoritesList.add(i);
  }
}

void main() {
  group('Favorite Page Test', () {
    testWidgets('ListViewShow', (tester) async {
      await tester.pumpWidget(createFavoritePage());
      addItems();
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      await tester.fling(find.byType(ListView), Offset(0, -200), 2500);
      await tester.pumpAndSettle();
      await tester.fling(find.byType(ListView), Offset(0, 200), 80);
      await tester.pumpAndSettle();
    });

    testWidgets('Remove Favorite Item', (tester) async {
      await tester.pumpWidget(createFavoritePage());
      addItems();
      await tester.pumpAndSettle();
      var totalItems = tester.widgetList(find.byIcon(Icons.close)).length;
      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle();
      expect(find.text('Removed to Favorites'), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      await tester.fling(find.byType(ListView), Offset(0, -200), 2500);
      await tester.pumpAndSettle();
      await tester.fling(find.byType(ListView), Offset(0, 200), 80);
      await tester.pumpAndSettle();
    });
  });
}
