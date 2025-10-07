import 'dart:convert';

import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/services/shared_preferences_singleton.dart';
import 'package:fruit_shop/feature/auth/data/model/user_model.dart';
import 'package:fruit_shop/feature/auth/domain/entity/user_entity.dart';

UserEntity getUser() {
  final String? userData = Prefs.getString(kUserDataKey);
  if (userData == null || userData.isEmpty) {
    // Return a safe default guest user when no stored user exists.
    return UserEntity(name: 'Guest', email: 'guest@local', uid: '0');
  }

  final decoded = jsonDecode(userData);
  if (decoded is Map<String, dynamic>) {
    return UserModel.fromJson(decoded);
  }

  // If the stored data isn't a JSON object, return a guest user to avoid crashes.
  return UserEntity(name: 'Guest', email: 'guest@local', uid: '0');
}
