import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/explore_page.dart';
import 'pages/setting_page.dart';
import 'pages/details_page.dart';
import 'widgets/scaffold_with_nav_bar.dart';
import 'sevices/auth_service.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  refreshListenable: globalAuthService,
  redirect: (context, state) {
    final isLoggedIn = globalAuthService.isAuthenticated;
    final isGuardEnabled = globalAuthService.isAuthGuardEnabled;
    final isOnLoginPage = state.matchedLocation == '/login';

    if (!isGuardEnabled) {
      return null; // No redirection if auth guard is disabled
    }

    if (!isLoggedIn && !isOnLoginPage) {
      return '/login'; // Redirect to login if not logged in
    }

    if (isLoggedIn && isOnLoginPage) {
      return '/'; // Redirect to home if logged in and on login page
    }

    return null; // No redirection needed
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
              path: 'details', // Full URL path becomes: /details
              builder: (context, state) => const DetailsPage(),
              ),
            ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/explore',
              builder: (context, state) => const ExplorePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsPage(),
            ),
          ],
        ),
      ],
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Multi-Flow App',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}