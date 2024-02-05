import 'package:objectbox/objectbox.dart';

@Entity()
class MovieEntityModel {
  @Id()
  int id = 0;

  String? movieId;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? backdropPath;
  String? title;
  double? voteAverage;
  String? releaseDate;

  MovieEntityModel(
      {this.id = 0,
      required this.movieId,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.backdropPath,
      required this.title,
      required this.voteAverage,
      required this.releaseDate});
}
