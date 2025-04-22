import 'package:dartz/dartz.dart';
import 'package:spotify_flutter/data/sources/songs/song_firebase_service.dart';
import 'package:spotify_flutter/domain/repository/song/song.dart';
import 'package:spotify_flutter/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSongs(songId);
  }
}
