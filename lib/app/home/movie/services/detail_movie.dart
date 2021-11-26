import 'dart:convert';

import 'package:bitix/app/home/movie/models/movie.dart';
import 'package:bitix/app/home/movie/models/movie_detail.dart';
import 'package:bitix/shared/end_point.dart';
import 'package:http/http.dart' as http;

Future<MovieDetailModel?> getDetailMovie(MovieModel? model,
    {int? idMovie, http.Client? client}) async {
  client ??= http.Client();

  String url =
      'https://api.themoviedb.org/3/movie/$idMovie?api_key=${EndPoint.api_key}&language=en-US';
  var response = await client.get(Uri.parse(url));

  if (response.statusCode != 200) {
    return null;
  }

  var data = json.decode(response.body) as Map<String, dynamic>;
  if (data.isEmpty) {
    return null;
  }

  /// get data genres
  var genres = (data as Map<String, dynamic>)['genres'] as List;

  /// format data original languages

  String? language;
  switch ((data as Map<String, dynamic>)['original_language'].toString()) {
    case 'ja':
      language = 'Japanese';
      break;
    case 'id':
      language = 'Indonesian';
      break;
    case 'ko':
      language = 'Korean';
      break;
    case 'en':
      language = 'English';
      break;
    default:
  }

  return MovieDetailModel(MovieModel.fromJson(data),
      language: language,
      genres: genres
          .map((e) => (e as Map<String, dynamic>)['name'].toString())
          .toList());
}
