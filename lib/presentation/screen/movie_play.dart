import 'package:flutter/material.dart';
import 'package:hotstar/data/model/content/movie_model.dart';
import 'package:hotstar/data/sample/content_sample.dart';
import 'package:hotstar/presentation/widgets/movies/movie_info.dart';
import 'package:hotstar/presentation/widgets/series/more_like_card.dart';
import 'package:hotstar/presentation/widgets/series/poster_card.dart';
import 'package:hotstar/presentation/widgets/series/semi_info_text.dart';

class MoviePlay extends StatelessWidget {
  static const String movieContent = 'movie';

  final String movieName;

  const MoviePlay({super.key, required this.movieName});
  @override
  Widget build(BuildContext context) {
    MovieModel movieDetail =
        movieSampleList.firstWhere((element) => element.title == movieName);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PosterCard(
                bgUri: movieDetail.imageUrl,
                currentState: movieDetail.play,
              ),
              SemiInfoWidget(
                year: movieDetail.publishDate,
                smallInfo: '${movieDetail.length.toInt()}m',
                statusCode: '${movieDetail.pGRating}',
                substitle: true,
                resolution: 'HD',
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                height: 550,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(34),
                ),
                child: MovieInfoCard(
                  title: movieDetail.title,
                  rating: movieDetail.rating,
                  summery: movieDetail.description,
                  categories: movieDetail.genre,
                  director: ['Tony Bancroft', 'Barry Cook'],
                  music: 'Jerry Goldsmith',
                  starring: [
                    'Ming-Na Wen',
                    'Eddie Murphy',
                    'BD Wong',
                    'Miguel Ferrer'
                  ],
                  production: ['Walt Disney Pictures'],
                ),
              ),
              MoreLikeCard(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
