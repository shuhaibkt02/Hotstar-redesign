import 'package:hotstar/data/model/content/content_model.dart';
import 'package:hotstar/data/model/content/play_model.dart';

class EpisodeModel extends ContentModel {
  EpisodeModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.videoUrl,
    required super.publishDate,
    required super.category,
    required super.length,
    required super.play,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      publishDate: json['publishDate'] ?? DateTime.now(),
      category: ContentCategoryType.values.firstWhere((element) =>
          element.toString() == 'ContentCategoryType.${json['categoryType']}'),
      length: json['length'] ?? const Duration(minutes: 0),
      play: PlayModel.fromJson(json['play']),
    );
  }
}
