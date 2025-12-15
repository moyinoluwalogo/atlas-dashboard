import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/analytics/screens/analytics_screen.dart';
import '../../features/settings/screens/settings_screen.dart';

/// Application routing configuration
class AppRouter {
  static const String dashboard = '/';
  static const String analytics = '/analytics';
  static const String settings = '/settings';

  static final GoRouter router = GoRouter(
    initialLocation: dashboard,
    routes: [
      GoRoute(
        path: dashboard,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: analytics,
        builder: (context, state) => const AnalyticsScreen(),
      ),
      GoRoute(
        path: settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
}
