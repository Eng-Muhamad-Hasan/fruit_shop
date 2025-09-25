import 'package:fruit_shop/core/services/database_service.dart';
import 'package:fruit_shop/core/services/firebase_auth_service.dart';
import 'package:fruit_shop/core/services/firestore_service.dart';
import 'package:fruit_shop/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_shop/feature/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
    // AnotherAuthRepoImpl() ,
  );
}
