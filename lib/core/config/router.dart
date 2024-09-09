import 'package:go_router/go_router.dart';

import '../../features/flight/pages/flight_add_page.dart';
import '../../features/flight/pages/flight_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/status_page.dart';
import '../../features/settings/pages/bonus_page.dart';
import '../../features/settings/pages/contact_page.dart';
import '../../features/settings/pages/notifications_page.dart';
import '../../features/settings/pages/profile_page.dart';
import '../../features/settings/pages/settings_page.dart';
import '../../features/splash/account_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => const AccountPage(),
    ),
    GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'status',
            builder: (context, state) => const StatusPage(),
          ),
        ]),
    GoRoute(
      path: '/bonus',
      builder: (context, state) => const BonusPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
      routes: [
        GoRoute(
          path: 'profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: 'notifications',
          builder: (context, state) => const NotificationsPage(),
        ),
        GoRoute(
          path: 'contact',
          builder: (context, state) => const ContactPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/flight',
      builder: (context, state) => const FlightPage(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const FlightAddPage(),
        ),
      ],
    ),
  ],
);
