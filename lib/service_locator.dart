import 'package:get_it/get_it.dart';
import 'package:spotify_flutter/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_flutter/data/sources/songs/song_firebase_service.dart';
import 'package:spotify_flutter/domain/repository/auth/auth.dart';
import 'package:spotify_flutter/domain/repository/song/song.dart';
import 'package:spotify_flutter/domain/usecases/auth/signin.dart';
import 'package:spotify_flutter/domain/usecases/auth/signup.dart';
import 'package:spotify_flutter/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_flutter/domain/usecases/song/get_play_list.dart';

import 'data/repository/song/song_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initilizeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImp());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImp());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  sl.registerSingleton<SignInUseCase>(SignInUseCase());

  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());

  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());
}
