import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_shop/Feature/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uid});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uid: user.uid,
    );
  }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], email: map['email'], uid: map['uid']);
  }
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(name: user.name, email: user.email, uid: user.uid);
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }
  toMap() {
    return {'email': email, 'name': name, 'uid': uid};
  }
}
