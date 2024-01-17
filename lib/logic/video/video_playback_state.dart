part of 'video_playback_bloc.dart';

sealed class VideoPlaybackState extends Equatable {
  const VideoPlaybackState();

  @override
  List<Object> get props => [];
}

final class InitialVideoState extends VideoPlaybackState {}

final class PlayingVideoState extends VideoPlaybackState {
  // update db
}

final class PausedVideoState extends VideoPlaybackState {}

final class StoppedVideoState extends VideoPlaybackState {}

final class ErroVideoState extends VideoPlaybackState {
  final String errorMessage;

  const ErroVideoState({required this.errorMessage});
}
