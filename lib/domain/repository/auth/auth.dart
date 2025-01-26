import 'package:dartz/dartz.dart';
import 'package:spotify_flutter/data/models/auth/create_user_request.dart';
import 'package:spotify_flutter/data/models/auth/singin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}
