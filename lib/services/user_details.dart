import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prichay/models/facebookAPI.dart';

import '../globals.dart';


Future<FacebookApiResponse> getUserDetailsFacebook(String token) async {
  http.Response response = await http.get(
    urlFacebook + token,
  );

  print(json.decode(response.body));
  if (response.statusCode == 200) {
    var facebookApiResponse = FacebookApiResponse.fromJson(json.decode(response.body));
    return facebookApiResponse;
  }
  else{
    throw Exception("No response");
  }
}
