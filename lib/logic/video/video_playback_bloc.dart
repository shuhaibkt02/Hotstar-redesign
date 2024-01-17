import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'video_playback_event.dart';
part 'video_playback_state.dart';

class VideoPlaybackBloc extends Bloc<VideoPlaybackEvent, VideoPlaybackState> {
  VideoPlaybackBloc() : super(InitialVideoState()) {
    on<VideoPlaybackEvent>((event, emit) {
    });
  }
}
