import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoState extends Equatable {
  const VideoState({this.isPlaying = false});
  final bool isPlaying;
  @override List<Object?> get props => [isPlaying];
}

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(String videoUrl, bool network, {bool autoPlay = false})
    : controller = network
          ? VideoPlayerController.networkUrl(Uri.parse(videoUrl))
          : VideoPlayerController.asset(videoUrl),
      super(VideoState(isPlaying: autoPlay)) {
    controller.initialize().then((_) { if (autoPlay) play(); });
  }

  final VideoPlayerController controller;
  void changeStatus(bool isPlaying) => emit(VideoState(isPlaying: isPlaying));
  Future<void> play() => controller.play();
  Future<void> pause() => controller.pause();
  @override Future<void> close() async { await controller.dispose(); return super.close(); }
}
