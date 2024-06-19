import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weza_app/core/recommended_movie_model.dart';
import 'package:weza_app/core/song_model.dart';

part 'send_image_and_record_state.dart';

class SendImageAndRecordCubit extends Cubit<SendImageAndRecordState> {
  SendImageAndRecordCubit() : super(SendImageAndRecordInitial());

  addImageAndRecordToGetTheRecommends(
      {required String imagePath, required String audioPath}) async {
    emit(SendImageAndRecordLoading());
    try {
      var response = await Dio().post('http://192.168.1.8/image',
          options: Options(headers: {
            'Content-Type': 'multipart/form-data',
          }),
          data: FormData.fromMap({
            'image':
                await MultipartFile.fromFile(imagePath, filename: 'photo.jpg'),
            'audio': await MultipartFile.fromFile(audioPath,
                filename: 'audio_record.wav'),
          }));
      if (response.statusCode == 200) {
      List<RecommendedMovie> movieslist = [];
      List<SongModel> songslist = [];
      for (int i = 0;
          i < response.data["recommended_movies"].toList().length;
          i++) {
        movieslist.add(RecommendedMovie.fromJson(
            response.data["recommended_movies"].toList()[i]));
      }
      for (int z = 0;
          z < response.data["recommended_songs"].toList().length;
          z++) {
        songslist.add(
            SongModel.fromjson(response.data["recommended_songs"].toList()[z]));
      }
      emit(SendImageAndRecordSucess(
          recommendedMovies: movieslist, recommendedSongs: songslist));
      } else if (response.statusCode == 400) {
      emit(SendImageAndRecordFailure(erroemsg: response.data['Error']));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badCertificate) {
        emit(SendImageAndRecordFailure(
            erroemsg: "Bad Certificate, Try again later"));
      } else if (e.type == DioExceptionType.sendTimeout) {
        emit(SendImageAndRecordFailure(erroemsg: "Sorry, Send Time Out"));
      } else if (e.type == DioExceptionType.connectionError) {
        emit(SendImageAndRecordFailure(erroemsg: "Connection Error"));
      } else if (e.type == DioExceptionType.connectionTimeout) {
        emit(SendImageAndRecordFailure(
            erroemsg: "Sorry, Connection Time Out"));
        
      } else if (e.type == DioExceptionType.receiveTimeout) {
        emit(
            SendImageAndRecordFailure(erroemsg: "Sorry, Recieve Time Out"));
      } else if (e.type == DioExceptionType.cancel) {
        emit(SendImageAndRecordFailure(
            erroemsg: "Sorry, The request has been cancelled"));
      }
    } catch (e) {
      emit(SendImageAndRecordFailure(erroemsg: 'Sorry, There was an error'));
    }
  }
}
