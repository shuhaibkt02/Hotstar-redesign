class PlayModel {
  final bool isPlay;
  final double lastPlayedPostition;

  const PlayModel({
    required this.isPlay,
    required this.lastPlayedPostition,
  });

  factory PlayModel.fromJson(Map<String, dynamic> json) {
    return PlayModel(
      isPlay: json['isPlay'] ?? false,
      lastPlayedPostition: json['lastPlayedPosition'] ?? 0.0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'isPlay': isPlay,
      'lastPlayedPosition': lastPlayedPostition,
    };
  }
}
