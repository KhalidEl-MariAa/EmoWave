// ignore_for_file: must_be_immutable

part of 'send_image_and_record_cubit.dart';

@immutable
sealed class SendImageAndRecordState {}

final class SendImageAndRecordInitial extends SendImageAndRecordState {}

final class SendImageAndRecordLoading extends SendImageAndRecordState {}

final class SendImageAndRecordSucess extends SendImageAndRecordState {
  List<RecommendedMovie> recommendedMovies;
  List<SongModel> recommendedSongs;
  SendImageAndRecordSucess({required this.recommendedMovies,required this.recommendedSongs});
}

final class SendImageAndRecordFailure extends SendImageAndRecordState {
  
  String erroemsg;
  SendImageAndRecordFailure({required this.erroemsg});

}