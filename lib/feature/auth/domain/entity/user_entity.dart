class UserEntity {
  final String name;
  final String email;
  final String uid;

  UserEntity({required this.email, required this.name, required this.uid});

  toMap(){
    return {
      "email": email,
      "name": name,
      "uid": uid
    };
  }
}
