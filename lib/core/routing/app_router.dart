import 'package:go_router/go_router.dart';

// Import other pages if you create separate ones

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[],
    // Optional: Add error page handling
    // errorBuilder: (context, state) => ErrorScreen(state.error),
  );
}
