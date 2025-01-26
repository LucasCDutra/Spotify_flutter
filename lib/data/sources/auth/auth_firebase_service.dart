import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_flutter/data/models/auth/create_user_request.dart';
import 'package:spotify_flutter/data/models/auth/singin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq SigninUserReq);
}

class AuthFirebaseServiceImp extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq SigninUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: SigninUserReq.email,
        password: SigninUserReq.password,
      );

      return const Right('SignIn was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provider for that user';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      return Right('Signup was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provider is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email';
      }
      return Left(message);
    }
  }
}
