import 'package:flutter/material.dart';
import 'package:hotstar/presentation/widgets/series/episode_card_tile.dart';
import 'package:hotstar/presentation/widgets/series/icon_update.dart';
import 'package:hotstar/utils/constant.dart';

class EpisodeCard extends StatelessWidget {
  final int seasonCount;
  final Size size;
  final List<String> categories;
  final double rating;
  const EpisodeCard({
    super.key,
    required this.seasonCount,
    required this.categories,
    required this.rating,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: (size.width >= 450)
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Season $seasonCount',
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 19,
                          color: Colors.grey.shade300,
                          letterSpacing: 0.9,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.grey.shade300,
                          // size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(
                      categories.length,
                      (index) => Text(
                        '${categories[index]} ',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.7,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.star_border_rounded,
                      color: Colors.amber,
                    ),
                    Text(
                      '$rating',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const EpisodeCardTile(
            episodeMin: 40,
            episodeName: 'The Mandlorin',
            episodeNumber: 1,
            episodeDetails: episodeDetails,
            episodeStatus: DownloadStatus.downloadCompleted,
          ),
          const EpisodeCardTile(
            episodeMin: 23,
            episodeName: 'The Child',
            episodeNumber: 2,
            episodeStatus: DownloadStatus.downloading,
            episodeDetails:
                'Having tracked down a valuable quarry, the Mandalorian is left stranded after a thieving band of scavengers strips his ship.',
          ),
          const EpisodeCardTile(
            episodeMin: 40,
            episodeName: 'The Sin',
            episodeNumber: 1,
            episodeDetails: episodeDetails,
            episodeStatus: DownloadStatus.notYet,
          ),
        ],
      ),
    );
  }
}
