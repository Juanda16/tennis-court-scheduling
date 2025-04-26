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

import 'core/constants/app_constants.dart';
import 'core/i18n/generated/translations.g.dart';
import 'core/routing/app_router.dart';
import 'core/style/style.dart';
import 'di/dependency_injection.dart' as di;

/// The main entry point of the application.
///
/// This function initializes Hive, registers necessary adapters, sets up
/// localization, configures dependencies using dependency injection, and starts
/// the Flutter application.
Future<void> main() async {
  // Ensure Flutter bindings are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and register the ScheduleModel adapter.
  await Hive.initFlutter();
  Hive.registerAdapter(ScheduleModelAdapter());

  // Set the app to use the device's locale.
  LocaleSettings.useDeviceLocale();

  // Configure dependency injection.
  di.configureDependencies();

  // Run the app with translation support.
  runApp(TranslationProvider(child: const MyApp()));
}

/// The root widget of the application.
///
/// This widget sets up the [MultiProvider] to provide various providers to the
/// widget tree. It also configures the [MaterialApp] with routing, theme,
/// localization, and other app-level settings.
class MyApp extends StatelessWidget {
  /// Creates a new instance of [MyApp].
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _createProviders(),
      child: _buildMaterialApp(context),
    );
  }

  /// Creates the list of [ChangeNotifierProvider] instances used in the app.
  ///
  /// This method encapsulates the creation of the providers, making the `build`
  /// method cleaner.
  List<ChangeNotifierProvider> _createProviders() {
    return [
      ChangeNotifierProvider(
        create: (context) => ScheduleProvider(
          di.getIt<IGetAllReservationsUseCase>(),
          di.getIt<IBookCourtUseCase>(),
          di.getIt<ICancelReservationUseCase>(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => CourtProvider(
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
    ];
  }

  /// Builds the [MaterialApp] widget with all necessary configurations.
  ///
  /// This method encapsulates the creation of the [MaterialApp] widget, making
  /// the `build` method cleaner.
  Widget _buildMaterialApp(BuildContext context) {
    return MaterialApp.router(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      title: appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
