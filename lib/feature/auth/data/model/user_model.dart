import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_shop/feature/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel( {
    required super.name,
    required super.email,
    required super.uid,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName??'',
      email: user.email??'',
      uid: user.uid,
    );
  
  }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ,
      email: map['email'] ,
      uid: map['uid'],
    );
  }
}
