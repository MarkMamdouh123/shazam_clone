import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shazam_clone/models/shazam_song_model.dart';

class SongServices {
  late Dio dio;

  SongServices({Duration? connectTimeout, Duration? receiveTimeout}) {
    BaseOptions options = BaseOptions(
      connectTimeout: connectTimeout ?? Duration(seconds: 10),
      receiveTimeout: receiveTimeout ?? Duration(seconds: 10),
      baseUrl: 'https://api.deezer.com/track/',
    );
    dio = Dio(options);
  }

  Future<ShazamSongModel> getTrack(String id) async {
    try {
      final response = await dio.get(id,
          options: Options(headers: {
            'Content-Type': 'application/json;charset=UTF-8',
            'Accept': 'application/json;charset=UTF-8',
          }));

      if (response.data != null) {
        return ShazamSongModel.fromJson(response.data);
      } else {
        throw 'No data found for the given track ID.';
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw 'An error occurred: ${e.response?.data}';
      } else {
        debugPrint(e.error.toString());
        throw 'An error occurred: ${e.error}';
      }
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }
}
