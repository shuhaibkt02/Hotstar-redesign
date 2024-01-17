import 'dart:io';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotstar/data/model/content/play_model.dart';
import 'package:hotstar/presentation/widgets/series/custom_icon_button.dart';
import 'package:hotstar/presentation/widgets/series/custom_snack_bar.dart';

class PosterCard extends StatefulWidget {
  final String bgUri;
  final PlayModel currentState;
  const PosterCard({
    super.key,
    required this.bgUri,
    required this.currentState,
  });

  @override
  State<PosterCard> createState() => _PosterCardState();
}

class _PosterCardState extends State<PosterCard> {
  Uri videoUrl = Uri.parse(
      'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');

  late CustomVideoPlayerController _customVideoPlayerController;

  bool isPlaying = false;
  String title = 'play';

  @override
  void initState() {
    super.initState();
    intiVideo();
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  void intiVideo() {
    VideoPlayerController videoPlayerController;

    videoPlayerController = VideoPlayerController.networkUrl(
      videoUrl,
    )..initialize().then((value) {
        setState(() {});
      });
    _customVideoPlayerController = CustomVideoPlayerController(
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        seekDuration: Duration(seconds: 5),
        showSeekButtons: true,
        showPlayButton: true,
        alwaysShowThumbnailOnVideoPaused: true,
        showDurationPlayed: true,
        showDurationRemaining: true,
      ),
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          scale: 0.1,
          image: AssetImage(widget.bgUri),
        ),
      ),
      child: (isPlaying)
          ? SizedBox(
              height: 200,
              child: CustomVideoPlayer(
                  customVideoPlayerController: _customVideoPlayerController),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    CustomIconButton(
                      onpress: () {
                        context.pop();
                      },
                      icon: Icons.close,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: PlayButton(
                        stateIs: widget.currentState.isPlay ? 'Resume' : 'Play',
                        onpress: () {
                          if (Platform.isWindows) {
                            snackBarCall(
                                context: context, message: 'Not config');
                          } else {
                            setState(() {
                              isPlaying = true;
                            });
                          }
                        },
                      ),
                    ),
                    CustomIconButton(
                      onpress: () {
                        snackBarCall(
                            context: context, message: 'Add into wishlish');
                      },
                      icon: Icons.add,
                      opacity: 0.9,
                    ),
                    const Spacer(),
                    CustomIconButton(
                      onpress: () {
                        snackBarCall(context: context, message: 'more option');
                      },
                      icon: Icons.more_horiz,
                      opacity: 0.8,
                    ),
                  ],
                )
              ],
            ),
    );
  }
}

class PlayButton extends StatelessWidget {
  final String stateIs;
  final VoidCallback onpress;
  const PlayButton({
    super.key,
    required this.stateIs,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.play_arrow,
            color: Colors.black,
          ),
          const SizedBox(width: 5),
          Text(
            stateIs,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
