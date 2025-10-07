import 'package:fruit_shop/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_shop/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruit_shop/core/services/database_service.dart';
import 'package:fruit_shop/core/services/firebase_auth_service.dart';
import 'package:fruit_shop/core/services/firebase_firestore_service.dart';
import 'package:fruit_shop/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_shop/feature/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../repos/products_repo/products_repo.dart';
import '../repos/products_repo/products_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(databaseService: getIt<DatabaseService>()));
getIt.registerSingleton<OrdersRepo>(OrdersRepoImpl( getIt<DatabaseService>()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
    // AnotherAuthRepoImpl() ,
  );
}
