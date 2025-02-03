import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artist;
  final String cover;
  final num duration;
  final String song;
  final Timestamp releaseDate;

  SongEntity({
    required this.title,
    required this.artist,
    required this.cover,
    required this.duration,
    required this.song,
    required this.releaseDate,
  });
}
