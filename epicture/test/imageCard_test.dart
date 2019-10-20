import 'package:epicture/images/imageCard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
   group('Image Card', () {
    test('String should be empty', () {
      expect(ImageCardState(null).renderUrl, "");
    });
    test('value should be false', () {
      expect(ImageCardState(null).isFav, false);
    });
    test('value should be false', () {
      expect(ImageCardState(null).isUp, false);
    });
  });
}