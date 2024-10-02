import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shazam_clone/models/shazam_song_model.dart';
import 'package:shazam_clone/services/song_services.dart';

// HomeViewModel class extending ChangeNotifier
class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    initAcr();
  }

  final SongServices songServices = SongServices();
  final AcrCloudSdk acr = AcrCloudSdk();
  ShazamSongModel? currentSong;
  bool isRecognizing = false;
  bool success = false;

  Future<void> initAcr() async {
    try {
      acr
        ..init(
          host: 'identify-eu-west-1.acrcloud.com',
          accessKey: 'b13c90f8519e6509aa8901f6ff0bdbf9',
          accessSecret: 'Ytc7gMdGqK2W0jCdaw5mTp2OjTJnq91VZGUGkJhK',
          setLog: true,
        )
        ..songModelStream.listen(searchSong);
    } catch (e) {
      print(e.toString());
    }
  }

  void searchSong(SongModel song) async {
    final metaData = song.metadata;
    if (metaData != null && metaData.music!.isNotEmpty) {
      final trackId = metaData.music?[0].externalMetadata?.deezer?.track?.id;

      if (trackId != null) {
        try {
          final res = await songServices.getTrack(trackId);
          currentSong = res;
          success = true;
          print("Track fetched successfully: ${res.title}");
        } catch (e) {
          print("Error fetching track: ${e.toString()}");
          success = false;
        }
      }
    } else {
      print("No valid metadata found for the song.");
      success = false; // If no metadata, it's a failure
    }
    notifyListeners(); // Notify listeners after state change
  }

  Future<void> startRecognizing() async {
    if (!isRecognizing) {
      isRecognizing = true;
      success = false; // Reset success when starting recognition
      notifyListeners();
      try {
        await acr.start();
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<void> stopRecognizing() async {
    isRecognizing = false;
    notifyListeners();
    try {
      await acr.stop();
    } catch (e) {
      print(e.toString());
    }
  }
}

// Provider for HomeViewModel using Riverpod's ChangeNotifierProvider
final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel();
});
