import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  const MovieModel({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
  });
  final int? id;
  final String? title;
  final double? voteAverage;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;

  factory MovieModel.fromJson(Map<String?, dynamic> json) => MovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      backdropPath: json['backdrop_path'] as String);
  @override
  List<Object?> get props =>
      [id, title, voteAverage, overview, posterPath, backdropPath];
}
