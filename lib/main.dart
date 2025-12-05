import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_shop/Feature/home/presentation/cubit/products_cubit/products_cubit.dart';
import 'package:fruit_shop/Feature/home/presentation/cubit/profile-cubit/change_language_cubit.dart';
import 'package:fruit_shop/core/functions/on_generate_routes.dart';
import 'package:fruit_shop/core/repos/products_repo/products_repo.dart';
import 'package:fruit_shop/core/services/bloc_observer.dart';
import 'package:fruit_shop/core/services/get_it_service.dart';
import 'package:fruit_shop/core/services/shared_preferences_singleton.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/Feature/splash/presentation/view/splash_view.dart';
import 'package:fruit_shop/core/utils/get_initial_app_settings.dart';
import 'package:fruit_shop/firebase_options.dart';
import 'package:fruit_shop/generated/l10n.dart';
import 'Feature/home/presentation/cubit/cart/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  final appSettings = await getInitialAppSettings();
  runApp(MyApp(initialLanguage: appSettings.locale));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialLanguage});
  final Locale initialLanguage;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChangeLanguageCubit(initialLanguage)),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(
          create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
        ),
      ],
      child: BlocBuilder<ChangeLanguageCubit, Locale>(
        builder: (context, languageState) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: "Cairo",
              appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
              ),
            ),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: languageState,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
            initialRoute: SplashView.routeName,
          );
        },
      ),
    );
  }
}
