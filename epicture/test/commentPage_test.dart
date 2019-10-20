import 'package:epicture/comments/commentPage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
   group('Comment Page', () {
    test('value should be empty', () {
      expect(CommentPageState().comments, []);
    });
  });
}