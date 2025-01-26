import 'package:dartz/dartz.dart';
import 'package:spotify_flutter/core/usecase/usecase.dart';
import 'package:spotify_flutter/data/models/auth/create_user_request.dart';
import 'package:spotify_flutter/domain/repository/auth/auth.dart';
import 'package:spotify_flutter/service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
