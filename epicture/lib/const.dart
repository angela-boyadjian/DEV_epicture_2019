import 'package:oauth2/oauth2.dart' as oauth2;

class Constants{
  static const String Newest = 'Newest';
  static const String Popular = 'Popular';
  static const String Random = 'Random';
  static const String API_KEY = "85baeb45cb07a04";
  static const String API_SECRET = "396302b3925792076993294d0ea333155d4ca427";

  static const List<String> choices = <String>[
    Newest,
    Popular,
    Random
  ];
}