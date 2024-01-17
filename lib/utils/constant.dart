import 'package:flutter/material.dart';
import 'package:hotstar/data/model/content/content_model.dart';
import 'package:hotstar/data/model/user/user_accounts_model.dart';

const mandlorian = 'assets/images/mandlorian.jpg';
const disneyLogo = 'assets/images/616.png';
const episodeDetails =
    'In the lawless aftermath of the collapse of the Galactic Empire, an armored bounty hunter takes on a well-paying yet cryptic assignment .';

TextStyle headLineSmall = TextStyle(
  fontFamily: 'SFProDisplay',
  fontWeight: FontWeight.bold,
  color: Colors.grey.shade300,
  fontSize: 19,
  letterSpacing: 0.9,
);

TextStyle titleLarge = TextStyle(
  fontSize: 30,
  color: Colors.grey.shade300,
  fontWeight: FontWeight.w600,
  fontFamily: 'SFPro',
);

TextStyle titleMedium = TextStyle(
  fontSize: 25,
  color: Colors.grey.shade300,
  fontWeight: FontWeight.w600,
  fontFamily: 'SFProDisplay',
);
TextStyle titleSmall = TextStyle(
  fontSize: 20,
  color: Colors.grey.shade600,
  fontWeight: FontWeight.w600,
  fontFamily: 'SFProDisplay',
);

TextStyle bodyLarge = TextStyle(
  fontSize: 18,
  color: Colors.grey.shade300,
  fontWeight: FontWeight.w600,
  fontFamily: 'SFPro',
);
TextStyle bodyMedium = TextStyle(
  fontSize: 14,
  color: Colors.grey.shade400,
  fontWeight: FontWeight.w400,
  fontFamily: 'SFPro',
);
TextStyle bodySmall = TextStyle(
  fontSize: 11.5,
  color: Colors.grey.shade600,
  fontWeight: FontWeight.w400,
  fontFamily: 'SFPro',
);

Map<UserMood, List<String>> moodImageMap = {
  UserMood.happy: [
    'assets/avatar/buzz.jpeg',
    'assets/avatar/woody.jpeg',
    'assets/avatar/robin_kid.jpeg',
  ],
  UserMood.angry: [
    'assets/avatar/jessie.jpeg',
    'assets/avatar/snow_white.jpeg',
    'assets/avatar/ariel.jpeg',
  ],
  UserMood.sassy: [
    'assets/avatar/sad_donkey.jpeg',
    'assets/avatar/tiger.jpeg',
    'assets/avatar/winnie_bear.jpeg',
  ],
  UserMood.haha: [
    'assets/avatar/moana.jpeg',
    'assets/avatar/jasmine.jpeg',
    'assets/avatar/mulan.jpeg',
  ],
};

List<String> getList(UserMood mood) {
  return moodImageMap[mood] ?? [];
}

Map<ContentCategoryType, List<String>> contentPoster = {
  ContentCategoryType.movie: [
    'assets/images/12th_fail.jpg',
    'assets/images/hercules.jpg',
    'assets/images/kannur_squad.jpg',
    'assets/images/wall-e.jpg',
  ],
  ContentCategoryType.tvShow: [
    'assets/images/mandalorian.jpg',
    'assets/images/what_if.jpg',
    'assets/images/iam_groot.jpg',
  ],
};

List<String> getContentList({required ContentCategoryType contentType}) {
  return contentPoster[contentType] ?? [];
}
