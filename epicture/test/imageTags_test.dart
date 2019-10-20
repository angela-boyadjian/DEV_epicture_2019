import 'package:epicture/images/imageTags.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
   group('Image Tags', () {
    test('value should be empty', () {
      expect(ImageTagsState().tags, []);
    });
    test('value should be false', () {
      expect(ImageTagsState().one, false);
    });
    test('value should be false', () {
      expect(ImageTagsState().two, false);
    });
    test('value should be false', () {
      expect(ImageTagsState().three, false);
    });
  });
}