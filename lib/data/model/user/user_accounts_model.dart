enum UserMood { happy, sassy, angry, haha }

class UserAccountModel {
  final String userName;
  final String avatarImg;
  final UserMood mood;

  UserAccountModel({
    required this.userName,
    required this.avatarImg,
    required this.mood,
  });

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      UserAccountModel(
        userName: json['userName'],
        avatarImg: json['avatarImg'],
        mood: _parseUserMood(json['moos'] as String),
      );

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'avatarImg': avatarImg,
      'mood': _userMoodToString(mood),
    };
  }

  static UserMood _parseUserMood(String value) {
    switch (value) {
      case 'happy':
        return UserMood.happy;
      case 'sassy':
        return UserMood.sassy;
      case 'angry':
        return UserMood.angry;
      case 'haha':
        return UserMood.haha;
      default:
        throw ArgumentError('Invalid UserMood value: $value');
    }
  }

  static String _userMoodToString(UserMood userMood) {
    switch (userMood) {
      case UserMood.happy:
        return 'happy';
      case UserMood.sassy:
        return 'sassy';
      case UserMood.angry:
        return 'angry';
      case UserMood.haha:
        return 'haha';
    }
  }
}
