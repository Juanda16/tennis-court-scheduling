import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/provider.dart';

import '../../scheduling/presentation/ui/views/dashboard/dashboard_view.dart';
import '../../scheduling/presentation/ui/views/login/login_view.dart';
import '../../scheduling/presentation/ui/views/new_schedule/new_schedule_view.dart';
import '../../scheduling/presentation/ui/views/onboarding/onboarding_view.dart';
import '../../scheduling/presentation/ui/views/register/register_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'dashboard',
            builder: (BuildContext context, GoRouterState state) {
              return DashboardView();
            },
          ),
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginView();
            },
          ),
          GoRoute(
            path: 'register',
            builder: (BuildContext context, GoRouterState state) {
              return const RegisterView();
            },
          ),
          GoRoute(
              path: 'new-schedule/:fieldId',
              builder: (BuildContext context, GoRouterState state) {
                final fieldId = state.pathParameters['fieldId'];
                final fields = context.read<FieldProvider>();
                final field = fields.fieldList
                    .firstWhere((element) => element.id == fieldId);
                return NewScheduleView(
                  field: field,
                );
              }),
        ],
      ),
    ],
  );
}

extension GoRouterExtension on GoRouter {
  void clearStackAndNavigate(String location) {
    while (canPop()) {
      pop();
    }
    pushReplacement(location);
  }
}
