import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_shop/core/errors/exceptions.dart';
import 'package:fruit_shop/core/errors/failures.dart';
import 'package:fruit_shop/core/services/database_service.dart';
import 'package:fruit_shop/core/services/firebase_auth_service.dart';
import 'package:fruit_shop/core/utils/backend_endpoints.dart';
import 'package:fruit_shop/feature/auth/data/model/user_model.dart';
import 'package:fruit_shop/feature/auth/domain/entity/user_entity.dart';
import 'package:fruit_shop/feature/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  //you can use for switching between auth services : final AuthService authService;
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userEntity = UserEntity(email: email, name: name, uid: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('Error in AuthRepoImpl - createUserWithEmailAndPassword: $e');
      return left(ServerFailure("حدث خطأ ما، يرجى المحاولة وقت اخر"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userEntity = await getUserData(uid: user.uid);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Error in AuthRepoImpl - signInWithEmailAndPassword: $e');
      return left(ServerFailure("حدث خطأ ما، يرجى المحاولة وقت اخر"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      final userEntity = UserModel.fromFirebaseUser(user);
      bool isUserExist = await databaseService.checkIsDataExist(
        path: BackendEndpoints.getUserData,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await firebaseAuthService.deleteUser();

      log('Error in AuthRepoImpl - signInWithGoogle: ${e.toString()}');
      return left(
        ServerFailure(
          "حدث خطأ ما أثناء تسجيل الدخول باستخدام غوغل , يرجى المحاولة في وقت اخر",
        ),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoints.addUserData,
      data: user.toMap(),
      documentId: user.uid,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    final userData = await databaseService.getData(
      path: BackendEndpoints.getUserData,
      documentId: uid,
    );
    return UserModel.fromMap(userData);
  }

  // @override
  //   Future<Either<Failure, UserEntity>> signInWithFacebook() async {
  //     try {
  //       var user = await firebaseAuthService.signInWithFacebook();
  //       return right(UserModel.fromFirebaseUser(user));
  //     } catch (e) {
  //       log('Error in AuthRepoImpl - signInWithFacebook: ${e.toString()}');
  //       return left(
  //         ServerFailure(
  //           "حدث خطأ ما أثناء تسجيل الدخول باستخدام فيسبوك , يرجى المحاولة في وقت اخر",
  //         ),
  //       );
  //     }
  //   }
}

// class AnotherAuthRepoImpl extends AuthRepo {
//   @override
//   Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String name, String email, String password) {
//     // TODO: implement createUserWithEmailAndPassword
//     throw UnimplementedError();
//   }
// }
