import 'package:oauth2/oauth2.dart' as oauth2;

class Constants{
  static const String Newest = 'Newest';
  static const String Popular = 'Popular';
  static const String Random = 'Random';
  static const String API_KEY = "bb825126f09591e";
  static const String API_SECRET = "308e781516a8f5b369dedd952a7fddec35b6e456";

  static const List<String> choices = <String>[
    Newest,
    Popular,
    Random
  ];
}