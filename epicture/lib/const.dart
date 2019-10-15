import 'package:oauth2/oauth2.dart' as oauth2;

class Constants{
  static const String Newest = 'Newest';
  static const String Popular = 'Popular';
  static const String Random = 'Random';
  static const String API_KEY = "bb825126f09591e";
  static const String API_SECRET = "cb57b25c0d24ff22096bc4eceebcec6022a4d82a";

  static const List<String> choices = <String>[
    Newest,
    Popular,
    Random
  ];
}