// import 'dart:convert';

// import 'package:bitix/app/home/movie/models/credits.dart';
// import 'package:bitix/app/home/movie/models/movie.dart';
// import 'package:bitix/app/home/movie/models/movie_detail.dart';
// import 'package:bitix/shared/end_point.dart';
// import 'package:http/http.dart' as http;

// /// movie services
// ///

// class MovieRequestFailure implements Exception {}

// class MovieNotFoundFailure implements Exception {}

// class CreditsNotFoundFailure implements Exception {}

// class CredtisRequestFailure implements Exception {}

// class MovieServices {
//   static Future<List<MovieModel>> getNowPlaying({http.Client? client}) async {
//     client ??= http.Client();
//     String url =
//         'https://api.themoviedb.org/3/movie/now_playing?api_key=${EndPoint.api_key}&language=en-US&page=1';
//     var responseMovie = await client.get(Uri.parse(url));

//     if (responseMovie.statusCode != 200) {
//       throw MovieRequestFailure();
//     }

//     var data = json.decode(responseMovie.body) as Map<String, dynamic>;

//     if (data.isEmpty) {
//       throw MovieNotFoundFailure();
//     }

//     var movieJson = data['results'] as List;
//     if (movieJson.isEmpty) {
//       throw MovieNotFoundFailure();
//     }

//     return movieJson
//         .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }

//   static Future<List<MovieModel>> getUpcoming({http.Client? client}) async {
//     client ??= http.Client();

//     String url =
//         'https://api.themoviedb.org/3/movie/upcoming?api_key=${EndPoint.api_key}&language=en-US&page=1';
//     var responseMovie = await client.get(Uri.parse(url));
//     if (responseMovie.statusCode != 200) {
//       throw MovieRequestFailure();
//     }

//     var data = json.decode(responseMovie.body) as Map<String, dynamic>;
//     if (data.isEmpty) {
//       throw MovieNotFoundFailure();
//     }

//     var movieJson = data['results'] as List;
//     if (movieJson.isEmpty) {
//       throw MovieNotFoundFailure();
//     }

//     return movieJson
//         .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }

//   static Future<MovieDetailModel> getDetailMovie(MovieModel? model,
//       {int? idMovie, http.Client? client}) async {
//     client ??= http.Client();

//     String url =
//         'https://api.themoviedb.org/3/movie/$idMovie?api_key=${EndPoint.api_key}&language=en-US';
//     var response = await client.get(Uri.parse(url));

//     if (response.statusCode != 200) {
//       throw MovieRequestFailure();
//     }

//     var data = json.decode(response.body) as Map<String, dynamic>;
//     if (data.isEmpty) {
//       throw MovieNotFoundFailure();
//     }

//     /// get data genres
//     var genres = (data as Map<String, dynamic>)['genres'] as List;

//     /// format data original languages

//     String? language;
//     switch ((data as Map<String, dynamic>)['original_language'].toString()) {
//       case 'ja':
//         language = 'Japanese';
//         break;
//       case 'id':
//         language = 'Indonesian';
//         break;
//       case 'ko':
//         language = 'Korean';
//         break;
//       case 'en':
//         language = 'English';
//         break;
//       default:
//     }

//     return MovieDetailModel(MovieModel.fromJson(data),
//         language: language,
//         genres: genres
//             .map((e) => (e as Map<String, dynamic>)['name'].toString())
//             .toList());
//   }

//   static Future<List<CreditsModel>> getCredits(int movieID,
//       {http.Client? client}) async {
//     client ??= http.Client();

//     String url =
//         'https://api.themoviedb.org/3/movie/$movieID/credits?api_key=${EndPoint.api_key}&language=en-US';
//     var response = await client.get(Uri.parse(url));

//     if (response.statusCode != 200) {
//       throw CredtisRequestFailure();
//     }

//     var data = json.decode(response.body) as Map<String, dynamic>;

//     if (data.isEmpty) {
//       throw CreditsNotFoundFailure();
//     }

//     var credits = data['cast'] as List;
//     if (credits.isEmpty) {
//       throw CreditsNotFoundFailure();
//     }

//     return credits
//         .map((e) => CreditsModel.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }
// }
