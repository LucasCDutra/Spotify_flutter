import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_flutter/data/models/song/song.dart';
import 'package:spotify_flutter/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSongs(String songId);
}

class SongFirebaseServiceImp extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    List<SongEntity> songs = [];

    try {
      var data =
          await FirebaseFirestore.instance.collection('Songs').orderBy('releaseDate', descending: true).limit(3).get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }

  @override
  Future<Either> getPlayList() async {
    List<SongEntity> songs = [];

    try {
      var data = await FirebaseFirestore.instance.collection('Songs').orderBy('releaseDate', descending: true).get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {
      var user = await firebaseAuth.currentUser;

      String uId = user!.uid;

      QuerySnapshot favoriteSongs = await firebaseFirestore
          .collection('Users')
          .doc(uId)
          .collection('Favorites')
          .where('songId', isEqualTo: songId)
          .get();
      return right(favoriteSongs);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }
}
