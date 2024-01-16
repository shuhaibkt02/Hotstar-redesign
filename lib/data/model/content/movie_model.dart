import 'package:hotstar/data/model/content/content_model.dart';
import 'package:hotstar/data/model/content/play_model.dart';

class MovieModel extends ContentModel {
  final List<String> genre;
  final String? pGRating;
  final double rating;

  const MovieModel(
    this.pGRating, {
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.videoUrl,
    required super.publishDate,
    required super.category,
    required super.length,
    required super.play,
    required this.genre,
    required this.rating,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      json['PG'],
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      publishDate: json['publishDate'] ?? '',
      category: ContentCategoryType.values.firstWhere((element) =>
          element.toString() == 'ContentCategoryType.${json['category']}'),
      length: json['length'],
      play: PlayModel.fromJson(json['play']),
      genre: List<String>.from(json['genre']),
      rating: json['rating'] ?? '',
    );
  }
}
