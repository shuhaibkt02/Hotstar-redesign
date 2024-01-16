import 'package:flutter/material.dart';
import 'package:hotstar/data/model/content/content_model.dart';
import 'package:hotstar/utils/constant.dart';

class TitleAndListView extends StatelessWidget {
  final String title;
  final bool isWatched;
  final VoidCallback? playMando;
  final ContentCategoryType contentType;
  const TitleAndListView({
    super.key,
    required this.title,
    required this.isWatched,
    required this.contentType,
    this.playMando,
  });

  @override
  Widget build(BuildContext context) {
    final contentList = getContentList(contentType: contentType);
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
          SizedBox(
            height: 130,
            child: ListView.builder(
              itemCount: contentList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                double progress = 0.1 * index;
                bool isMando = contentList[index].contains('mandalorian.jpg');
                return InkWell(
                  onTap: (isMando) ? playMando : () {},
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 90,
                    decoration: BoxDecoration(
                        color:
                            Colors.accents[(isWatched) ? index + 1 : index + 4],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(contentList[index]))),
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4),
                        child: isWatched
                            ? LinearProgressIndicator(
                                color: Colors.white,
                                backgroundColor: Colors.grey.shade400,
                                value: progress,
                                borderRadius: BorderRadius.circular(8),
                              )
                            : const SizedBox()),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
