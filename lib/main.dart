import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/schedule_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/authenticate_user.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/book_court.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/cancel_reservation.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/create_user.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_all_courts.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_all_reservations_use_case.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_current_location.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_current_user_use_case.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_weather_by_coordinates.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/set_current_user.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/favorites_provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/user_provider.dart';

import 'core/i18n/generated/translations.g.dart';
import 'core/routing/app_router.dart';
import 'core/style/style.dart';
import 'di/dependency_injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ScheduleModelAdapter());
  LocaleSettings.useDeviceLocale();
  di.configureDependencies();
  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ScheduleProvider(
              di.getIt<IGetAllReservationsUseCase>(),
              di.getIt<IBookCourtUseCase>(),
              di.getIt<ICancelReservationUseCase>(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => FieldProvider(
              di.getIt<IGetAllCourtsUseCase>(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => PositionProvider(
              getCurrentLocationUseCase: di.getIt<IGetCurrentLocationUseCase>(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => WeatherProvider(
              getWeatherByCoordinates: di.getIt<IGetWeatherByCoordinates>(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomNavigationBarProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserProvider(
              di.getIt<IGetCurrentUserUseCase>(),
              di.getIt<ISetCurrentUserUseCase>(),
              di.getIt<ICreateUser>(),
              di.getIt<IAuthenticateUserUseCase>(),
            ),
          ),
          ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ],
        child: MaterialApp.router(
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          title: 'Tennis Court',
          theme: AppTheme.baseTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        ),
      );
}
