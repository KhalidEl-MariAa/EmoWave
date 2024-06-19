// ignore_for_file: must_be_immutable

part of 'send_video_cubit.dart';

@immutable
sealed class SendVideoState {}

final class SendVideoInitial extends SendVideoState {}

final class SendVideoLoading extends SendVideoState {}

final class SendVideoFailure extends SendVideoState {
  String errorMsg;
  SendVideoFailure({required this.errorMsg});
}

final class SendVideoSucess extends SendVideoState {
  List<RecommendedMovie> recommendedMovies;
  List<SongModel> recommendedSongs;
  SendVideoSucess({required this.recommendedMovies,required this.recommendedSongs});
}
