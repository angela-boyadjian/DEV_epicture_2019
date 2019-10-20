import 'package:epicture/home/homePage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
   group('HomePage', () {
    test('value should start at 0', () {
      expect(HomePageState().mPageCount, 0);
    });

    test('value should == 1', () {
      final home = HomePageState();
      home.increment();
      expect(home.mPageCount, 1);
    });
  });
}