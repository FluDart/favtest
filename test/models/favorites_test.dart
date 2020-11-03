import 'package:favtest/core/models/favorites.dart';
import 'package:test/test.dart';

void main() {
  group('Provider Test', () {
    var favorites = Favorites();

    test('New item added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test('Item removed', () {
      var number = 45;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
