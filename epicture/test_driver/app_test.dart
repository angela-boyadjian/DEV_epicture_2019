import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('MainTabBar', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });
    test('check if HomePage is being displayed', () async {
      final SerializableFinder myHomePage = find.byValueKey('HomePage');

      await driver.waitFor(myHomePage);
    });
    test('check if MainTabBar is being displayed', () async {
      final SerializableFinder myMainTabBar = find.byValueKey('pageview');

      await driver.waitFor(myMainTabBar);
    });
  });
}