import 'package:dartz/dartz.dart';
import 'package:fruit_shop/core/errors/failures.dart';
import 'package:fruit_shop/feature/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  );

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<Failure, UserEntity>> signInWithGoogle();
  // Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uid});
}
