import 'package:flutter/material.dart';
import 'package:hotstar/presentation/widgets/movies/movie_info.dart';
import 'package:hotstar/presentation/widgets/series/more_like_card.dart';
import 'package:hotstar/presentation/widgets/series/poster_card.dart';
import 'package:hotstar/presentation/widgets/series/semi_info_text.dart';

class MoviePlay extends StatelessWidget {
  static const String movieContent = 'movie';

  const MoviePlay({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PosterCard(
                bgUri: '',
                currentState: 'Play',
              ),
              const SemiInfoWidget(
                year: '1997',
                smallInfo: '1h 28m',
                statusCode: 'PJ-12',
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
                child: const MovieInfoCard(
                  title: 'Hercules',
                  rating: 7.4,
                  summery:
                      'Hercules, son of Zeus, is turned a half-mortal by the evil Hades. After realizing his immortal heritage, he must to return to Mount Olympus',
                  categories: ['Animation,', 'Muscial,', 'Action,', 'Comedy'],
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
