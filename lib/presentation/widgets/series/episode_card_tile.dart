import 'package:flutter/material.dart';
import 'package:hotstar/presentation/widgets/series/custom_icon_button.dart';
import 'package:hotstar/presentation/widgets/series/icon_update.dart';
import 'package:hotstar/utils/constant.dart';

class EpisodeCardTile extends StatefulWidget {
  final int episodeNumber;
  final int episodeMin;
  final String episodeName;
  final String episodeDetails;
  final DownloadStatus episodeStatus;

  const EpisodeCardTile({
    super.key,
    required this.episodeNumber,
    required this.episodeMin,
    required this.episodeName,
    required this.episodeDetails,
    required this.episodeStatus,
  });

  @override
  State<EpisodeCardTile> createState() => _EpisodeCardTileState();
}

class _EpisodeCardTileState extends State<EpisodeCardTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      // color: Colors.red,
      height: isExpanded ? 189 : 129,
      child: isExpanded
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (size.width >= 400)
                            ? size.width / 4
                            : size.width / 3.0,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(mandlorian),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: CustomIconButton(
                            onpress: () {},
                            icon: Icons.play_arrow,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: TitlePart(
                          episodeMin: widget.episodeMin,
                          episodeName: widget.episodeName,
                          episodeNumber: widget.episodeNumber,
                          episodeStatus: widget.episodeStatus,
                          onpress: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.episodeDetails,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF-Pro',
                      fontSize: 13.5,
                    ),
                  ),
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width:
                      (size.width >= 400) ? size.width / 4 : size.width / 3.0,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: AssetImage(mandlorian),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: CustomIconButton(
                      onpress: () {},
                      icon: Icons.play_arrow,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: 2,
                  child: TitlePart(
                    episodeMin: widget.episodeMin,
                    episodeName: widget.episodeName,
                    episodeNumber: widget.episodeNumber,
                    episodeStatus: widget.episodeStatus,
                    onpress: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class TitlePart extends StatelessWidget {
  final int episodeNumber;
  final int episodeMin;
  final String episodeName;
  final VoidCallback onpress;
  final DownloadStatus episodeStatus;

  const TitlePart({
    super.key,
    required this.onpress,
    required this.episodeNumber,
    required this.episodeMin,
    required this.episodeName,
    required this.episodeStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Episode $episodeNumber · ${episodeMin}m',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                  fontSize: 11.9,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    child: Text(
                      episodeName,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      onPressed: onpress,
                      icon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  )
                ],
              ),
            ],
          ),
          CustomIconButton(
            onpress: () {},
            noPadding: true,
            radius: 20,
            iconSize: 16,
            alignment: Alignment.topLeft,
            icon: iconUpdate(episodeStatus),
          )
        ],
      ),
    );
  }
}
