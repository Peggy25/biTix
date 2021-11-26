import 'dart:convert';

import 'package:bitix/app/home/movie/models/movie.dart';
import 'package:bitix/shared/end_point.dart';
import 'package:http/http.dart' as http;

Future<List<MovieModel>> getUpcoming({http.Client? client}) async {
  client ??= http.Client();

  String url =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${EndPoint.api_key}&language=en-US&page=1';
  var responseMovie = await client.get(Uri.parse(url));
  if (responseMovie.statusCode != 200) {
    return [];
  }

  var data = json.decode(responseMovie.body) as Map<String, dynamic>;
  if (data.isEmpty) {
    return [];
  }

  var movieJson = data['results'] as List;
  if (movieJson.isEmpty) {
    return [];
  }

  return movieJson
      .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
      .toList();
}
