import 'package:favtest/core/models/favorites.dart';
import 'package:favtest/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group('Widget Test Home page', () {
    testWidgets('ListView Show', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Scrolling Testing', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item Nro 0'), findsOneWidget);
      await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(find.text('Item Nro 0'), findsNothing);
    });

    testWidgets('Icons Buttons Testing', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.favorite), findsNothing);
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle(Duration(milliseconds: 100));
      expect(find.text('Add to Favorites'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsWidgets);
      await tester.tap(find.byIcon(Icons.favorite).first);
      await tester.pumpAndSettle(Duration(milliseconds: 100));
      expect(find.text('Removed to Favorites'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
  });
}
