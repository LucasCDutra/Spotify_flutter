import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_flutter/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  String? cover;
  num? duration;
  String? song;
  Timestamp? releaseDate;

  SongModel({
    required this.title,
    required this.artist,
    required this.cover,
    required this.duration,
    required this.song,
    required this.releaseDate,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
    cover = data['cover'];
    song = data['song'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      cover: cover!,
      duration: duration!,
      song: song!,
      releaseDate: releaseDate!,
    );
  }
}
