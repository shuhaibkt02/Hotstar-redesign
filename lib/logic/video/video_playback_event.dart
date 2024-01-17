part of 'video_playback_bloc.dart';

sealed class VideoPlaybackEvent extends Equatable {
  const VideoPlaybackEvent();

  @override
  List<Object> get props => [];
}

final class PlayVideoEvent extends VideoPlaybackEvent {}

final class PauseVideoEvent extends VideoPlaybackEvent {}

final class StopVideoEvent extends VideoPlaybackEvent {}
