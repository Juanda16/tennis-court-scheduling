import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/di/dependency_injection.config.dart';

final GetIt getIt = GetIt.instance; // Service Locator

@InjectableInit()
void configureDependencies() => getIt.init();
