import 'package:equatable/equatable.dart';

import 'package:bitix/app/home/movie/models/movie.dart';

class MovieDetailModel extends Equatable {
  final List<String>? genres;
  final String? language;
  const MovieDetailModel(
    MovieModel? movie, {
    this.genres,
    this.language,
  });

  // combine genre and language

  String get genresAndLanguage {
    String s = '';

    for (var genre in genres!) {
      s += genre + (genre != genres!.last ? ', ' : '');
    }
    return '$s - $language';
  }

  @override
  List<Object> get props => [genres!, language!];
}
