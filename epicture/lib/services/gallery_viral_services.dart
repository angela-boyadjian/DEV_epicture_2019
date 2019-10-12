import 'dart:async';
import 'dart:convert';
import 'dart:io';

//import 'package:epicture/models/viral_model.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;


const String apiKey = "57a944f493177cd";
const String secret = "6c6de2bdb21487b6b1e5c0a37320ec12e6090db3";

//Future<Viral> getPost() async {
//  final response =
//      await http.get(
//        'https://api.imgur.com/3/gallery/hot/viral/0.json',
//        headers: {
//          HttpHeaders.authorizationHeader:"Client-ID " + apiKey
//        },
//      );
//  if (response.statusCode == 200) {
//    return Viral.fromJson(json.decode(response.body));
//  } else {
//    throw Exception('Failed to load Get');
//  }
//}

final authorizationEndpoint = Uri.parse("https://imgur.com/oauth2/authorization");
final tokenEndpoint = Uri.parse("https://imgur.com/oauth2/token");
final redirectUrl = Uri.parse("https://imgur.com/oauth2-redirect");
final credentialsFile = new File("./ccredentialsFile");

Future<oauth2.AuthorizationCodeGrant> getClient() async {
  var exists = await credentialsFile.exists();

  if (exists) {
    var credentials = new oauth2.Credentials.fromJson(
        await credentialsFile.readAsString());
//    return credentials;
//      new oauth2.Client(credentials,
//        identifier: apiKey, secret: secret);
  }
  var grant = new oauth2.AuthorizationCodeGrant(
      apiKey, authorizationEndpoint, tokenEndpoint,
      secret: secret);

//  await redirect(grant.getAuthorizationUrl(redirectUrl));
//
//  var request = await listen(redirectUrl);
//
//  return await grant.handleAuthorizationResponse(request.uri.queryParameters);
  return grant;
}