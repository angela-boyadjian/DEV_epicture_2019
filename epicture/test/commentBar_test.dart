import 'package:epicture/comments/commentBar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
   group('Comment Bar', () {
    test('value should be false', () {
      expect(CommentBarState().isFav, false);
    });
    test('value should be false', () {
      expect(CommentBarState().isDown, false);
    });
    test('value should be false', () {
      expect(CommentBarState().hasUpVoted, false);
    });
    test('value should be false', () {
      expect(CommentBarState().hasDownVoted, false);
    });
  });
}