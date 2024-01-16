import 'package:hotstar/data/model/content/play_model.dart';

enum ContentCategoryType { movie, tvShow, episode }

abstract class ContentModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String videoUrl;
  final DateTime publishDate;
  final ContentCategoryType category;
  final Duration length;
  final PlayModel play;

  const ContentModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.videoUrl,
    required this.publishDate,
    required this.category,
    required this.length,
    required this.play,
  });
}
