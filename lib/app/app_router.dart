import 'package:aviasales_clone/app/app_navbar.dart';
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../air_tickets/air_tickets.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/tickets',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return AppNavBar(
          navigationShell: navigationShell,
          key: GlobalKey(debugLabel: "RootScreen"),
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _sectionANavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/tickets',
              builder: (context, state) => const AirTicketsPage(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'stub',
                  builder: (context, state) => const AppStubPage('Заглушка'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/hotels',
              builder: (context, state) => const AppStubPage('Отели'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/location',
              builder: (context, state) => const AppStubPage('Короче'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/subscriptions',
              builder: (context, state) => const AppStubPage('Подписки'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/profile',
              builder: (context, state) => const AppStubPage('Профиль'),
            ),
          ],
        ),
      ],
    ),
  ],
);
