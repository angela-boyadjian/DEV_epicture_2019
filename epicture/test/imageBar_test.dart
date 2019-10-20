import 'package:epicture/images/imageBar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
   group('Image Bar', () {
    test('value should be false', () {
      expect(ImageBarState().isFav, false);
    });
    test('value should be false', () {
      expect(ImageBarState().isDown, false);
    });
    test('value should be false', () {
      expect(ImageBarState().isUp, false);
    });
    test('value should be false', () {
      expect(ImageBarState().hasDownVoted, false);
    });
    test('value should be false', () {
      expect(ImageBarState().hasUpVoted, false);
    });
  });
}