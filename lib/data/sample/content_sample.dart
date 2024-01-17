import 'package:hotstar/data/model/content/content_model.dart';
import 'package:hotstar/data/model/content/episode_model.dart';
import 'package:hotstar/data/model/content/movie_model.dart';
import 'package:hotstar/data/model/content/play_model.dart';
import 'package:hotstar/data/model/content/tv_show_model.dart';

List<MovieModel> movieSampleList = [
  const MovieModel(
    'PG',
    id: '01',
    title: '12th fail',
    description:
        'IPS officer Manoj Kumar Sharma fearlessly embraces the idea of restarting his academic journey and reclaiming his destiny at a place where millions of students attempt the world\'s toughest competitive exam',
    imageUrl: 'assets/images/12th_fail.jpg',
    videoUrl: '',
    publishDate: '27 October 2023',
    category: ContentCategoryType.movie,
    length: 146,
    play: PlayModel(isPlay: true, lastPlayedPostition: 10.0),
    genre: ['biographical', 'Drama'],
    rating: 9.2,
  ),
  const MovieModel(
    'PG-13',
    id: '02',
    title: 'Kannur Squad',
    description:
        'A police officer and his team face a challenging journey across the country to catch a criminal gang. He leads them toward triumph amid professional uncertainties.',
    imageUrl: 'assets/images/kannur_squad.jpg',
    videoUrl: '',
    publishDate: '28 September 2023',
    category: ContentCategoryType.movie,
    length: 147,
    play: PlayModel(isPlay: true, lastPlayedPostition: 80.0),
    genre: ['Thriller', 'Drama', 'Crime Fiction'],
    rating: 7.7,
  ),
  const MovieModel(
    'PG',
    id: '03',
    title: 'WALL-E',
    description:
        'A robot who is responsible for cleaning a waste-covered Earth meets another robot and falls in love with her. Together, they set out on a journey that will alter the fate of mankind.',
    imageUrl: 'assets/images/wall-e.jpg',
    videoUrl: '',
    publishDate: '27 June 2008',
    category: ContentCategoryType.movie,
    length: 98,
    play: PlayModel(isPlay: false, lastPlayedPostition: 0.0),
    genre: ['Animation', 'Comedy', 'Drama', 'Childern\'s film', 'Action'],
    rating: 8.4,
  ),
  const MovieModel(
    'PG',
    id: '04',
    title: 'Hercules',
    description:
        'Hercules, son of the Greek god, Zeus, is turned into a half-god, half-mortal by the evil Hades.',
    imageUrl: 'assets/images/hercules.jpg',
    videoUrl: '',
    publishDate: '28 September 2023',
    category: ContentCategoryType.movie,
    length: 90,
    play: PlayModel(isPlay: false, lastPlayedPostition: 0.0),
    genre: ['Animation', 'Comedy', 'Music', 'Childern\'s film', 'Action'],
    rating: 7.3,
  ),
];

List<TvShowModel> sampleTvShowList = [
  TvShowModel(
    showName: 'The Mandalorian',
    seasonCount: 3,
    releaseDate: '2019',
    rating: 8.7,
    pgRating: 'PG-13',
    categoryType: ContentCategoryType.tvShow,
    episodes: [
      EpisodeModel(
        id: 'S01-E01',
        title: 'The Mandalorian',
        description:
            'In the lawless aftermath of the collapse of the Galactic Empire,',
        imageUrl: '',
        videoUrl: '',
        publishDate: '12 Nov 2019',
        category: ContentCategoryType.episode,
        length: 25,
        play: const PlayModel(isPlay: false, lastPlayedPostition: 0.0),
      )
    ],
    posterImg: 'assets/images/mandalorian.jpg',
    genre: ['Action', 'Adventure', 'Space Western', 'Drama'],
  ),
  TvShowModel(
    showName: 'What If...?',
    seasonCount: 2,
    releaseDate: '2021',
    rating: 7.4,
    pgRating: 'PG-13',
    categoryType: ContentCategoryType.tvShow,
    episodes: [],
    posterImg: 'assets/images/what_if.jpg',
    genre: ['Animation', 'Action', 'Superhero', 'Drama'],
  ),
  TvShowModel(
    showName: 'I Am Groot',
    seasonCount: 2,
    releaseDate: '2022',
    rating: 6.7,
    pgRating: 'PG',
    categoryType: ContentCategoryType.tvShow,
    episodes: [],
    posterImg: 'assets/images/iam_groot.jpg',
    genre: ['Animation', 'Short', 'Action', 'Comedy'],
  ),
];

Future<List> getContentList({required ContentCategoryType contentType}) async {
  await Future.delayed(const Duration(microseconds: 780));
  return (contentType == ContentCategoryType.movie)
      ? movieSampleList
      : sampleTvShowList;
}
