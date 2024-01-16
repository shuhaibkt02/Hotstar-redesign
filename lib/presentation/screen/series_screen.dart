import 'package:flutter/material.dart';
import 'package:hotstar/presentation/widgets/series/episode_card.dart';
import 'package:hotstar/presentation/widgets/series/more_like_card.dart';
import 'package:hotstar/presentation/widgets/series/poster_card.dart';
import 'package:hotstar/presentation/widgets/series/semi_info_text.dart';
import 'package:hotstar/presentation/widgets/series/trailer_info.dart';
import 'package:hotstar/utils/constant.dart';

class SeriesPlay extends StatelessWidget {
    static const String seriesPlay = 'seriesPlay';

  const SeriesPlay({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PosterCard(
                bgUri: mandlorian,
                currentState: 'Resume',
              ),
              const SemiInfoWidget(
                year: '2019',
                smallInfo: 'Season 2',
                statusCode: 'PJ-13',
                substitle: true,
                resolution: '4K',
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(34),
                ),
                child: EpisodeCard(
                  size: size,
                  seasonCount: 3,
                  categories: const ['Space-western,', 'Action,', 'Adventure'],
                  rating: 8.9,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(34),
                ),
                child: const TrailerAndInfo(
                  director: ['Jon Favreau'],
                  music: 'Ludwig Goransson',
                  starring: [
                    'Pedro Pascal',
                    'Nick Nolte',
                    'Giancarlo Esposito',
                    'Omid Abtahi',
                    'Carl Weathers'
                  ],
                  production: ['Lucasfilm', 'Walt Disney Pictures'],
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
