import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotstar/data/model/content/content_model.dart';
import 'package:hotstar/data/model/content/movie_model.dart';
import 'package:hotstar/data/model/content/tv_show_model.dart';
import 'package:hotstar/data/sample/content_sample.dart';
import 'package:hotstar/presentation/screen/movie_screen.dart';
import 'package:hotstar/presentation/screen/series_screen.dart';

class TitleAndListView extends StatelessWidget {
  final String title;
  final ContentCategoryType contentType;
  const TitleAndListView({
    super.key,
    required this.title,
    required this.contentType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          FutureBuilder<List>(
              future: getContentList(contentType: contentType),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<dynamic> contentList = snapshot.data!;
                  return SizedBox(
                    height: 130,
                    child: ListView.builder(
                      itemCount: contentList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String posterImg = '';
                        String contentName = '';
                        bool isPlayed = false;
                        double lastPlayedMin = 0.0;
                        if (contentType == ContentCategoryType.movie) {
                          MovieModel singleContent = contentList[index];
                          posterImg = singleContent.imageUrl;
                          contentName = singleContent.title;
                          isPlayed = singleContent.play.isPlay;

                          double totalLength = singleContent.length;
                          double watchedLength =
                              singleContent.play.lastPlayedPostition;

                          lastPlayedMin = watchedLength / totalLength;

                          lastPlayedMin = lastPlayedMin.clamp(0.0, 1.0);
                        }
                        if (contentType == ContentCategoryType.tvShow) {
                          TvShowModel singleContent = contentList[index];
                          posterImg = singleContent.posterImg;
                          contentName = singleContent.showName;
                        }

                        return ContentCard(
                          posterLabel: contentName,
                          posterimg: posterImg,
                          isPlay: isPlayed,
                          lastMin: lastPlayedMin,
                          contentType: contentType,
                        );
                      },
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey.shade400,
                  ),
                );
              })
        ],
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final String posterLabel;
  final String posterimg;
  final ContentCategoryType contentType;
  final bool isPlay;
  final double? lastMin;
  const ContentCard({
    super.key,
    required this.posterimg,
    required this.isPlay,
    this.lastMin,
    required this.posterLabel,
    required this.contentType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (contentType == ContentCategoryType.movie) {
          GoRouter.of(context).pushNamed(MoviePlay.movieContent,
              extra: {'movieName': posterLabel});
        }
        if (contentType == ContentCategoryType.tvShow) {
          GoRouter.of(context)
              .pushNamed(SeriesPlay.seriesPlay, extra: {'tvName': posterLabel});
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(posterimg),
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: isPlay
            ? Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 18),
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.grey.shade400,
                      value: lastMin ?? 0.0,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
