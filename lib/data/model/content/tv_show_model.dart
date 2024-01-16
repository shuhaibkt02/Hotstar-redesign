import 'package:hotstar/data/model/content/content_model.dart';
import 'package:hotstar/data/model/content/episode_model.dart';

class TvShowModel {
  final String showName;
  final int seasonCount;
  final String releaseDate;
  final double rating;
  final String pgRating;
  final ContentCategoryType categoryType;
  final List<EpisodeModel> episodes;

  TvShowModel({
    required this.showName,
    required this.seasonCount,
    required this.releaseDate,
    required this.rating,
    required this.pgRating,
    required this.categoryType,
    required this.episodes,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      showName: json['showName'] ?? '',
      seasonCount: json['seasonCount'] ?? 1,
      releaseDate: json['releaseDate'] ?? '',
      rating: json['rating'] ?? 0.0,
      pgRating: json['pgRating'] ?? 'PG-13',
      categoryType: ContentCategoryType.values.firstWhere((element) =>
          element.toString() == 'ContentCategoryType.${json['categoryType']}'),
      episodes: (json['episodes'] as List<dynamic>)
          .map((episode) => EpisodeModel.fromJson(episode))
          .toList(),
    );
  }
}
