import 'package:epicture/mainTabBar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
   group('Main Bar', () {
    test('value should start at 0', () {
      expect(MainTabBarState().testVar, 0);
    });
  });
}