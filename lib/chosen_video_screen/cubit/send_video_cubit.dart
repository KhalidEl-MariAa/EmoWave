import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weza_app/core/recommended_movie_model.dart';
import 'package:weza_app/core/song_model.dart';

part 'send_video_state.dart';

class SendVideoCubit extends Cubit<SendVideoState> {
  SendVideoCubit() : super(SendVideoInitial());
  addVideoToGetTheRecommends({
    required String videoPath,
  }) async {
    emit(SendVideoLoading());
    try {
      var response = await Dio().post('http://192.168.1.8/video',
          options: Options(headers: {
            'Content-Type': 'multipart/form-data',
          }),
          data: FormData.fromMap({
            'video':
                await MultipartFile.fromFile(videoPath, filename: 'video.mp4'),
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
          songslist.add(SongModel.fromjson(
              response.data["recommended_songs"].toList()[z]));
        }
        emit(SendVideoSucess(
            recommendedMovies: movieslist, recommendedSongs: songslist));
      } else if (response.statusCode == 400) {
        emit(SendVideoFailure(errorMsg: response.data['Error']));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badCertificate) {
        emit(SendVideoFailure(errorMsg: "Bad Certificate, Try again later"));
      } else if (e.type == DioExceptionType.sendTimeout) {
        emit(SendVideoFailure(errorMsg: "Sorry, Send Time Out"));
      } else if (e.type == DioExceptionType.connectionError) {
        emit(SendVideoFailure(errorMsg: "Connection Error"));
      } else if (e.type == DioExceptionType.connectionTimeout) {
        emit(SendVideoFailure(errorMsg: "Sorry, Connection Time Out"));
      } else if (e.type == DioExceptionType.receiveTimeout) {
        emit(SendVideoFailure(errorMsg: "Sorry, Recieve Time Out"));
      } else if (e.type == DioExceptionType.cancel) {
        emit(SendVideoFailure(
            errorMsg: "Sorry, The request has been cancelled"));
      }
    } catch (e) {
      emit(SendVideoFailure(errorMsg: 'Sorry, There was an error'));
    }
  }
}
