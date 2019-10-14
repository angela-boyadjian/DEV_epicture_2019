import 'package:oauth2/oauth2.dart' as oauth2;

class Constants{
  static const String Newest = 'Newest';
  static const String Popular = 'Popular';
  static const String Random = 'Random';
  static const String API_KEY = "bacdc8f1b09a51e";
  static const String API_SECRET = "a11d03bfd2f36e073726e6e0b96723e633244688";

  static const List<String> choices = <String>[
    Newest,
    Popular,
    Random
  ];
}