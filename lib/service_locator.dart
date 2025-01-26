import 'package:get_it/get_it.dart';
import 'package:spotify_flutter/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_flutter/domain/repository/auth/auth.dart';
import 'package:spotify_flutter/domain/usecases/auth/signin.dart';
import 'package:spotify_flutter/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initilizeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImp());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  sl.registerSingleton<SignInUseCase>(SignInUseCase());
}
