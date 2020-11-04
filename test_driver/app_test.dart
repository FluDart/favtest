import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Test App Performance', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('Scrolling Test', () async {
      final listFinder = find.byType('ListView');

      final scrollingTimeline = await driver.traceAction(() async {
        await driver.scroll(listFinder, 0, -500, Duration(milliseconds: 2500));
        await driver.scroll(listFinder, 0, 500, Duration(milliseconds: 2500));
      });

      final scrollSummary = TimelineSummary.summarize(scrollingTimeline);
      await scrollSummary.writeSummaryToFile('scrolling', pretty: true);
      await scrollSummary.writeTimelineToFile('scrolling', pretty: true);
    });

    test('Favorites operations test', () async {
      final operationsTimeline = await driver.traceAction(() async {
        final iconKeys = [
          'icon_0',
          'icon_1',
          'icon_2',
          'icon_5',
          'icon_8',
          'icon_10',
        ];

        for (var icon in iconKeys) {
          await driver.tap(find.byValueKey(icon));
          await driver.waitFor(find.text('Add to Favorites'));
        }
      });

      final operationsSummary = TimelineSummary.summarize(operationsTimeline);
      await operationsSummary.writeSummaryToFile('favorites_operation',
          pretty: true);
      await operationsSummary.writeTimelineToFile('favorites_operation',
          pretty: true);
    });

    test('Scrolling Test', () async {
      final listFinder = find.byType('ListView');

      final scrollingTimeline = await driver.traceAction(() async {
        await driver.scroll(listFinder, 0, -1000, Duration(milliseconds: 2500));
        await driver.scroll(listFinder, 0, 500, Duration(milliseconds: 2500));
      });

      final scrollSummary = TimelineSummary.summarize(scrollingTimeline);
      await scrollSummary.writeSummaryToFile('scrolling', pretty: true);
      await scrollSummary.writeTimelineToFile('scrolling', pretty: true);
    });

    test('Favorites operations test', () async {
      final operationsTimeline = await driver.traceAction(() async {
        final iconKeys = [
          'icon_21',
          'icon_32',
          'icon_50',
          'icon_71',
        ];

        for (var icon in iconKeys) {
          await driver.tap(find.byValueKey(icon));
          await driver.waitFor(find.text('Add to Favorites'));
        }
      });

      final operationsSummary = TimelineSummary.summarize(operationsTimeline);
      await operationsSummary.writeSummaryToFile('favorites_operation',
          pretty: true);
      await operationsSummary.writeTimelineToFile('favorites_operation',
          pretty: true);
    });
  });
}
