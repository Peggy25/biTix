import 'dart:convert';

import 'package:bitix/app/home/movie/models/credits.dart';
import 'package:bitix/shared/end_point.dart';
import 'package:http/http.dart' as http;

Future<List<CreditsModel>> getCredits(int movieID,
    {http.Client? client}) async {
  client ??= http.Client();

  String url =
      'https://api.themoviedb.org/3/movie/$movieID/credits?api_key=${EndPoint.api_key}&language=en-US';
  var response = await client.get(Uri.parse(url));

  if (response.statusCode != 200) {
    return [];
  }

  var data = json.decode(response.body) as Map<String, dynamic>;

  if (data.isEmpty) {
    return [];
  }

  var credits = data['cast'] as List;
  if (credits.isEmpty) {
    return [];
  }

  return credits
      .map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
      .toList();
}
